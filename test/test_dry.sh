#!/bin/bash
set -e

# DRY_RUN 변수가 true면 실제 명령 대신 echo만 합니다.
DRY_RUN=true 

run_cmd() {
  if [ "$DRY_RUN" = true ]; then
    echo "[Simulation] Executing: $*"
  else
    eval "$*"
  fi
}

main() {
  if [ -z "$1" ]; then
    echo "[Error] 인자를 입력해주세요."
    return 1
  fi

  local shell_type=$(echo "$1" | tr '[:upper:]' '[:lower:]')

  if [ "$shell_type" = "bash" ]; then
    echo ">> 'Bash' 설정 모드"
    # 실제 파일에 쓰는 대신 run_cmd를 통해 출력만 확인
    run_cmd "echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc"
  elif [ "$shell_type" = "zsh" ]; then
    echo ">> 'Zsh' 설정 모드"
    run_cmd "echo 'source /opt/ros/noetic/setup.zsh' >> ~/.zshrc"
  fi
}

main "$1"
