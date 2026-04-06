#!/bin/bash
set -e

FONT_DIR="$HOME/.local/share/fonts"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
TERMINATOR_CONFIG="$HOME/.config/terminator/config"

echo "--- Nerd Font 설치 및 Terminator 자동 설정 시작 ---"

# 1. 필수 도구 확인 및 폰트 디렉토리 생성
sudo apt update && sudo apt install -y wget unzip fontconfig
mkdir -p "$FONT_DIR"

# 2. 폰트 다운로드 및 설치
if [ ! -f "$FONT_DIR/JetBrainsMonoNerdFont-Regular.ttf" ]; then
    echo "Downloading JetBrainsMono Nerd Font..."
    wget -O /tmp/font.zip "$FONT_URL"
    unzip -o /tmp/font.zip -d "$FONT_DIR"
    rm /tmp/font.zip
    # 캐시 갱신
    echo "Updating font cache..."
    fc-cache -fv
else
    echo "Font already installed. Skipping download."
fi

# 3. Terminator 설정 파일 수정 (코드 기반 자동화)
if [ -f "$TERMINATOR_CONFIG" ]; then
    echo "Configuring Terminator font settings..."
    
    # 'use_system_font'를 False로 변경 (이미 있으면 수정, 없으면 추가)
    if grep -q "use_system_font" "$TERMINATOR_CONFIG"; then
        sed -i 's/use_system_font = True/use_system_font = False/' "$TERMINATOR_CONFIG"
    else
        # [[default]] 섹션 바로 아래에 추가
        sed -i '/\[\[default\]\]/a \    use_system_font = False' "$TERMINATOR_CONFIG"
    fi

    # 'font' 설정을 JetBrainsMono로 변경 (이미 있으면 수정, 없으면 추가)
    if grep -q "font =" "$TERMINATOR_CONFIG"; then
        sed -i 's/font = .*/font = JetBrainsMono Nerd Font Mono 13/' "$TERMINATOR_CONFIG"
    else
        sed -i '/\[\[default\]\]/a \    font = JetBrainsMono Nerd Font Mono 13' "$TERMINATOR_CONFIG"
    fi
    
    echo "Terminator configuration updated successfully."
else
    echo "Terminator config not found. Please run Terminator at least once first."
fi

echo "--- 모든 과정 완료! Terminal을 완전히 껐다 켜주세요. ---"
