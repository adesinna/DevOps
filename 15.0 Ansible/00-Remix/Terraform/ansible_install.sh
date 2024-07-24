#!/bin/bash

# Update the package list
sudo apt-get update

# Install software-properties-common if not already installed
sudo apt-get install -y software-properties-common

# Add Ansible PPA (Personal Package Archive)
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Update the package list again after adding the Ansible PPA
sudo apt-get update

# Install Ansible
sudo apt-get install -y ansible

# Verify the installation
ansible --version

# Output message indicating completion
echo "Ansible installation completed successfully."
