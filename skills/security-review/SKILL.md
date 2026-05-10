---
name: security-review
description: Perform comprehensive security reviews and implement secure coding practices. Use for audits, new features, or when handling sensitive data, auth, APIs, or user input. Trigger on mentions of security, auth, passwords, tokens, SQL, XSS, etc.
---

# Security Review & Secure Coding

**Purpose**: Ensure all code is secure by default — prevent common vulnerabilities and follow OWASP Top 10 / CWE best practices.

## When to Use
- Any code that handles user input, authentication, authorization, databases, APIs, file uploads, or sensitive data.
- Before merging PRs, deploying, or when user asks for "security audit", "secure this", "is this safe?".
- Refactoring legacy code or adding new endpoints/features.

## Instructions
1. **Input validation & sanitization**: Always validate and sanitize all user input (use Zod, Joi, or built-in validators). Never trust client-side data.
2. **Authentication & Authorization**: Use secure session management, JWT with proper signing, rate limiting, and principle of least privilege. Check permissions on every sensitive action.
3. **SQL/NoSQL injection**: Always use parameterized queries or ORMs (Prisma, TypeORM). Never concatenate strings into queries.
4. **XSS prevention**: Escape output in templates; use Content-Security-Policy headers; sanitize HTML if rendering user content.
5. **CSRF & CORS**: Implement proper CSRF tokens and strict CORS policies.
6. **Secrets management**: Never hardcode secrets. Use environment variables, secret managers (AWS Secrets Manager, Vercel, etc.). Rotate keys regularly.
7. **Error handling**: Do not leak stack traces or sensitive info in error messages to clients. Log securely.
8. **Dependencies**: Regularly audit with `npm audit`, `yarn audit`, or Snyk. Pin versions and avoid vulnerable packages.
9. **HTTPS & headers**: Enforce HTTPS, HSTS, X-Frame-Options, X-Content-Type-Options, etc.
10. **Logging & monitoring**: Log security events (auth failures, suspicious activity) without logging PII.

## Checklist (Always run mentally before finalizing code)
- [ ] All inputs validated & sanitized
- [ ] No SQL concatenation
- [ ] Auth checks on protected routes
- [ ] Secrets not in code
- [ ] Proper error messages (no leaks)
- [ ] Dependencies audited
- [ ] Headers set securely

## Examples
> User: "Add a login endpoint"
> Agent: Uses bcrypt for passwords, JWT with short expiry + refresh tokens, rate limiting, input validation with Zod, secure headers, and logs attempts without exposing details.

## Notes
- References OWASP Top 10, CWE Top 25, and modern frameworks' security guides.
- For full audits, combine with static analysis tools (SonarQube, Snyk, CodeQL).
- Works universally across agents supporting Agent Skills.