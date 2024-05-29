# I used google colab to run the following code, since I had compatibility issues installing hashlib on my local device using Thonny

import hashlib

# Function to generate a hash for a given string
def hash_string(s):
    # Using SHA-256 algorithm to create a hash from the string
    return hashlib.sha256(s.encode()).hexdigest()

# Function to generate the Merkle root from a list of transactions
def generate_merkle_root(transactions):
    # Checking if there are transactions
    if len(transactions) == 0:
        return None

    # Generating hashes for each transaction
    transaction_hashes = [hash_string(tx) for tx in transactions]

    # Combining pairs of hashes recursively until a single hash (Merkle root) is obtained
    while len(transaction_hashes) > 1:
        # If the number of hashes is odd, duplicate the last hash to make it even
        if len(transaction_hashes) % 2 != 0:
            transaction_hashes.append(transaction_hashes[-1])

        # Create new hashes by combining pairs of hashes
        new_hashes = []
        for i in range(0, len(transaction_hashes), 2):
            # Combining consecutive hashes and hashing them again
            combined_hash = hash_string(transaction_hashes[i] + transaction_hashes[i+1])
            new_hashes.append(combined_hash)

        transaction_hashes = new_hashes

    return transaction_hashes[0] # Return the Merkle Tree Root

# Function to calculate the hash of the block attributes
def calculate_hash(previous_block_hash, merkle_root, nonce):
    # Concatenating block attributes to form a string
    block_string = f"{previous_block_hash}{merkle_root}{nonce}"
    # Generating hash for the block
    return hash_string(block_string)

# Function to mine the block by finding a valid nonce
def mine_block(previous_block_hash, merkle_root, target):
    nonce = 0
    # Incrementing nonce until a valid block hash is found
    while True:
        block_hash = calculate_hash(previous_block_hash, merkle_root, nonce)
        if block_hash < target:
            # Returning the valid block hash and nonce
            return block_hash, nonce
        nonce += 1

# Function to verify the block's validity
def verify_block(previous_block_hash, merkle_root, target, nonce):
    # Calculating hash of the block
    block_hash = calculate_hash(previous_block_hash, merkle_root, nonce)
    # Checking if the block hash meets the target criteria
    return block_hash < target, block_hash

# Defining our own data / transactions
transactions = [
    "tx1: Alice -> Bob: 10",
    "tx2: Bob -> Charlie: 5",
    "tx3: Charlie -> Dave: 3",
    "tx4: Dave -> Alice: 1"
]

previous_block_hash = "0000000000000000000767f1a45e8d64c90f40a3b4e6e9a0d2b7f5e6bc22fbe5"
target = "00000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"

# Generate Merkle root
merkle_root = generate_merkle_root(transactions)
print("Merkle Root:", merkle_root)

# Mine the block
block_hash, nonce = mine_block(previous_block_hash, merkle_root, target)
print("Block Hash:", block_hash)
print("Nonce:", nonce)

# Verify the block
is_valid, verified_block_hash = verify_block(previous_block_hash, merkle_root, target, nonce)
print("Is Block Valid:", is_valid)
print("Verified Block Hash:", verified_block_hash)
