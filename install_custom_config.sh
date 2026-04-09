#!/bin/bash
set -e

ZSHRC="$HOME/.zshrc"

echo "--- 사용자 정의 Alias 및 환경 변수 설정 시작 ---"

# 중복 방지를 위한 블록 확인 및 추가 함수
add_to_zshrc() {
    local comment=$1
    local content=$2
    if ! grep -q "$comment" "$ZSHRC"; then
        echo -e "\n# $comment\n$content" >> "$ZSHRC"
        echo "Added: $comment"
    else
        echo "Skipped (Already exists): $comment"
    fi
}

# 1. ROS 2 및 Colcon 설정 추가
ROS_CONFIG='source /opt/ros/humble/setup.zsh
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"'
add_to_zshrc "ROS 2 Humble & Colcon Setup" "$ROS_CONFIG"

# 2. 필수 Alias (ROS 2, 시스템, Conda) 추가
USER_ALIASES='alias cbr="colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release"
alias cbp="colcon build --packages-select"
alias sor="source install/setup.zsh"
alias sorr="source ../../install/setup.zsh"
alias sr="source ~/.zshrc"
alias rlt="ros2 topic list"
alias rle="ros2 topic echo"
alias rli="ros2 topic info"
alias ril="ros2 interface list"
alias rill="ros2 interface list | grep"
alias rils="ros2 interface show"
alias rpe="ros2 pkg executables"

add_to_zshrc "User Custom Aliases" "$USER_ALIASES"

# 3. 환경 변수 (PATH, NVM) 설정 추가
ENV_CONFIG='export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
add_to_zshrc "Environment Variables & NVM" "$ENV_CONFIG"

echo "--- 설정 완료! 'source ~/.zshrc'를 입력하세요. ---"
