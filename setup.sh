#!/bin/bash
# prompts.mdx Quick Setup Script
# Run this after cloning to install the here-now skill and set up directories

set -e

echo "🚀 Setting up prompts.mdx portable agent configuration..."

# Detect Claude skills directory
if [ -n "$HOME" ]; then
    CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
else
    CLAUDE_SKILLS_DIR="/root/.claude/skills"
fi

mkdir -p "$CLAUDE_SKILLS_DIR"

echo "📦 Installing here.now skill (official)..."
if command -v npx &> /dev/null; then
    npx skills add heredotnow/skill --skill here-now -g || echo "⚠️ npx install failed, trying fallback..."
else
    echo "npx not found, using curl fallback..."
fi

curl -fsSL https://here.now/install.sh | bash || echo "⚠️ curl installer also failed — you can install manually later"

echo "✅ Copying skills from this repo..."
cp -r skills/* "$CLAUDE_SKILLS_DIR/" 2>/dev/null || echo "Skills copied (or already present)"

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Start a new Claude Code (or other agent) session"
echo "2. The here-now skill and any custom skills will be available"
echo "3. Try: 'Generate a cool dashboard and publish to here.now'"
echo ""
echo "For full portability, also copy CLAUDE.md to your project root or ~/.claude/"
echo ""
echo "Made with ❤️ for the agentic era — from prompts.mdx"