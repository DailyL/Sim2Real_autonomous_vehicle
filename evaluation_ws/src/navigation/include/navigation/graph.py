import graphviz


class NodeNotInGraph(Exception):
    def __init__(self, node):
        self.node = node

    def __str__(self):
        return f"Node {self.node} not in graph."


class Edge:
    def __init__(self, source, target, weight=1.0, action=None):
        self.source = source
        self.target = target
        self.weight = weight
        self.action = action

    def __hash__(self):
        return hash(f"{self.source}_{self.target}_{self.weight}_{self.action}")

    def __eq__(self, other):
        return (
            self.source == other.source
            and self.target == other.target
            and self.weight == other.weight
            and self.action == other.action
        )

    def __repr__(self):
        return f"Edge({self.source!r},{self.target!r},{self.weight!r},{self.action!r})"


class Graph:
    def __init__(self, node_label_fn=None):
        self._nodes = set()
        self._edges = dict()
        self.node_label_fn = node_label_fn if node_label_fn else lambda x: x
        self.node_positions = dict()

    def __contains__(self, node):
        return node in self._nodes

    def add_node(self, node):
        """Adds a node to the graph."""
        self._nodes.add(node)

    def add_edge(self, node1, node2, weight=1.0, action=None, bidirectional=False):
        """Adds an edge between node1 and node2. Adds the nodes to the graph first
        if they don't exist."""
        self.add_node(node1)
        self.add_node(node2)
        node1_edges = self._edges.get(node1, set())
        node1_edges.add(Edge(node1, node2, weight, action))
        self._edges[node1] = node1_edges
        if bidirectional:
            node2_edges = self._edges.get(node2, set())
            node2_edges.add(Edge(node2, node1, weight, action))
            self._edges[node2] = node2_edges

    def set_node_positions(self, positions):
        self.node_positions = positions

    def set_node_pos(self, node, pos):
        """Sets the (x,y) pos of the node, if it exists in the graph."""
        if not node in self:
            raise NodeNotInGraph(node)
        self.node_positions[node] = pos

    def get_node_pos(self, node):
        if not node in self:
            raise NodeNotInGraph(node)
        return self.node_positions[node]

    def node_edges(self, node):
        if not node in self:
            raise NodeNotInGraph(node)
        return self._edges.get(node, set())

    def draw(
        self, script_dir, highlight_edges=None, show_weights=None, map_name="duckietown", highlight_nodes=None
    ):
        if highlight_nodes:
            start_node = highlight_nodes[0]
            target_node = highlight_nodes[1]
        else:
            start_node = target_node = None

        g = graphviz.Digraph(name="duckietown", engine="neato")
        g.edge_attr.update(fontsize="8", arrowsize="0.5", arrowhead="open")
        g.node_attr.update(shape="circle", fontsize="14", margin="0", height="0")
        # g.graph_attr.update(ratio = '0.7', inputscale = '1.3')

        g.body.append(r'label = "\nduckiegraph"')
        g.body.append("fontsize=16")

        for node in self._nodes:
            node_name = self.node_label_fn(node)
            node_pos = f"{self.node_positions[node][0]},{self.node_positions[node][1]}!"
            if highlight_nodes and node == target_node:
                g.node(name=node_name, pos=node_pos, color="magenta", shape="circle")  # green
            elif highlight_nodes and node == start_node:
                g.node(name=node_name, pos=node_pos, color="red", shape="circle")  # blue
            elif node_name[0:4] == "turn":
                g.node(
                    name=node_name,
                    pos=node_pos,
                    fixedsize="true",
                    width="0",
                    height="0",
                    style="invis",
                    label="",
                )
            elif (int(node_name) % 2) == 0:
                g.node(
                    name=node_name,
                    pos=node_pos,
                    fixedsize="true",
                    width="0",
                    height="0",
                    style="invis",
                    label="",
                )
            else:
                g.node(name=node_name, pos=node_pos)
        for src_node, edges in list(self._edges.items()):
            for e in edges:
                if show_weights:
                    t = str(e.weight)
                else:
                    t = ""

                if (
                    highlight_edges
                    and (self.node_label_fn(src_node), self.node_label_fn(e.target)) in highlight_edges
                ):
                    c = "cyan"  # red
                    p = "3.0"
                else:
                    c = "black"
                    p = "1.5"

                g.edge(
                    self.node_label_fn(src_node),
                    self.node_label_fn(e.target),
                    taillabel=t,
                    color=c,
                    penwidth=p,
                )

        # script_dir = os.path.dirname(__file__)
        map_path = script_dir + "/maps/"
        g.format = "png"
        g.render(filename=map_name, directory=map_path, view=False, cleanup=True)
