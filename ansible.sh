#!/bin/bash
# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or use sudo."
    exit 1
fi
echo "Updating system packages..."
apt update -y
echo "Installing required dependencies..."
apt install -y software-properties-common
echo "Adding Ansible PPA..."
add-apt-repository --yes --update ppa:ansible/ansible
echo "Installing Ansible..."
apt install -y ansible
echo "Verifying Ansible installation..."
if command -v ansible >/dev/null 2>&1; then
    echo "Ansible successfully installed!"
    ansible --version
else
    echo "Ansible installation failed!"
    exit 1
fi
