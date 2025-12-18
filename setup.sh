#!/bin/bash

# Gustav Setup Script
# Run this once from your project root to install Gustav's agents and commands

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Installing Gustav agents and commands..."

mkdir -p "$PROJECT_ROOT/.claude/agents" "$PROJECT_ROOT/.claude/commands"

cp "$SCRIPT_DIR/claude/agents/"*.md "$PROJECT_ROOT/.claude/agents/" 2>/dev/null && \
  echo "  ✓ Agents copied" || echo "  - No agents found"

cp "$SCRIPT_DIR/claude/commands/"*.md "$PROJECT_ROOT/.claude/commands/" 2>/dev/null && \
  echo "  ✓ Commands copied" || echo "  - No commands found"

echo ""
echo "Done! You can now use /gustav in Claude Code."
echo ""
echo "Tip: Add the SessionStart hook to your settings for automatic updates."
echo "See README.md for details."
