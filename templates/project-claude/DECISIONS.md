# Architectural Decision Records (ADR)

*Append-only log of major architectural decisions*

## Format

Each entry should include:
- **Date & Time:** When decision was made
- **Context:** What problem/situation prompted this
- **Decision:** What was decided
- **Rationale:** Why this approach
- **Trade-offs:** What we gained/lost
- **Alternatives Considered:** What else was evaluated

---

## 2025-10-26 14:30 - Example Decision Entry

**Context:** Need to handle form submissions securely with good UX

**Decision:** Use Next.js Server Actions instead of API routes for form handling

**Rationale:**
- Automatic CSRF protection
- Better type safety (end-to-end)
- Simpler error handling
- Progressive enhancement possible
- Less boilerplate than API routes

**Trade-offs:**
- Requires Next.js 14+ (acceptable - we're on 14.2)
- Newer pattern, less familiar to some team members
- Slightly different mental model than REST APIs

**Alternatives Considered:**
1. **API Routes** - More familiar but more boilerplate, manual CSRF handling
2. **Client-side only** - Poor UX without JS, security concerns

---

*Add new decisions below (most recent at top)*

---
