import subprocess
from cryptography.fernet import Fernet

def calculate_sha256_hash(filename):
    try:
        result = subprocess.run(["sha256sum", filename], capture_output=True, text=True, check=True)
        hash_output = result.stdout.split()[0]  # Extract the hash value from the output
        return hash_output
    except subprocess.CalledProcessError:
        return None

def save_hash_to_file(hash_value, output_filename):
    with open(output_filename, "w") as file:
        file.write(hash_value)

def encrypt_file(input_filename, output_filename):
    key = Fernet.generate_key()
    with open('/root/unencrypted/key.txt', 'wb') as key_file:
        key_file.write(key)

    cipher_suite = Fernet(key)

    with open(input_filename, 'rb') as file:
        plaintext = file.read()
        encrypted_data = cipher_suite.encrypt(plaintext)

    with open(output_filename, 'wb') as encrypted_file:
        encrypted_file.write(encrypted_data)

if __name__ == "__main__":
    input_filename = "/root/Kappa_hospital.zip" # Replace with the actual path to your file
    hash_output_filename = "/root/unencrypted/hash.txt"  # Replace with the desired output filename for the hash
    encrypted_output_filename = "/root/transfer/encrypted.bin"  # Replace with the desired output filename for the encrypted file

    hash_value = calculate_sha256_hash(input_filename)
    if hash_value:
        save_hash_to_file(hash_value, hash_output_filename)
        print(f"Hash value saved to {hash_output_filename}")
    else:
        print("Error calculating hash value.")

    encrypt_file(input_filename, encrypted_output_filename)
    print(f"File encrypted and saved to {encrypted_output_filename}")

