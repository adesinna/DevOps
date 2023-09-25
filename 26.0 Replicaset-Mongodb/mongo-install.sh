#!/bin/bash

# Import the MongoDB public key
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

# Reload local package database
sudo apt-get update

# dependencies
sudo wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# Install the MongoDB packages
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod

# Verify MongoDB's status
sudo systemctl status mongod