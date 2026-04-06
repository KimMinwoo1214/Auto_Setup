#!/bin/bash
set -e

# 0. 경로 및 권한 설정
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # 스크립트 위치 자동 인식

# sudo 권한 체크 (Docker 등 sudo가 없는 환경 고려)
if command -v sudo >/dev/null 2>&1; then SUDO="sudo"; else SUDO=""; fi

# 색상 정의
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}==========================================${NC}"
echo -e "${GREEN}   Starting LunarVim & Neovim 0.10.2 Setup ${NC}"
echo -e "${GREEN}==========================================${NC}"

# 1. Neovim 0.10.2 설치
echo -e "${GREEN}[1/6] Installing Neovim v0.10.2...${NC}"
wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
$SUDO rm -rf /usr/local/nvim-linux64 # 기존 설치 제거
$SUDO mv nvim-linux64 /usr/local/
$SUDO ln -sf /usr/local/nvim-linux64/bin/nvim /usr/bin/nvim
rm nvim-linux64.tar.gz

# 2. 필수 패키지 설치 (Python, Clipboard, Build 도구)
echo -e "${GREEN}[2/6] Installing dependencies...${NC}"
$SUDO apt update || true # PPA 에러 방지
$SUDO apt upgrade -y
$SUDO apt-get install -y python3-pip xclip xsel build-essential git curl fontconfig

# 3. Node.js 설치 (n을 이용한 깔끔한 설치)
echo -e "${GREEN}[3/6] Installing Node.js (LTS)...${NC}"
$SUDO apt-get install -y nodejs npm
$SUDO npm install -g n
$SUDO n lts
hash -r # 현재 세션 반영

# 4. Rust (Cargo) 설치 - 무인 설치 모드
echo -e "${GREEN}[4/6] Installing Rust...${NC}"
if ! command -v cargo &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
fi

# 5. Ripgrep 설치
echo -e "${GREEN}[5/6] Installing Ripgrep...${NC}"
RIPI_VERSION="14.1.0"
curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${RIPI_VERSION}/ripgrep_${RIPI_VERSION}-1_amd64.deb"
$SUDO dpkg -i "ripgrep_${RIPI_VERSION}-1_amd64.deb"
rm "ripgrep_${RIPI_VERSION}-1_amd64.deb"

# 6. LunarVim 설치
echo -e "${GREEN}[6/6] Installing LunarVim (rolling)...${NC}"
# pynvim 설치 (LSP 연동용)
pip3 install --user pynvim || true 

LV_BRANCH='rolling' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install.sh) --yes

echo -e "${GREEN}==========================================${NC}"
echo -e "${GREEN}   Setup Complete! Please restart terminal. ${NC}"
echo -e "${GREEN}==========================================${NC}"
