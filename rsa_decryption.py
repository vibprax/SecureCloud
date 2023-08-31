from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding

# Load private key of Machine B
with open('private_key.pem', 'rb') as key_file:
    private_key = serialization.load_pem_private_key(
        key_file.read(),
        password=None,  # No password protection
        backend=None    # Use the default backend
    )

# Load the received cipher_text
with open('encrypted_file.bin', 'rb') as file:
    encrypted_data = file.read()

# Decrypt the encrypted data using RSA
decrypted_data = private_key.decrypt(
    encrypted_data,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(),
        label=None
    )
)

# Write the decrypted data to a new file
with open('decrypted_file.txt', 'wb') as file:
    file.write(decrypted_data)

