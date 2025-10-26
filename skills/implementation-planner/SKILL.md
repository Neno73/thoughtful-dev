---
name: implementation-planner
description: Creates thought-through implementation plans before coding. Analyzes current state, proposes approaches with trade-offs, breaks down work, identifies risks, and gets user agreement. Prevents premature coding and ensures alignment on technical decisions.
---

# Implementation Planner

## Purpose

Think through the implementation approach BEFORE writing code. Identify risks, evaluate trade-offs, and get agreement on the plan.

**Core principle:** Never start coding before you know where you're going.

## When to Activate

**Activate after requirements are clear (post-clarification), but BEFORE coding when:**
- Non-trivial features (>50 lines of code estimated)
- Touching critical systems (database, auth, payments)
- Significant refactoring
- New architecture patterns
- Multiple viable approaches exist

**Skip for:**
- Simple bug fixes with obvious solution
- Trivial changes (<20 lines)
- User says "I trust you, just do it"
- Continuing work on already-planned implementation

## The Planning Process

### Step 1: Analyze Current State

Understand what exists before proposing changes:

```
Current state analysis:

**Relevant files:**
- [file 1] - [current role/function]
- [file 2] - [current role/function]

**Existing patterns:**
- [pattern 1 we're using now]
- [pattern 2 we're using now]

**Integration points:**
- [system 1 we'll interact with]
- [system 2 we'll interact with]

**Constraints:**
- [technical constraint 1]
- [resource constraint 2]
```

**Why:** Can't plan well without understanding current architecture.

### Step 2: Propose Approach(es)

Present options with honest trade-off analysis:

```
## Proposed Implementation

### Option A: [Approach name]

**How it works:**
[2-3 sentence technical description]

**Pros:**
- [Advantage 1]
- [Advantage 2]

**Cons:**
- [Disadvantage 1]
- [Disadvantage 2]

**Risk level:** [Low/Medium/High]
**Effort:** [Small/Medium/Large]

[If multiple viable options exist:]

### Option B: [Alternative approach]

**How it works:**
[2-3 sentence technical description]

**Pros:**
- [Advantage 1]
- [Advantage 2]

**Cons:**
- [Disadvantage 1]
- [Disadvantage 2]

**Risk level:** [Low/Medium/High]
**Effort:** [Small/Medium/Large]

---

**My recommendation:** Option [A/B]

**Reasoning:** [Why this is the better choice given our constraints/goals]
```

**Key:** Be honest about trade-offs. No silver bullets. Help user make informed decision.

### Step 3: Break Down Work

Show the step-by-step implementation sequence:

```
## Implementation Steps

1. **[Step 1 name]**
   - File: [which file]
   - What: [what changes]
   - Why: [purpose of this step]

2. **[Step 2 name]**  
   - File: [which file]
   - What: [what changes]
   - Depends on: Step 1

3. **[Step 3 name]**
   - File: [which file]
   - What: [what changes]
   - Depends on: Step 2

## Files That Will Change

- `[file 1]` - [nature of changes]
- `[file 2]` - [nature of changes]
- `[file 3]` - [new file to create]
```

**Why:** Makes scope concrete. User can spot issues before you write code.

### Step 4: Identify Risks

Surface what could go wrong and how to mitigate:

```
## Potential Risks

### Risk 1: [Description]
- **Probability:** [Low/Medium/High]
- **Impact:** [Low/Medium/High]
- **Mitigation:** [How we'll handle it]

### Risk 2: [Description]
- **Probability:** [Low/Medium/High]
- **Impact:** [Low/Medium/High]
- **Mitigation:** [How we'll handle it]
```

**Key risks to always consider:**
- Performance impact
- Breaking changes
- Data integrity
- Security implications
- Browser/device compatibility

### Step 5: Get Agreement

Don't proceed until user confirms:

```
## Ready to Proceed?

Does this approach make sense given our requirements and constraints?

Options:
- ✅ Yes, proceed with this plan
- 🔄 Adjust the plan (let me know what to change)
- 💭 Discuss more (what concerns do you have?)
```

**Wait for explicit approval.** Don't assume silence means yes.

## Stack-Specific Planning Considerations

### For Next.js Implementation

**Key decisions to plan:**
- Server Component vs. Client Component?
- Where to fetch data: Server, API route, or Server Action?
- Rendering strategy: SSR, SSG, ISR, or CSR?
- Bundle size impact (especially for Client Components)
- Route organization (route groups, parallel routes)

**Common patterns:**
```
- Data fetching: Server Components with direct database/API calls
- Interactivity: Client Components with 'use client' directive  
- Forms: Server Actions with progressive enhancement
- Layouts: Shared layouts with loading/error states
```

### For Strapi Integration

**Key decisions to plan:**
- Which Strapi API endpoint(s)?
- Population strategy (eager vs. lazy loading relations)
- Authentication (JWT, API token, or public)
- Caching strategy (ISR, CDN, or client-side)
- Error handling (fallbacks, retry logic)

**Common gotchas:**
- Strapi's default API doesn't populate relations (need `?populate=*`)
- Deeply nested relations require specific population syntax
- Media URLs need base URL prepended

### For Medusa Integration

**Key decisions to plan:**
- Admin API vs. Store API?
- Which Medusa service to use?
- Custom fields or core fields only?
- Cart/session handling
- Webhook setup for real-time updates

**Common patterns:**
```
- Products: Store API for customer-facing, Admin API for management
- Cart: Use Medusa's cart service, store cart ID in cookies
- Orders: Always use transactions for order creation
- Inventory: Webhook updates for real-time availability
```

### For UI Changes (Tailwind + shadcn)

**Key decisions to plan:**
- Which shadcn components fit best?
- Custom styling beyond Tailwind utilities?
- Responsive breakpoints (mobile-first)
- Animation/transition strategy
- Accessibility requirements (keyboard nav, ARIA, screen readers)

**Common patterns:**
```
- Forms: shadcn Form + react-hook-form + Zod
- Modals: shadcn Dialog with controlled state
- Tables: shadcn Table with sorting/filtering
- Toasts: shadcn Toast for notifications
```

## Examples

### Example 1: E-commerce Product Page

```
User: "Make the product page show related products"

[After requirements clarification:]

## Current State Analysis

**Relevant files:**
- `app/products/[id]/page.tsx` - Product detail page (Server Component)
- `lib/strapi.ts` - Strapi API client

**Existing patterns:**
- Fetching product data in Server Component
- Using Strapi API with population

**Integration points:**
- Strapi API for product data
- Existing product card component

## Proposed Implementation

### Option A: Related Products from Strapi Relation

**How it works:**
Add a "related_products" relation in Strapi, populate it on product fetch.

**Pros:**
- Editorial control over related products
- Consistent with existing architecture
- Simple to implement

**Cons:**
- Manual curation required
- Doesn't scale automatically

**Risk:** Low | **Effort:** Small

### Option B: Algorithmic Related Products

**How it works:**
Query Strapi for products with same category/tags, implement similarity algorithm.

**Pros:**
- Automatic recommendations
- Scales without manual work
- More intelligent suggestions

**Cons:**
- More complex implementation
- Requires good product metadata
- Performance considerations

**Risk:** Medium | **Effort:** Large

**My recommendation:** Option A

**Reasoning:** We already have category data in Strapi. Start with category-based matching (automatic), add manual overrides later if needed. Balances automation with simplicity.

## Implementation Steps

1. **Update product query**
   - File: `lib/strapi.ts`
   - What: Modify getProduct to include related products from same category
   - Why: Get related product data

2. **Create RelatedProducts component**
   - File: `components/RelatedProducts.tsx` (new)
   - What: Display grid of related products using existing ProductCard
   - Why: Reusable component for showing related items

3. **Integrate into product page**
   - File: `app/products/[id]/page.tsx`
   - What: Add RelatedProducts below main product
   - Why: Show related products on page

## Potential Risks

### Risk 1: Too many or too few related products
- **Probability:** Medium
- **Impact:** Low  
- **Mitigation:** Limit to 4 products, show placeholder if fewer

### Risk 2: Slow query with relation population
- **Probability:** Low
- **Impact:** Medium
- **Mitigation:** Use ISR for caching, monitor query performance

## Ready to Proceed?

This approach will show 4 products from the same category, excluding the current product. Sound good?
```

### Example 2: Authentication System

```
User: "Add authentication with Google OAuth"

[After requirements clarification:]

## Current State Analysis

**Relevant files:**
- No existing auth system
- Strapi backend with users collection
- Next.js app with App Router

**Existing patterns:**
- Server Components for data fetching
- API routes for server-side operations

**Integration points:**
- Strapi for user storage
- Google OAuth API

## Proposed Implementation

### Option A: NextAuth.js

**How it works:**
Use NextAuth.js library with Google provider, custom Strapi adapter.

**Pros:**
- Battle-tested library
- Built-in session management
- Easy Google OAuth setup
- Good documentation

**Cons:**
- Adds dependency
- Custom adapter needed for Strapi
- Some Next.js 13+ quirks

**Risk:** Low | **Effort:** Medium

### Option B: Manual OAuth Implementation

**How it works:**
Direct OAuth flow with Google, custom session management.

**Pros:**
- Full control
- No extra dependencies
- Lighter bundle

**Cons:**
- Security complexity
- More code to maintain
- Easy to make mistakes

**Risk:** High | **Effort:** Large

**My recommendation:** Option A (NextAuth.js)

**Reasoning:** Auth is security-critical. Use battle-tested library rather than rolling our own. Custom adapter for Strapi is straightforward.

## Implementation Steps

1. **Install and configure NextAuth**
   - Files: `package.json`, `app/api/auth/[...nextauth]/route.ts` (new)
   - What: Setup NextAuth with Google provider
   - Why: Core auth infrastructure

2. **Create Strapi adapter**
   - File: `lib/strapi-adapter.ts` (new)
   - What: Custom adapter to store sessions in Strapi
   - Why: Integrate with existing backend

3. **Add session provider**
   - File: `app/layout.tsx`
   - What: Wrap app in SessionProvider
   - Why: Make session available everywhere

4. **Create auth UI**
   - Files: `components/LoginButton.tsx`, `components/UserMenu.tsx` (new)
   - What: Sign in/out buttons, user menu
   - Why: User interface for auth

5. **Protect routes**
   - Files: Various page components
   - What: Add auth checks to protected pages
   - Why: Enforce authentication

## Files That Will Change

- `package.json` - Add next-auth dependency
- `app/layout.tsx` - Add SessionProvider
- `app/api/auth/[...nextauth]/route.ts` - NEW: Auth endpoints
- `lib/strapi-adapter.ts` - NEW: Strapi integration
- `components/LoginButton.tsx` - NEW: Login UI
- `components/UserMenu.tsx` - NEW: User menu
- `.env.local` - Add Google OAuth credentials

## Potential Risks

### Risk 1: Google OAuth setup complexity
- **Probability:** Medium
- **Impact:** Low
- **Mitigation:** Follow Google's documentation, test in dev environment first

### Risk 2: Session persistence across deployments
- **Probability:** Low
- **Impact:** High
- **Mitigation:** Use Strapi database for session storage (not in-memory)

### Risk 3: Strapi adapter bugs
- **Probability:** Medium
- **Impact:** Medium
- **Mitigation:** Comprehensive testing, fallback error handling

## Ready to Proceed?

This gives you Google OAuth with Strapi backend integration. Sessions persist across deployments. Takes ~2-3 hours to implement. Sound good?
```

## When to Skip Planning

Proceed directly to coding when ALL of these are true:
- Implementation is trivial (<20 lines)
- Approach is obvious
- No architectural decisions needed
- No risks identified
- User trusts your judgment

**When in doubt, plan.** 30 minutes of planning beats hours of wrong implementation.

## Key Principles

1. **Analyze first** - Understand current state before proposing changes
2. **Be honest** - Every approach has trade-offs; surface them
3. **Think risks** - What could go wrong? How to mitigate?
4. **Break it down** - Make scope concrete with specific steps
5. **Get buy-in** - Don't code until user agrees with approach

## Integration with Other Skills

**Before this skill:**
- Use `requirements-clarifier` to understand WHAT to build

**After this skill:**
- If hitting complexity → Consider `breakthrough-generator`
- During implementation → Maintain `verification-mindset`

**This skill bridges requirements and implementation** - ensuring we know not just WHAT to build, but HOW to build it right.
