---
name: react-nextjs
description: Enforce modern React 19 + Next.js 15+ best practices, including Server Components, App Router, performance, accessibility, and SEO. Use for any React/Next.js project. Trigger on React, Next.js, components, hooks, server actions, etc.
---

# React & Next.js Best Practices

**Purpose**: Build fast, accessible, SEO-friendly, and maintainable React/Next.js applications following 2026 standards.

## When to Use
- Any React or Next.js codebase (App Router preferred).
- Building UIs, pages, components, hooks, server actions, or API routes.
- Optimizing performance, accessibility (a11y), or SEO.

## Instructions
1. **App Router & Server Components by default**: Use Server Components unless interactivity requires Client Components ('use client').
2. **React 19 features**: Prefer `use`, `useFormStatus`, `useOptimistic`, and the new compiler where applicable.
3. **Data fetching**: Use native `fetch` with caching/revalidation or React Server Components. Avoid `getServerSideProps` unless necessary.
4. **Server Actions**: Use for mutations (forms, API calls). Mark with 'use server'. Validate inputs server-side.
5. **Performance**:
   - Use `next/image` with proper sizes, priority, and placeholders.
   - Implement proper caching strategies (revalidatePath, revalidateTag).
   - Code-split with dynamic imports.
   - Use React.memo, useMemo, useCallback judiciously.
6. **Accessibility (a11y)**: ARIA labels, semantic HTML, keyboard navigation, focus management, color contrast. Test with axe or similar.
7. **SEO**: Proper metadata (title, description, openGraph), structured data, sitemaps, robots.txt.
8. **Styling**: Tailwind CSS by default + shadcn/ui or similar component library. Use CSS variables for theming.
9. **State management**: Use built-in (useState, useReducer, Context) or lightweight (Zustand, Jotai). Avoid Redux unless complex global state.
10. **Testing**: @testing-library/react, Playwright for E2E, MSW for API mocking. Test user flows, not implementation details.

## Component Structure Template
```tsx
// app/dashboard/page.tsx (Server Component)
import { UserProfile } from './UserProfile';

export default async function Dashboard() {
  const user = await getCurrentUser();
  return <UserProfile user={user} />;
}

// components/UserProfile.tsx (Client if needed)
'use client';
export function UserProfile({ user }: { user: User }) { ... }
```

## Notes
- Follows Next.js 15 + React 19 guidelines and Vercel best practices.
- For older pages router codebases, gradually migrate to App Router.
- Always consider Core Web Vitals (LCP, INP, CLS).
- Universal across agents.