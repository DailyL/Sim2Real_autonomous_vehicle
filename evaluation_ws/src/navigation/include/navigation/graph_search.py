import numpy as np

from .search_classes import Path, SearchNode
from .utils import *


# Complete the definition of expand_node below
class GraphSearchProblem:
    def __init__(self, graph, start, goal):
        self.graph = graph
        self.start = start
        self.goal = goal

    def test_goal(self, state):
        return self.goal == state

    def expand_node(self, search_node):
        """Return a list of SearchNodes, having the correct state, parent and updated cost."""
        expanded_sn = []
        edges = self.graph.node_edges(search_node.state)
        for edge in edges:
            expanded_sn.append(
                SearchNode(edge.target, search_node, cost=edge.weight + search_node.cost, action=edge.action)
            )
        return expanded_sn

    def best_first_search(self, f):
        """Returns a solution path."""
        q = PriorityQueue(f=f)
        q.append(SearchNode(self.start))
        expanded = set([self.start])
        while q:
            search_node = q.pop()
            if self.test_goal(search_node.state):
                return Path(search_node)
            expanded.add(search_node)
            for child in self.expand_node(search_node):
                if (child not in q) and (child not in expanded):
                    q.append(child)
                elif child in q:
                    # look for a node in q with the same state as child, but different parent and cost.
                    previous_search_node = q[child]
                    if child.cost < previous_search_node.cost:
                        del q[previous_search_node]
                        q.append(child)
        # If we get to here, no solution has been found.
        return None

    def eucl_dist(self, a, b):
        """Returns the euclidean distance between a and b."""
        return np.sqrt((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2)

    def h_to_Goal(self, search_node):
        """Returns heuristics from search_node state to goal state"""
        return self.eucl_dist(
            self.graph.node_positions[search_node.state], self.graph.node_positions[self.goal]
        )

    def astar_search(self):
        """Returns path found by A*"""
        return self.best_first_search(lambda search_node: search_node.cost + self.h_to_Goal(search_node))
