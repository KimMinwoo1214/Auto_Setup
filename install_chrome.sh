#!/bin/bash

# Chrome Setup
# Downloads and installs google-chrome-stable

echo "[Chrome] Downloading google-chrome-stable..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb

echo "[Chrome] Installing google-chrome-stable..."
# Use `apt install` to handle dependencies automatically
sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb

# Cleanup
rm /tmp/google-chrome-stable_current_amd64.deb

echo "[Chrome] Done."
