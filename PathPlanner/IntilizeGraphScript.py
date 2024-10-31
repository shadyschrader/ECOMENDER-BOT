class NodeData:
    def __init__(self):
        self.connection_count = 0  # Number of connections (0-4)
        self.connections = []       # List of dictionaries for connections

    def add_connection(self, node, weight):
        if len(self.connections) < 4:  # Limit to 4 connections
            self.connections.append({'node': node, 'weight': weight})

    def __repr__(self):
        # Generate string representation for node connections
        output = f'graph[0].connection_count = {self.connection_count};\n'
        for idx, conn in enumerate(self.connections, start=1):
            output += f'graph[0].connections.conn{self.connection_count}.node{idx} = {conn["node"]};\n'
            output += f'graph[0].connections.conn{self.connection_count}.weight{idx} = {conn["weight"]};\n'
        return output


def main():
    # Array for 32 nodes
    graph = [NodeData() for _ in range(32)]

    # Loop through each node to get data
    for i in range(32):
        count = int(input(f'Enter number of connections for node {i} (0-4): '))
        
        if count < 0 or count > 4:
            print("Invalid number of connections. Please enter between 0 and 4.")
            continue
        
        graph[i].connection_count = count

        for j in range(count):
            node = int(input(f'Enter connected node ID for connection {j + 1}: '))
            weight = int(input(f'Enter weight (0-3) for connection {j + 1}: '))
            graph[i].add_connection(node, weight)

        # Display packed data for the current node
        print(graph[i])


if __name__ == "__main__":
    main()
