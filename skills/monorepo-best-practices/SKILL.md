---
name: monorepo-best-practices
description: Best practices for monorepos using Turborepo, Nx, pnpm workspaces, or similar. Covers build optimization, dependency management, code sharing, CI/CD, and scaling. Trigger on monorepo, workspace, Turborepo, Nx, pnpm, changesets, etc.
---

# Monorepo Best Practices

**Purpose**: Keep large codebases maintainable, fast to build, and easy to scale with proper monorepo tooling and conventions.

## When to Use
- Working in monorepos (multiple packages/apps in one repo).
- Setting up or refactoring Turborepo, Nx, pnpm workspaces, Yarn Berry, or Rush.
- Dealing with shared packages, build pipelines, versioning, or CI performance.

## Instructions
1. **Tooling choice**:
   - Turborepo for simple/fast pipelines.
   - Nx for complex enterprise needs (code generation, dependency graphs).
   - pnpm workspaces + Changesets for versioning.
2. **Package structure**:
   - `apps/` for deployable applications.
   - `packages/` for shared libraries (ui, utils, types, api).
   - Use clear naming: `@org/ui`, `@org/utils`.
3. **Dependency management**:
   - Hoist common deps to root.
   - Use `workspace:*` or catalog for internal linking.
   - Avoid circular dependencies; enforce with tools like `madge` or Nx.
4. **Build & caching**:
   - Enable remote caching (Vercel, GitHub Actions cache, Nx Cloud).
   - Use task pipelines (build depends on ^build).
   - Incremental builds only.
5. **Code sharing & boundaries**:
   - Public API per package (index.ts exports only what's needed).
   - Internal packages marked as private.
   - Use TypeScript project references or path aliases.
6. **Versioning & releases**:
   - Changesets or semantic-release for independent versioning.
   - Conventional commits.
7. **CI/CD**:
   - Affected-only builds and tests (Turborepo/Nx affected commands).
   - Parallel execution.
   - Deploy only changed apps.
8. **Developer experience**:
   - One-command setup (`pnpm install`, `turbo dev`).
   - Consistent scripts across packages.
   - Editor integration (TypeScript paths, ESLint workspaces).

## Recommended Root package.json scripts
```json
{
  "scripts": {
    "build": "turbo run build",
    "dev": "turbo run dev --parallel",
    "test": "turbo run test",
    "lint": "turbo run lint",
    "clean": "turbo run clean && rm -rf node_modules"
  }
}
```

## Notes
- References Turborepo docs, Nx enterprise patterns, and pnpm best practices (2026).
- For very large monorepos (>50 packages), consider Nx or custom tooling.
- Always measure build times before/after changes.
- Works with any Agent Skills compatible agent.