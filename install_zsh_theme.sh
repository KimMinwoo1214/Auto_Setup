#!/bin/bash
set -e

# 도구 존재 확인 함수
command_exists() {
  command -v "$@" >/dev/null 2>&1
}

# Sudo 권한 확인
user_can_sudo() {
  command_exists sudo || return 1
  ! LANG=C sudo -n -v 2>&1 | grep -q "may not run sudo"
}

SUDO=$(user_can_sudo && echo "sudo" || echo "")

echo "--- Oh My Zsh 및 테마/플러그인 설정 시작 ---"

# 1. Oh My Zsh 무인 설치 (이미 설치되어 있으면 건너뜀)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 2. 필수 패키지 설치 (fasd, fonts-powerline)
$SUDO apt-get update
$SUDO apt-get install -y fasd fonts-powerline

# 3. 플러그인 다운로드
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

echo "Downloading plugins..."
# zsh-autosuggestions
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# zsh-syntax-highlighting
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# fzf 설치 (md 파일 가이드 반영)
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# 4. .zshrc 설정 자동 변경 (sed 활용)
echo "Configuring .zshrc..."

# 테마 변경: robbyrussell -> af-magic
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="af-magic"/' ~/.zshrc

# 플러그인 리스트 업데이트
# 기본 plugins=(git) 부분을 찾아서 요청하신 리스트로 교체합니다.
sed -i 's/plugins=(git)/plugins=(git sudo colored-man-pages zsh-syntax-highlighting zsh-autosuggestions fzf fasd)/' ~/.zshrc

# 5. fasd 초기화 코드 추가 (파일 끝에 없으면 추가)
if ! grep -q "fasd --init" ~/.zshrc; then
    echo 'eval "$(fasd --init auto)"' >> ~/.zshrc
fi

echo "--- 설정 완료! ---"
echo "터미널을 재시작하거나 'source ~/.zshrc'를 실행하세요."
