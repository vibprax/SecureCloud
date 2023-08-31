from cryptography.fernet import Fernet
import subprocess

def calculate_sha256_hash(filename):
    try:
        result = subprocess.run(["sha256sum", filename], capture_output=True, text=True, check=True)
        hash_output = result.stdout.split()[0]  # Extract the hash value from the output
        return hash_output
    except subprocess.CalledProcessError:
        return None

def read_hash_from_file(hash_filename):
    try:
        with open(hash_filename, "r") as file:
            return file.readline().strip()
    except FileNotFoundError:
        return None

if __name__ == "__main__":
    # Decryption code
    with open('/root/decrypted/decryptedkey_data.txt', 'rb') as key_file:
        key = key_file.read()

    cipher_suite = Fernet(key)

    with open('/root/transfer/encrypted.bin', 'rb') as encrypted_file:
        encrypted_data = encrypted_file.read()

    decrypted_data = cipher_suite.decrypt(encrypted_data)

    with open('decrypted_file.sql', 'wb') as decrypted_file:
        decrypted_file.write(decrypted_data)

    print("File decrypted and saved.")

    # Hash verification code
    decrypted_filename = "decrypted_file.sql"  # Replace with the actual decrypted file name
    hash_filename = "/root/decryption/decryptedhash_data.txt"   # Replace with the hash file's name

    calculated_hash = calculate_sha256_hash(decrypted_filename)
    stored_hash = read_hash_from_file(hash_filename)

    if calculated_hash and stored_hash:
        if calculated_hash == stored_hash:
            print("File integrity verified.")
        else:
            print("File integrity check failed: Hash mismatch.")
    else:
        print("Error calculating or reading hash value.")

