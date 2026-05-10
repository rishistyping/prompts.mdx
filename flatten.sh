#!/bin/bash
# flatten.sh — Export all skills + core instructions into a single file
# Useful for agents that don't fully support modular SKILL.md yet
# (e.g., some Continue.dev setups, Aider, older tools, or custom-instructions fields)

set -e

OUTPUT_FILE="${1:-AGENTS.md}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📦 Flattening prompts.mdx into $OUTPUT_FILE ..."

cat > "$OUTPUT_FILE" << 'HEADER'
# prompts.mdx — Universal Agent Instructions (Flattened)

This file contains the complete portable agent configuration from prompts.mdx.
It combines all modular skills and core personality into one document for agents
that prefer or require a single rules/instructions file (e.g. .cursorrules, AGENTS.md,
custom instructions, or system prompt).

**Source**: https://github.com/rishistyping/prompts.mdx
**Standard**: Agent Skills (SKILL.md) — works everywhere in 2026+

---

# CORE PERSONALITY & PRINCIPLES

HEADER

# Append CLAUDE.md (core instructions)
if [ -f "$SCRIPT_DIR/CLAUDE.md" ]; then
    cat "$SCRIPT_DIR/CLAUDE.md" >> "$OUTPUT_FILE"
else
    echo "⚠️  CLAUDE.md not found, skipping core personality."
fi

echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "# ALL SKILLS (Modular Knowledge Packs)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Append all skills
for skill_dir in "$SCRIPT_DIR/skills"/*; do
    if [ -d "$skill_dir" ] && [ -f "$skill_dir/SKILL.md" ]; then
        skill_name=$(basename "$skill_dir")
        echo "## Skill: $skill_name" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        cat "$skill_dir/SKILL.md" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "---" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
done

echo "✅ Flattened successfully into $OUTPUT_FILE"
echo ""
echo "Usage examples:"
echo "  • Cursor: cp $OUTPUT_FILE .cursorrules"
echo "  • Claude / other: Paste contents into custom instructions or system prompt"
echo "  • Aider / Continue: Use as project rules file"
echo ""
echo "Tip: Re-run this script after adding new skills."