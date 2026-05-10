---
name: strict-typescript
description: Enforce strict TypeScript, ESLint, and Prettier best practices. Use for any TypeScript project to ensure type safety, code quality, and consistency. Trigger on any mention of TypeScript, TS, types, or linting issues.
---

# Strict TypeScript & Linting

**Purpose**: Make the agent produce production-grade, type-safe TypeScript with zero `any`, full type coverage, and consistent formatting.

## When to Use
- Working with TypeScript, TSX, or JavaScript that can be typed.
- User mentions "types", "strict", "lint", "ESLint", "Prettier", or complains about type errors.
- New features, refactors, or bug fixes in TS codebases.

## Instructions
1. **Never use `any`** — use `unknown`, generics, or proper interfaces instead.
2. **Enable strict mode**: Assume `strict: true` in tsconfig.json (noImplicitAny, strictNullChecks, etc.).
3. **Prefer interfaces over type aliases** for object shapes; use type for unions/intersections.
4. **Use branded types** for domain-specific primitives (e.g., `type UserId = string & { __brand: 'UserId' }`).
5. **ESLint rules**: Enforce @typescript-eslint/recommended, no-floating-promises, no-misused-promises, prefer-readonly, etc.
6. **Prettier**: Always format with single quotes, semicolons, 2-space indent, trailing commas in objects/arrays.
7. **React/TSX specific**: Use `React.FC<Props>` or functional components with explicit props typing; prefer `interface Props` for components.
8. **Error handling**: Use `Result` or `Either` patterns instead of throwing for expected errors; proper error boundaries in React.
9. **Testing**: Always write tests with vitest/jest + @testing-library; aim for 80%+ coverage on new code.
10. **Performance**: Use `const` by default, avoid unnecessary re-renders (React.memo, useMemo, useCallback where appropriate).

## Examples
> User: "Add a user profile component"
> Agent: Creates typed interface, strict props, proper error handling, formatted code, and suggests adding tests.

## Notes
- This skill assumes a modern stack (TypeScript 5+, ESLint 9 flat config, Prettier).
- For existing codebases, first run `npx tsc --noEmit` to identify issues, then fix systematically.
- Compatible with any Agent Skills supporting agent (Claude Code, Cursor, etc.).