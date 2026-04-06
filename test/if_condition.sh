#!/bin/bash
set -e

main() {
  # 입력값이 비어있는지 확인
  if [ -z "$1" ]; then
    echo "[Error] 인자를 입력해주세요 (예: bash 또는 zsh)"
    return 1
  fi

  # 첫 번째 인자를 소문자로 변환 (입력 편의성)
  local shell_type=$(echo "$1" | tr '[:upper:]' '[:lower:]' )

  if [ "$shell_type" = "bash" ]; then
    echo ">> 'Bash' 설정 모드입니다."
    # echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
  elif [ "$shell_type" = "zsh" ]; then
    echo ">> 'Zsh' 설정 모드입니다."
    # echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
  else
    echo "[Warning] 알 수 없는 입력: $1 (bash/zsh만 가능)"
  fi 
}

# 모든 인자 대신 첫 번째 인자($1)만 전달
main "$1"
