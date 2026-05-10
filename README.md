# prompts.mdx

**Portable Agent Skills & Prompts for ANY Coding Agent**  
*(Claude Code • Cursor • Codex • Gemini CLI • Windsurf • Roo • Kiro • OpenClaw • and every Agent Skills standard supporter in 2026+)*

A single, version-controlled bundle that makes every AI coding agent feel like *yours* — instantly transferable between projects, machines, IDEs, and agents.

## Why This Exists (and Why It’s Universal)

Modern coding agents all support the **open Agent Skills standard** (SKILL.md + YAML frontmatter). This repo is a reference implementation + starter pack that works out of the box in **every major agent**.

- **Skills** are modular, auto-discovered, version-controlled knowledge packs. One skill = one focused capability (e.g., “publish to here.now”, “strict TypeScript”, “HTML-first UI”).
- **No vendor lock-in** — the same `skills/` folder works everywhere.
- **One-command setup** installs to all common global + project locations that agents actually read.

## Quick Start (Works for Everyone)

```bash
git clone https://github.com/rishistyping/prompts.mdx.git
cd prompts.mdx
./setup.sh
```

That’s it.

`setup.sh` automatically:
- Installs all skills to `~/.claude/skills/`, `~/.cursor/skills/`, `~/.codex/skills/`, `~/.agents/skills/`, etc.
- If you’re inside a git repo, also installs to project-level `.cursor/skills/`, `.claude/skills/`, etc. (perfect for teams/monorepos).
- Sets up the here.now publishing superpower.

**Restart your agent session** (or just start a new chat) — skills are discovered automatically.

### What You Get Out of the Box
| Skill / File              | What It Gives You                                      | Works In |
|---------------------------|--------------------------------------------------------|----------|
| `skills/here-now/`        | One-command “publish to here.now” → live URL in seconds (free 24h) | Every agent with shell/HTTP |
| `skills/custom-example/`  | Template to create your own universal skills           | Every Agent Skills agent |
| `CLAUDE.md`               | Core personality + HTML-first + shareable-by-default rules | Paste into any agent’s custom instructions or system prompt |
| `setup.sh` + `setup.ps1`  | Universal installer (bash + Windows PowerShell)        | All platforms |
| `flatten.sh`              | Export everything to single AGENTS.md / .cursorrules   | Legacy / non-modular agents |
| `MANIFEST.json`           | Machine-readable skill index for tooling & discovery   | CI, IDEs, custom tools |

## The here.now Killer Feature (Works Everywhere)

1. Ask your agent to build anything visual (dashboard, landing page, prototype, report, game…).
2. Say: **“publish to here.now”** (or “make this live”, “share this URL”).
3. Get a real public URL back in seconds — no account, no deploy pipeline.

This single workflow turns every conversation into shareable, production-grade artifacts. It’s the reason many teams switched to HTML-first development in 2026.

## Ready-to-Use Universal Skills (Included)

In addition to `here-now` and the template, this bundle now ships with production-ready skills:

- **strict-typescript** — Zero `any`, full type safety, ESLint + Prettier enforcement.
- **security-review** — OWASP-aligned audits, auth, injection prevention, secrets hygiene.
- **react-nextjs** — React 19 + Next.js 15+ (Server Components, App Router, a11y, performance).
- **monorepo-best-practices** — Turborepo / Nx / pnpm workspaces, caching, versioning, CI optimization.

All skills follow the official Agent Skills spec and work in every compatible agent.

## How to Add Your Own Skills (Universal)

```bash
mkdir -p skills/my-awesome-skill
cat > skills/my-awesome-skill/SKILL.md << 'EOF'
---
name: my-awesome-skill
description: Does X when the user asks for Y. Use this for Z.
---
# My Awesome Skill

## When to Use
- User mentions “X” or “Y”
- Working in codebase that needs Z

## Instructions
1. Step one…
2. Step two…
3. Always follow best practice ABC

## Examples
> User: “do the thing”
> Agent: [follows the skill perfectly]

EOF
```

Then re-run `./setup.sh` (or just copy the folder to any of the skill directories above).

Skills written this way are **portable by design** — they work in Claude Code, Cursor, Codex, Gemini, Windsurf, and any future agent that implements the open standard.

## Project vs Global Skills

- **Global** (`~/.*/skills/`) — your personal style, favorite workflows, here.now, etc. Available in every project.
- **Project** (`.*/skills/` inside repo) — team conventions, architecture decisions, framework-specific rules. Version-controlled with the code. Ideal for monorepos (skills can live next to the package they apply to).

## Compatibility Matrix (2026)

| Agent          | Global Path              | Project Path             | Notes |
|----------------|--------------------------|--------------------------|-------|
| Claude Code    | `~/.claude/skills/`      | `.claude/skills/`        | Full native support |
| Cursor         | `~/.cursor/skills/`      | `.cursor/skills/`        | Full native + legacy Claude dirs |
| Codex / OpenAI | `~/.codex/skills/`       | `.codex/skills/`         | Full support |
| Gemini CLI     | `~/.agents/skills/`      | `.agents/skills/`        | Via agentskills.io standard |
| Windsurf / Roo / Kiro / Trae | `~/.windsurf/skills/` (or ~/.agents/skills/) | Same in project | High compatibility |
| Continue.dev   | Via rules or prompts     | `.continuerules` + skills| Good via SKILL.md import |
| Aider / others | Custom instructions      | Project rules            | Use `CLAUDE.md` content or flattened export |

**Pro tip**: Because most agents also read `~/.claude/skills/`, installing there gives you maximum reach with zero extra work.

## Advanced / Customization

- **Core personality**: Copy `CLAUDE.md` to any project root or paste its content into your agent’s “custom instructions” / system prompt field.
- **Flatten for non-skill agents**: Run `./flatten.sh` to generate a single AGENTS.md or .cursorrules file.
- **Team sharing**: Commit the `skills/` folder (and optionally `.cursor/skills/` etc.) to your repo. New teammates just run `./setup.sh`.
- **CI / automation**: The skills are plain files — easy to lint, test, or generate from code.

## Contributing

- Add new skills in `skills/your-skill-name/SKILL.md` (follow the structure in `custom-example/`). 
- Improve `setup.sh` / `setup.ps1` for more agents or Windows support.
- Share your best universal skills — PRs welcome!

## License

MIT — use freely, fork, customize, share.

---

**The agentic future is portable.**  
Clone once. Run `./setup.sh`. Every agent, every project, every machine — instantly yours.

*Aligned with the open Agent Skills Standard (agentskills.io) and the 2026 cross-agent ecosystem.*