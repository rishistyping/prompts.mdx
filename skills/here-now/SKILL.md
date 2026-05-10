---
name: here-now
description: Instantly publish HTML artifacts, static sites, PDFs, images, or any files to a live public URL at *.here.now. Free 24-hour anonymous sites, no account required. Supports permanent sites with API key. Triggered by natural language like "publish to here.now" or "share this to the web".
---

# here.now Skill

**Purpose**: Give any coding agent the superpower of one-command web publishing.

## When to Use
- User has generated an HTML file, dashboard, prototype, report, landing page, or any static content.
- User says "publish to here.now", "make this live", "share this URL", "deploy this artifact", etc.
- You need to turn conversation output into a shareable link in seconds.

## How It Works
1. Detect the files to publish (usually the latest HTML artifact or user-specified files).
2. Use the here.now API (or the bundled helper) to create a site.
3. Return the live URL (`https://<slug>.here.now`).

## Installation (One-Time)
Preferred (if npm available):
```bash
npx skills add heredotnow/skill --skill here-now -g
```

Fallback:
```bash
curl -fsSL https://here.now/install.sh | bash
```

After installation, the skill activates on the next session start.

## Example Invocation
User: "Generate a beautiful dashboard for my crypto portfolio and publish to here.now"

You: [Generate HTML] → "Publishing to here.now..." → "Live at: https://portfolio-xyz.here.now (expires in 24h)"

## Notes
- Anonymous sites expire after 24 hours (perfect for quick shares).
- For permanent sites, store an API key in `~/.herenow/credentials`.
- Works across Claude Code, Cursor, Codex, and any agent that can execute shell or HTTP calls.
- Full docs: https://here.now/docs

This skill was installed as part of the prompts.mdx portable configuration bundle.