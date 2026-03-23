#!/bin/bash

# 安装脚本：将 skill 拷贝到指定的 skills 目录
#
# 用法：
#   sh bin/install.sh              # 默认安装到 ~/.codebuddy/skills/*
#   sh bin/install.sh ~/.openclaw  # 安装到 ~/.openclaw/skills/*
#   sh bin/install.sh -t /custom/path  # 同上，通过 -t 指定
#
# 参数：
#   -t, --target <dir>  指定安装基础目录（不含 skills 子目录）

set -e

readonly SKILL_NAME="testcase-creator"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$PROJECT_ROOT/$SKILL_NAME"

# 默认安装到 ~/.codebuddy
DEFAULT_BASE="$HOME/.codebuddy"
TARGET_BASE="$DEFAULT_BASE"

# 解析参数
while [[ $# -gt 0 ]]; do
    case "$1" in
        -t|--target)
            TARGET_BASE="$2"
            shift 2
            ;;
        -h|--help)
            echo "用法: $0 [-t|--target <dir>] [目标目录]"
            echo ""
            echo "参数："
            echo "  -t, --target <dir>  指定安装基础目录（不含 skills 子目录）"
            echo "  -h, --help          显示帮助信息"
            echo ""
            echo "示例："
            echo "  $0                      # 安装到 ~/.codebuddy/skills/*"
            echo "  $0 ~/.openclaw         # 安装到 ~/.openclaw/skills/*"
            echo "  $0 -t ~/.openclaw       # 同上"
            exit 0
            ;;
        -*)
            echo "未知选项: $1"
            echo "使用 -h 查看帮助"
            exit 1
            ;;
        *)
            # 位置参数作为目标目录
            TARGET_BASE="$1"
            shift
            ;;
    esac
done

TARGET_DIR="$TARGET_BASE/skills/$SKILL_NAME"

echo "📦 安装 $SKILL_NAME skill..."
echo "   源目录: $SOURCE_DIR"
echo "   目标目录: $TARGET_DIR"

# 创建目标目录
mkdir -p "$TARGET_DIR"

# 强制覆盖拷贝
cp -rf "$SOURCE_DIR"/* "$TARGET_DIR/"

echo "✅ 安装完成"
