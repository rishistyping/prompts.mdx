# prompts.mdx

**Portable Skills, Prompts & Configurations for Modern AI Coding Agents**

A clean, version-controlled home for everything that makes your AI coding agents (Claude Code, Codex, Cursor, Gemini CLI, OpenClaw, etc.) feel like *yours* — instantly transferable between projects, machines, and different agent platforms.

## What This Repo Does

This repository packages your agent personality, capabilities, and workflows into a single, clone-and-go bundle:

- **Skills** — Reusable instruction sets (the new standard for extending agents). Each skill lives in its own folder with a `SKILL.md` file containing YAML frontmatter + detailed instructions.
- **Core Memory & System Prompts** — Your `CLAUDE.md` (or equivalent) that travels with you.
- **Ready-to-use Integrations** — Includes the official `here.now` skill so you can generate HTML (or any static content) and publish it to a live URL in seconds with a single natural-language command: **"publish to here.now"**.
- **Workflow Recipes** — Common patterns (HTML-first development, rapid prototyping, artifact sharing, etc.).
- **Cross-Agent Compatibility** — Works out of the box with Claude Code's skills system and is easily adapted for Codex, Cursor, Hermes, and other agents that support the open skills format.

### Why This Matters

Modern agents are incredibly powerful but lose their "soul" every time you start a new project or switch tools. This repo fixes that. Clone it once, drop the relevant pieces into the right locations, and every agent you use instantly inherits your preferences, custom skills, and favorite workflows.

Inspired by the "HTML is the new markdown" movement and the here.now instant-publishing workflow.

## Quick Start

### For Claude Code

```bash
git clone https://github.com/rishistyping/prompts.mdx.git
cd prompts.mdx

# Personal skills (available everywhere)
cp -r skills/* ~/.claude/skills/

# Project-level (recommended for most work)
mkdir -p .claude/skills
cp -r skills/* .claude/skills/

# Core instructions
cp CLAUDE.md .          # or to ~/.claude/CLAUDE.md for global
```

Restart your Claude Code session (or start a new one). The skills will be automatically discovered.

### For Other Agents (Cursor, Codex, etc.)

Most agents support the same `SKILL.md` format. Place skills in the location documented by your tool (often `.cursor/skills/`, project skills folder, or via their marketplace/plugin system). The here.now skill works via the official installer on any agent that can run shell commands.

## What's Included

| Path                    | Purpose                                      |
|-------------------------|----------------------------------------------|
| `skills/here-now/`      | Official here.now skill — instant web publishing for agents |
| `skills/custom-example/`| Template for creating your own skills        |
| `CLAUDE.md`             | Core system prompt / persistent memory       |
| `prompts/`              | Reusable prompt library                      |
| `workflows/`            | Step-by-step recipes for common tasks        |
| `.claude/`              | Example settings and directory structure     |

## The here.now Workflow (Killer Feature)

1. Ask your agent to generate an HTML dashboard, landing page, prototype, report, etc.
2. Say: **"publish to here.now"**
3. Get back a live URL (`something.here.now`) in seconds — free for 24 hours, no account required.

This turns every conversation into shareable, production-grade artifacts.

## Contributing / Customizing

- Add new skills in `skills/your-skill-name/SKILL.md`
- Update `CLAUDE.md` with your personal rules and preferences
- Fork and make it yours — that's the whole point

## License

MIT — use freely, share widely.

---

**Made for the agentic future.** Clone it, customize it, take it everywhere.