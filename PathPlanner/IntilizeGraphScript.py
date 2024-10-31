def int_to_bin_str(value, bits):
    """Convert an integer to a binary string with leading zeros."""
    return format(value, f'0{bits}b')

def weight_to_binary(weight):
    """Convert weight (1-4) to a 2-bit binary string."""
    return int_to_bin_str(weight - 1, 2)  # Adjust to make 1 = 00, 2 = 01, 3 = 10, 4 = 11

def main():
    # Prompt for number of nodes (2 bits)
    num_nodes = int(input("Enter the number of nodes (1-4): "))
    
    if num_nodes < 1 or num_nodes > 4:
        print("Invalid number of nodes. Please enter a value between 1 and 4.")
        return
    
    # Start building the binary representation
    binary_representation = int_to_bin_str(num_nodes - 1, 2)  # First 2 bits for number of nodes (0-3)

    # Collect node IDs and weights
    for i in range(num_nodes):
        # Input for node ID (5 bits)
        while True:
            node_id = int(input(f'Enter node ID for node {i + 1} (0-31): '))
            if 0 <= node_id <= 31:
                break
            else:
                print("Invalid node ID. Please enter a value between 0 and 31.")
        
        # Input for weight (1-4)
        while True:
            weight = int(input(f'Enter weight for node {i + 1} (1-4): '))
            if 1 <= weight <= 4:
                break
            else:
                print("Invalid weight. Please enter a value between 1 and 4.")

        # Append binary representations
        binary_representation += int_to_bin_str(node_id, 5)  # 5 bits for node ID
        binary_representation += weight_to_binary(weight)    # 2 bits for weight

    # Ensure the binary representation is 32 bits long by padding with zeros
    binary_representation = binary_representation.ljust(32, '0')

    # Display the complete binary representation
    print(f'Complete 32-bit binary representation: {binary_representation}')

if __name__ == "__main__":
    main()
