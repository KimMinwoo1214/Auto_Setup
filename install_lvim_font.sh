#!/bin/bash
set -e

FONT_DIR="$HOME/.local/share/fonts"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"

echo "--- Nerd Font 설치를 시작합니다 ---"

# 필수 도구 확인
sudo apt update && sudo apt install -y wget unzip fontconfig

# 디렉토리 생성
mkdir -p "$FONT_DIR"

# 폰트 다운로드 및 설치
echo "Downloading JetBrainsMono Nerd Font..."
wget -O /tmp/font.zip "$FONT_URL"
unzip -o /tmp/font.zip -d "$FONT_DIR"
rm /tmp/font.zip

# 캐시 갱신
echo "Updating font cache..."
fc-cache -fv

echo "--- 폰트 설치 완료! 터미널 설정에서 'JetBrainsMono Nerd Font'를 선택하세요. ---"
