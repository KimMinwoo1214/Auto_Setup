#!/bin/bash

# C++ Libraries Setup
# Installs common C++ development libraries

echo "[C++ Libs] Installing build tools and common libraries..."
sudo apt update
sudo apt install -y \
    build-essential \
    cmake \
    g++ \
    gcc \
    gdb \
    libssl-dev \
    libusb-1.0-0-dev \
    libglib2.0-dev \
    libgtk-3-dev \
    eigen3-dev \
    libopencv-dev

echo "[C++ Libs] Done."
