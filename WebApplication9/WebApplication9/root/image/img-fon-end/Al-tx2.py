# Cài đặt đồ thị sử dụng danh sách kề (Adjacency List)
class Graph:
    def __init__(self):
        self.graph = {}

    # Thêm đỉnh vào đồ thị
    def add_vertex(self, vertex):
        if vertex not in self.graph:
            self.graph[vertex] = []

    # Thêm cạnh vào đồ thị
    def add_edge(self, from_vertex, to_vertex):
        if from_vertex in self.graph:
            self.graph[from_vertex].append(to_vertex)

    # Lấy danh sách kề của một đỉnh
    def get_adj_vertices(self, vertex):
        return self.graph.get(vertex, [])

# Tìm kiếm theo chiều sâu (DFS)
def dfs(graph, start, target, path):
    path.append(start)
    if start == target:
        return path
    for neighbor in graph.get_adj_vertices(start):
        if neighbor not in path:
            result = dfs(graph, neighbor, target, path)
            if result:
                return result
    path.pop()
    return None

# Tìm kiếm theo chiều rộng (BFS)
def bfs(graph, start, target):
    queue = [[start]]
    while queue:
        path = queue.pop(0)
        vertex = path[-1]
        if vertex == target:
            return path
        for neighbor in graph.get_adj_vertices(vertex):
            if neighbor not in path:
                new_path = list(path)
                new_path.append(neighbor)
                queue.append(new_path)
    return None

# Khởi tạo đồ thị từ hình ảnh
g = Graph()
nodes = ["A", "B", "C", "D", "M", "N", "L", "O", "P", "X", "Y", "U", "V", "I", "J", "R", "S", "G", "H"]

# Thêm các đỉnh
for node in nodes:
    g.add_vertex(node)

# Thêm các cạnh theo cây
edges = [
    ("A", "B"), ("A", "C"), ("A", "D"),
    ("B", "M"), ("B", "N"),
    ("C", "L"),
    ("D", "O"), ("D", "P"),
    ("M", "X"), ("M", "Y"),
    ("N", "U"),
    ("L", "V"),
    ("O", "I"),
    ("P", "J"),
    ("X", "R"), ("X", "S"),
    ("Y", "G"), ("U", "H")
]

for from_node, to_node in edges:
    g.add_edge(from_node, to_node)

# Chạy thử nghiệm tìm đường từ To đến Tg
start_node = "A"  # To
target_node = "H"  # Tg

dfs_path = dfs(g, start_node, target_node, [])
bfs_path = bfs(g, start_node, target_node)

dfs_path, bfs_path
