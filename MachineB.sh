#!/bin/bash

# Unzip the predefined scripts
unzip transfer.zip  transfer

# Wait for 5 seconds
sleep 5

# Run the first Python script
python decryptionrsa.py 

# Wait for 2 seconds
sleep 2

# Run the second Python script
python hashanddec.py  

# Wait for both Python scripts to finish


echo "Scripts executed after unzipping."

