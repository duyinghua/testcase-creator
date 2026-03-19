#!/bin/bash

# 安装脚本：将 skill 拷贝到 CodeBuddy skills 目录
SKILLS_NAME="general-testcase"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$PROJECT_ROOT/$SKILLS_NAME"
TARGET_DIR="$HOME/.codebuddy/skills/$SKILLS_NAME"

echo "📦 安装 $SKILLS_NAME skill..."
echo "   源目录: $SOURCE_DIR"
echo "   目标目录: $TARGET_DIR"

# 创建目标目录
mkdir -p "$TARGET_DIR"

# 强制覆盖拷贝
cp -rf "$SOURCE_DIR"/* "$TARGET_DIR"/

echo "✅ 安装完成"
