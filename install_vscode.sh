#!/bin/bash

# VS Code Setup
# Adds Microsoft repo and installs code

echo "[VS Code] Adding Microsoft repo..."
# Install requirements
sudo apt install -y gpg

# Download and install the GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Add the VS Code repo
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

# Cleanup
rm /tmp/packages.microsoft.gpg

echo "[VS Code] Installing code..."
sudo apt update
sudo apt install -y code

echo "[VS Code] Done."
