#!/bin/bash

# Zsh Setup
# Installs zsh and sets it as the default shell.

echo "[Zsh] Installing zsh..."
sudo apt update
sudo apt install -y zsh

# Set zsh as the default shell for the current user
# Use `chsh` non-interactively
sudo chsh -s $(which zsh) $USER

echo "[Zsh] Zsh installed and set as default. Oh My Zsh is optional, but recommended."
