class SearchNode:
    def __init__(self, state, parent_node=None, cost=0.0, action=None):
        self._parent = parent_node
        self._state = state
        self._action = action
        self._cost = cost

    def __repr__(self):
        return (
            f"<SearchNode (id: {id(self)})| state: {self.state}, cost: {self.cost}, parent_id: "
            f"{id(self.parent)}>"
        )

    def expand(self, graph):
        """Returns new search nodes pointing to each children state of the state represented by this node."""
        return [SearchNode(state, self) for state in graph.children_of(self.state)]

    @property
    def state(self):
        """Get the state represented by this SearchNode"""
        return self._state

    @property
    def parent(self):
        """Get the parent search node that we are coming from."""
        return self._parent

    @property
    def cost(self):
        """Get the cost to this search state"""
        return self._cost

    @property
    def action(self):
        """Get the action that was taken to get from parent to the state represented by this node."""
        return self._action

    def __eq__(self, other):
        return isinstance(other, SearchNode) and self._state == other._state

    def __hash__(self):
        return hash(self._state)


class Path:
    """This class computes the path from the starting state until the state specified by the search_node
    parameter by iterating backwards."""

    def __init__(self, search_node):
        self.path = []
        self.actions = []
        node = search_node
        while node is not None:
            self.path.append(node.state)
            if node.action != None:
                self.actions.append(node.action)
            node = node.parent
        self.path.reverse()
        self.actions.reverse()
        self.cost = search_node.cost

    def __repr__(self):
        return (
            f"Number of nodes: {len(self.path)}\nTotal cost: {self.cost:.3f}\nNodes: "
            f"{self.path}\nActions: {self.actions}"
        )

    def edges(self):
        return list(zip(self.path[0:-1], self.path[1:]))

    def display(self, graph):
        dot_graph = graph._create_dot_graph()
        for n in dot_graph.get_nodes():
            if n.get_name() == self.path[0]:
                n.set_color("blue")
            elif n.get_name() == self.path[-1]:
                n.set_color("green")
            elif n.get_name() in self.path:
                n.set_color("red")
        edges = self.edges()
        for e in dot_graph.get_edges():
            if (e.get_source(), e.get_destination()) in edges:
                e.set_color("red")
        dot_graph.set_concentrate(False)
        display_svg(dot_graph.create_svg(), raw=True)  # FIXME
