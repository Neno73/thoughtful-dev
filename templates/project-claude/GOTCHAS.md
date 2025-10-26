# Known Issues & Gotchas

*Last updated: YYYY-MM-DD HH:MM*

This file documents quirks, known issues, and workarounds specific to THIS project.

## Format

Each entry should include:
- **Issue:** What's the problem?
- **When it happens:** Conditions that trigger it
- **Workaround:** How to fix/avoid it
- **Root cause:** Why it happens (if known)

---

## Example: Strapi Relations Not Populating

**Issue:** Fetching products from Strapi returns null for `category` field

**When it happens:** When using default API call without populate parameter

**Workaround:**
```tsx
// ❌ Wrong - relations not populated
const res = await fetch(`${STRAPI_URL}/api/products`)

// ✅ Correct - populate all relations
const res = await fetch(`${STRAPI_URL}/api/products?populate=*`)

// ✅ Or populate specific fields
const res = await fetch(`${STRAPI_URL}/api/products?populate=category,images`)
```

**Root cause:** Strapi doesn't populate relations by default for performance

---

## Example: Hydration Mismatch in Development

**Issue:** "Hydration failed" error in development mode only

**When it happens:** Using date/time or random values in Server Components

**Workaround:**
```tsx
// ❌ Wrong - causes hydration mismatch
<time>{new Date().toLocaleString()}</time>

// ✅ Correct - suppress hydration warning for date/time
<time suppressHydrationWarning>{new Date().toLocaleString()}</time>

// Or make it a Client Component
'use client'
function CurrentTime() {
  return <time>{new Date().toLocaleString()}</time>
}
```

**Root cause:** Server and client render at different times, producing different output

---

*Add new gotchas as they're discovered*
