#!/bin/bash
set -e

# 查詢遠端最新版
LATEST=$(npm info @anthropic-ai/claude-code version 2>/dev/null | tail -1)
# 查詢本地 global 安裝版本
LOCAL=$(npm list -g @anthropic-ai/claude-code --depth=0 2>/dev/null | grep '@anthropic-ai/claude-code@' | sed -E 's/.*@([0-9.]+)$/\1/' | head -1)

if [ -z "$LOCAL" ]; then
  echo "[Claude Code] 尚未安裝，將安裝最新版 $LATEST..."
  npm install -g @anthropic-ai/claude-code@latest && echo "[Claude Code] 安裝完成：$LATEST"
  exit 0
fi

echo "[Claude Code] 本地版本：$LOCAL，遠端最新版：$LATEST"
if [ "$LOCAL" = "$LATEST" ]; then
  echo "[Claude Code] 已經是最新版"
else
  echo "[Claude Code] 檢測到新版本，開始自動升級..."
  if npm install -g @anthropic-ai/claude-code@latest; then
    echo "[Claude Code] 升級完成，已更新至 $LATEST"
  else
    echo "[Claude Code] 升級失敗，請手動檢查！"
  fi
fi

exec "$@"
