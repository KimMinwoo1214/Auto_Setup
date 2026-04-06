#!/bin/bash

set -e # 에러 발생 시 즉시 중단

# 현재 스크립트가 있는 디렉토리 경로 가져오기
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "   Starting Automatic Computer Setup      "
echo "=========================================="

# 시스템 업데이트
echo "[System] Updating package lists..."
sudo apt update && sudo apt upgrade -y

# 현재 폴더의 모든 .sh 파일 실행
for script in "$SCRIPT_DIR"/*.sh; do
    # 1. 파일이 존재하는지
    # 2. 실행 가능한지
    # 3. 자기 자신(setup.sh)이 아닌지 확인
    if [ -f "$script" ] && [ -x "$script" ] && [ "$(basename "$script")" != "all_install.sh" ]; then
        echo "------------------------------------------"
        echo "[Running] $(basename "$script")"
        bash "$script"
    fi
done

echo "=========================================="
echo "   Setup Complete! Please restart.        "
echo "=========================================="
