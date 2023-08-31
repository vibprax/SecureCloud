from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
import os

def encrypt_data(public_key_path, file_path, encrypted_file_path):
    # Load public key
    with open(public_key_path, 'rb') as key_file:
        public_key = serialization.load_pem_public_key(
            key_file.read(),
            backend=None  # Use the default backend
        )

    # Read the contents of the file to be encrypted
    with open(file_path, 'rb') as file:
        data_to_encrypt = file.read()

    # Encrypt the data using RSA
    cipher_text = public_key.encrypt(
        data_to_encrypt,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )

    # Write the encrypted data to the new file
    with open(encrypted_file_path, 'wb') as file:
        file.write(cipher_text)

if __name__ == "__main__":
    public_key_path = '/root/key/public_key_machine_b.pem'  # Replace with actual public key path

    # Encryption for enkey.txt
    file_path1 = '/root/unencrypted/key.txt'  # Replace with actual file path
    encrypted_file_path1 = '/root/transfer/encryptedkey_data.bin'
    encrypt_data(public_key_path, file_path1, encrypted_file_path1)
    print(f"Data encrypted and saved to {encrypted_file_path1}")

    # Encryption for hash
    file_path2 = '/root/unencrypted/hash.txt'  # Replace with actual file path
    encrypted_file_path2 = '/root/transfer/encryptedhash_data.bin'
    encrypt_data(public_key_path, file_path2, encrypted_file_path2)
    print(f"Data encrypted and saved to {encrypted_file_path2}")


