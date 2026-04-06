#!/bin/bash

# Base Utilities Setup
# Git, wget, vim, pip3, dconf-editor, xpad, simplescreenrecorder, inkscape, terminator, vlc

echo "[Base Utils] Installing core tools..."

# Update and install
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y \
    git \
    wget \
    vim \
    python3-pip \
    dconf-editor \
    xpad \
    simplescreenrecorder \
    inkscape \
    terminator \
    vlc \
    curl \
    lsb-release \
    gnupg2 \
    ca-certificates \
    apt-transport-https

echo "[Base Utils] Done."
