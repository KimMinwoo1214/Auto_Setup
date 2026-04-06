#!/bin/bash
set -e

git config --global user.name "KimMinwoo1214"
git config --global user.email werkm1214@hanyang.ac.kr

git config --global init.defaultBranch main

git config --global commit.gpgSign false

git config --global core.editor "vim"  # 또는 "nano", "code" (VS Code)
git config --global color.ui auto

git config --global core.autocrlf input  # macOS/Linux
