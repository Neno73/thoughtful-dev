---
name: requirements-clarifier
description: Prevents premature implementation by ensuring genuine understanding of requirements. Activates when user requests new features or changes with ambiguous requirements. Asks clarifying questions, validates assumptions, and gets explicit agreement before any coding begins.
---

# Requirements Clarifier

## Purpose

Prevent the "code first, realize misunderstanding later" problem by ensuring Claude and user have shared understanding BEFORE writing any code.

**Core principle:** 5 minutes of clarification beats 5 hours of coding the wrong thing.

## When to Activate

**Automatically activate when:**
- User says "build X", "create Y", "add Z"
- Request involves new feature or significant change
- Requirements feel ambiguous or underspecified
- Multiple interpretations are possible
- User assumptions might be wrong

**Do NOT activate for:**
- Clear bug fixes with obvious solution
- Trivial changes to existing code
- User explicitly says "just do it" after prior discussion
- Continuing work on already-clarified requirements

## The Clarification Protocol

### Step 1: Restate Understanding

Paraphrase what you understood in your own words:

```
Let me make sure I understand what you want:

- [Core feature/change in simple terms]
- [Key behaviors/functionality]  
- [Expected outcomes/deliverables]

Is this correct, or did I misunderstand something?
```

**Why this works:** Forces you to prove comprehension. Often reveals gaps immediately.

### Step 2: Identify Ambiguities

For ANY unclear aspects, ask specific questions:

```
A few things I need to clarify:

1. When you say X, do you mean:
   - Option A: [interpretation 1]
   - Option B: [interpretation 2]

2. Should this handle edge case Y?
   - If yes: [follow-up question]
   - If no: [confirm it's out of scope]

3. What should happen if Z occurs?
```

**Key:** Ask SPECIFIC questions with options, not vague "can you clarify?"

### Step 3: Surface Assumptions

State your assumptions explicitly to get them validated or corrected:

```
I'm making these assumptions - please correct if wrong:

- [Assumption 1: technical choice]
- [Assumption 2: scope boundary]
- [Assumption 3: integration point]
- [Assumption 4: user expectation]
```

**Why this matters:** Users often don't realize they have implicit assumptions until you state them explicitly.

### Step 4: Suggest Improvements (When Appropriate)

If you see better approaches based on the tech stack or architecture, offer them:

```
Based on our stack [Next.js/Strapi/Medusa/etc], I'd suggest:

Option A: [User's original approach]
- Pros: [advantages]
- Cons: [disadvantages]

Option B: [Your suggested approach]  
- Pros: [advantages]
- Cons: [disadvantages]

Would you like to consider option B, or proceed with the original plan?
```

**Balance:** Respect user's decision but share your expertise. Don't be pushy.

### Step 5: Get Explicit Agreement

Before ANY coding:

```
Before I start coding, let me confirm we're aligned on:

1. What we're building: [brief summary]
2. Why this approach: [key rationale]
3. What success looks like: [concrete outcome]

Ready to proceed, or should we discuss further?
```

**Wait for explicit "yes" or "go ahead".** Don't assume silence means agreement.

## Stack-Specific Clarification Questions

### For Next.js Changes
- Server Component or Client Component?
- API route, Server Action, or direct fetch?
- SSR, SSG, ISR, or client-side?
- App Router or Pages Router?

### For Strapi Integration
- Which Strapi content type?
- Authenticated or public endpoint?
- Populate relations, or minimal data?
- Real-time updates needed?

### For Medusa Integration  
- Which Medusa entity (product, cart, order)?
- Admin API or Store API?
- Custom fields needed?
- Webhook integration?

### For UI/UX (Tailwind + shadcn)
- Which shadcn component fits best?
- Mobile-first or desktop-first?
- Accessibility requirements?
- Animation/interaction expectations?

## Examples

### Bad: No Clarification

```
User: "Add authentication to the app"
Claude: [Starts coding JWT implementation]
Result: User wanted OAuth. Wrong approach. Wasted hours.
```

### Good: With Clarification

```
User: "Add authentication to the app"

Claude: "Let me clarify what you need for authentication:

1. Auth method:
   - Email/password login
   - OAuth (Google, GitHub, etc.)
   - Magic link
   - Which do you prefer?

2. Backend:
   - Should this integrate with our existing Strapi backend?
   - Or separate auth service?

3. Features:
   - Just login/logout?
   - Or also: password reset, email verification, role-based access?

4. Session handling:
   - Persistent sessions across browser close?
   - Or expire after inactivity?"

User: "OAuth with Google only, integrate with Strapi, just login/logout for now, persistent sessions"

Claude: "Perfect. So I'll implement:
- Google OAuth integration
- Authentication against Strapi's user system  
- Login/logout only (no RBAC yet)
- Persistent sessions using secure cookies

Sound right?"

User: "Yes, exactly"

Result: Builds exactly what's needed on first try.
```

### Example: Surfacing Hidden Assumptions

```
User: "Make the checkout faster"

Claude: "When you say 'faster', I need to understand what you mean:

I'm assuming you mean:
- Reduce number of steps in checkout flow
- Improve page load speed
- Reduce time to complete purchase

But you might actually mean:
- Fix slow API calls
- Reduce friction (fewer form fields)
- Better UX (clearer buttons, progress indicators)

Which of these matters most to you?"

User: "Oh! I meant the API is slow. The flow is fine."

Claude: "Got it - so this is a performance issue, not UX. Let me clarify:
- Is it slow for all checkouts, or certain conditions?
- Which step is slow: payment processing, order creation, inventory check?
- Do we have monitoring/logs showing the bottleneck?"

Result: Solves the ACTUAL problem (API performance) instead of redesigning the checkout flow.
```

## When to Skip Clarification

You can proceed directly to coding when ALL of these are true:
- Requirements are crystal clear
- No ambiguities exist
- You're 100% confident in your understanding
- Risk of misunderstanding is negligible
- It's a continuation of already-clarified work

**When in doubt, clarify.** False confidence wastes more time than thorough questions.

## Key Principles

1. **Be specific** - "Do you mean A or B?" beats "Can you clarify?"
2. **State assumptions** - Make implicit explicit
3. **Offer expertise** - Suggest better approaches when you see them
4. **Get agreement** - Wait for explicit "yes" before coding
5. **Save time** - 5 minutes now beats 5 hours later

## Integration with Other Skills

**After clarification completes:**
- For non-trivial work → Invoke `implementation-planner` 
- For complex problems → Consider `breakthrough-generator`
- For security-sensitive → Extra careful with assumptions

**This skill comes FIRST** - you can't plan or implement well without understanding the requirement.
