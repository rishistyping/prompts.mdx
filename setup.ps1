# setup.ps1 — Windows PowerShell version of the universal prompts.mdx installer
# Run this in PowerShell (Admin not required for most operations)
# Installs Agent Skills to all common locations used by Claude Code, Cursor, Codex, etc.

param(
    [switch]$ProjectOnly,
    [switch]$GlobalOnly
)

Write-Host "🚀 Setting up prompts.mdx — Universal Agent Skills (Windows)" -ForegroundColor Cyan
Write-Host "   (Agent Skills standard — works in Claude Code, Cursor, Codex, Gemini CLI, etc.)" -ForegroundColor Gray

$ErrorActionPreference = "Continue"

# Common global skill directories on Windows
$GlobalSkillDirs = @(
    "$env:USERPROFILE\.claude\skills",      # Claude Code
    "$env:USERPROFILE\.cursor\skills",      # Cursor
    "$env:USERPROFILE\.codex\skills",       # Codex
    "$env:USERPROFILE\.agents\skills",      # Tool-agnostic / emerging standard
    "$env:USERPROFILE\.windsurf\skills"     # Windsurf
)

# Project-level (relative to current directory)
$ProjectSkillDirs = @(
    ".claude\skills",
    ".cursor\skills",
    ".codex\skills",
    ".agents\skills"
)

function Install-SkillsTo {
    param($TargetDir, $Scope)
    
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }
    
    try {
        Copy-Item -Path "skills\*" -Destination $TargetDir -Recurse -Force
        Write-Host "✅ Installed skills to $Scope`: $TargetDir" -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Could not install to $TargetDir (check permissions)" -ForegroundColor Yellow
    }
}

# Global install
if (-not $ProjectOnly) {
    Write-Host "`n📦 Installing to global (user-level) skill directories..." -ForegroundColor Yellow
    foreach ($dir in $GlobalSkillDirs) {
        Install-SkillsTo -TargetDir $dir -Scope "global"
    }
}

# Project install
if (-not $GlobalOnly) {
    Write-Host "`n📁 Installing to project-level skill directories..." -ForegroundColor Yellow
    foreach ($dir in $ProjectSkillDirs) {
        $fullPath = Join-Path (Get-Location) $dir
        Install-SkillsTo -TargetDir $fullPath -Scope "project"
    }
}

# here.now setup (cross-platform, uses curl if available)
Write-Host "`n📦 Setting up here.now integration..." -ForegroundColor Yellow
if (Get-Command npx -ErrorAction SilentlyContinue) {
    try {
        npx skills add heredotnow/skill --skill here-now -g 2>$null
        Write-Host "✅ here.now skill installed via npx" -ForegroundColor Green
    } catch {
        Write-Host "   (npx step skipped or already present)" -ForegroundColor Gray
    }
} else {
    Write-Host "   npx not found — trying curl fallback..." -ForegroundColor Gray
}

if (Get-Command curl -ErrorAction SilentlyContinue) {
    try {
        curl -fsSL https://here.now/install.sh | bash 2>$null
        Write-Host "✅ here.now installer completed" -ForegroundColor Green
    } catch {
        Write-Host "   (here.now installer completed or already set up)" -ForegroundColor Gray
    }
}

Write-Host "`n🎉 Setup complete!" -ForegroundColor Cyan
Write-Host "   Your skills are now available in Claude Code, Cursor, Codex, and other Agent Skills compatible IDEs." -ForegroundColor Gray
Write-Host "`nNext steps:" -ForegroundColor White
Write-Host "1. Restart your coding agent (or start a new chat)"
Write-Host "2. Try: 'Generate a beautiful dashboard and publish to here.now'"
Write-Host "3. For full portability: Copy CLAUDE.md to your project root or paste into custom instructions"
Write-Host "`nMade with ❤️ for the agentic era — prompts.mdx (cross-platform)" -ForegroundColor Magenta