#!/bin/bash

# Miniconda Setup
# Downloads and installs Miniconda3 in silent mode

echo "[Miniconda] Downloading Miniconda installer..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh

echo "[Miniconda] Installing Miniconda..."
# Silent installation
bash /tmp/miniconda.sh -b -p $HOME/miniconda3

# Cleanup
rm /tmp/miniconda.sh

echo "[Miniconda] Initializing Miniconda..."
# Run conda init for bash and zsh
$HOME/miniconda3/bin/conda init bash
$HOME/miniconda3/bin/conda init zsh

echo "[Miniconda] Done. Please restart your shell to use conda."
