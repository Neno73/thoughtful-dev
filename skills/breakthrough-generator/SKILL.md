---
name: breakthrough-generator
description: This skill provides systematic techniques for generating breakthroughs when conventional problem-solving approaches have failed. Use this skill when stuck on difficult problems where obvious solutions have been tried and haven't worked, when facing "impossible" constraints, when analysis paralysis has set in, or when creative thinking is needed to find novel solutions. Particularly valuable for debugging complex systems, architectural decisions under constraints, and any situation where the response would be "I've tried everything" or "this seems impossible."
---

# Breakthrough Generator

## Overview

Generate breakthroughs on difficult problems by applying systematic creative thinking techniques. This skill provides structured methods for: breaking out of conventional thinking patterns, identifying and challenging hidden assumptions, reframing problems to reveal new solution spaces, and borrowing proven solutions from other domains.

## When to Use This Skill

Activate this skill when encountering these signals:

**Primary Triggers:**
- User says "I'm stuck" or "I've tried everything"
- Conventional solutions have been attempted without success
- Problem seems impossible given stated constraints
- Circling back to same failed approaches repeatedly
- Analysis paralysis - can't choose between bad options
- User explicitly asks for creative or out-of-the-box thinking

**Situational Triggers:**
- Debugging complex system where obvious checks failed
- Architectural decision with conflicting requirements
- Performance optimization where standard techniques plateaued
- API/integration problem with unclear root cause
- Design challenge where all approaches have significant downsides
- Need to work around supposedly immutable constraint

**Strong Indicators:**
- Phrases like "there's no way to...", "it's impossible because...", "we've always done it this way"
- Solutions feel like treating symptoms rather than causes
- High resistance to proposed solutions from stakeholders
- Multiple "right" solutions that all feel wrong

## Problem Recognition & Technique Selection

Follow this decision tree to select the appropriate breakthrough technique:

### 1. Diagnose the Stuck Point

**Ask:** What type of stuck are we experiencing?

**Stuck in logical loop** (cycling through same failed approaches)
→ Use **Lateral Thinking** (Provocation, Random Word Association)
→ Reference: `references/lateral-thinking.md`

**Constraint feels insurmountable** (can't work within limitations)
→ Use **Assumption Excavation** + **Problem Reframing** (Constraint Embrace)
→ References: `references/assumption-excavation.md`, `references/problem-reframing.md`

**Wrong abstraction level** (too technical or too abstract)
→ Use **Problem Reframing** (Level Shift)
→ Reference: `references/problem-reframing.md`

**Not sure what the real problem is** (symptoms vs. cause confusion)
→ Use **Assumption Excavation** (Five-Why) + **Problem Reframing** (First Principles Lens)
→ References: `references/assumption-excavation.md`, `references/problem-reframing.md`

**Need creative inspiration** (want novel approach)
→ Use **Cross-Domain Inspiration** (find analogous domains)
→ Reference: `references/cross-domain.md`

**Claiming exhaustion** ("tried everything")
→ Use **Assumption Excavation** (Exhaustion Forcing) first to verify
→ Reference: `references/assumption-excavation.md`

### 2. Apply Selected Technique

Read the appropriate reference file and apply the specific technique most relevant to the situation.

### 3. Generate and Test Breakthrough Insights

Transform insights from techniques into concrete, testable approaches:

1. **Extract the principle** - What assumption was challenged? What pattern was revealed?
2. **Generate concrete options** - What specific approaches does this unlock?
3. **Evaluate feasibility** - Which can actually be implemented?
4. **Propose testing strategy** - How can we validate these quickly?

### 4. Iterate or Combine Techniques

If first technique doesn't yield breakthrough:

**Option A: Try complementary technique**
- Used Lateral Thinking? → Add Problem Reframing
- Used Assumption Excavation? → Add Cross-Domain Inspiration
- Used Problem Reframing? → Add Lateral Thinking

**Option B: Go deeper with same technique**
- Apply more extreme version (more provocations, deeper assumption excavation)
- Use multiple methods from same reference file
- Combine variations (e.g., multiple reframing lenses)

**Option C: Progressive reframing**
- Apply reframe to get new problem statement
- Apply another technique to reframed problem
- Continue until breakthrough emerges

## Core Techniques Quick Reference

### Lateral Thinking (references/lateral-thinking.md)

**Use when:** Stuck in conventional thinking patterns, need to break out of logical loops

**Key methods:**
- **Provocation:** Generate absurd statements to force new perspectives (Po: X should do Y)
- **Reverse Assumption:** Flip core beliefs about the problem
- **Random Word:** Inject unrelated concepts to create unexpected connections
- **Perspective Shifting:** View through drastically different stakeholder lenses
- **Constraint Manipulation:** Add, remove, or modify constraints to explore possibility space

**When to reach for each:**
- Logical loop → Provocation, Random Word
- Conventional exhausted → Reverse Assumption, Constraint Manipulation
- Need fresh view → Perspective Shifting
- Claiming impossible → Problem Reframing + Reverse Assumption

### Assumption Excavation (references/assumption-excavation.md)

**Use when:** Suspect hidden assumptions are limiting solution space, or need to verify "tried everything" claim

**Key methods:**
- **The Assumption Pyramid:** Identify surface, structural, and foundational assumptions
- **Five-Why Excavation:** Dig deeper by repeatedly asking "why?"
- **Assumption Inversion:** Flip each assumption and explore what becomes possible
- **Constraint Audit:** Categorize constraints (physical, resource, technical, organizational, assumed)
- **Exhaustion Forcing:** Prove systematically that all approaches were really tried

**Critical insight:** Most "impossible" problems have assumed constraints masquerading as real ones

### Problem Reframing (references/problem-reframing.md)

**Use when:** Problem feels wrong as stated, or at wrong abstraction level, or solution seems like symptom treatment

**Key patterns:**
- **Goal Inversion:** "How to X" → "How to avoid needing X"
- **Constraint Embrace:** "X is impossible" → "What if X being impossible is good?"
- **Level Shift:** Move up (more abstract) or down (more concrete) the stack
- **Stakeholder Rotation:** View as different stakeholder's problem/opportunity
- **Temporal Shift:** Change time horizon (longer, shorter, or retrospective from future)

**Power move:** Apply multiple reframes in sequence - often breakthrough comes from third or fourth reframing

### Cross-Domain Inspiration (references/cross-domain.md)

**Use when:** Facing novel problem, or problem that feels unsolved but likely has precedent elsewhere

**Process:**
1. **Abstract the pattern:** Strip away domain-specific details to find deep structure
2. **Find analogous domains:** Identify other fields facing same pattern
3. **Extract their solutions:** Study how they actually solve it (not superficially)
4. **Translate back:** Adapt their solution to your constraints

**Rich source domains:** Biology (adaptation), Urban Planning (scale), Military (strategy under uncertainty), Manufacturing (efficiency), Healthcare (diagnosis), Economics (resource allocation)

**Warning:** Avoid superficial analogies - must understand why solution works in source domain

## Workflow Example

**User problem:** "Our API keeps timing out but I've checked everything - database queries are fast, network is fine, server has capacity. I'm stuck."

### Step 1: Recognize trigger
"I've checked everything" + "I'm stuck" → Activate breakthrough-generator

### Step 2: Diagnose stuck type
Claiming exhaustion → Start with Assumption Excavation (Exhaustion Forcing)

### Step 3: Apply technique
Load `references/assumption-excavation.md`, apply Exhaustion Forcing checklist:
- Have you checked database connection pool exhaustion?
- Have you profiled actual request handling time vs. query time?
- Have you verified timeout is happening at API layer vs. client side?
- Have you checked for hidden network retries?
- Have you examined logs for patterns in failing requests?

**Discovery:** "Wait, I haven't actually profiled the full request - I just timed the database query"

### Step 4: If still stuck, add technique
Profile reveals database is fast, but response serialization is slow. Still unclear why timeouts.

Apply Lateral Thinking → Perspective Shifting: "What would an operations engineer see that I'm not seeing?"

**Discovery:** Ops would check monitoring. Checking reveals intermittent GC pauses causing timeouts during JSON serialization of large responses.

### Step 5: Generate solution
**Root cause:** Large JSON responses triggering GC during serialization
**Solutions unlocked:** 
- Paginate results (reduce response size)
- Stream response (avoid building full JSON in memory)
- Increase timeout specifically for known-large endpoints
- Add response size limits

## Advanced Patterns

### The Breakthrough Combination

When one technique reveals insight but not solution, combine techniques:

1. **Assumption Excavation** reveals hidden constraint
2. **Problem Reframing** views problem without that constraint
3. **Cross-Domain Inspiration** finds how other fields solve similar
4. **Lateral Thinking** generates concrete implementation approaches

**Example:**
- Excavation: "We assume we need real-time sync"
- Reframe: "What if eventual consistency is fine?"
- Cross-domain: "How does email handle this?" → Store-and-forward
- Lateral: "Po: Sync should happen less often" → Batch sync + optimistic updates

### The Progressive Reframing Loop

Reframe repeatedly until problem becomes trivial:

1. Start: "How to make deploys faster?"
2. Reframe 1: "How to deploy less often?"
3. Reframe 2: "Why do we deploy so often?"
4. Reframe 3: "What are we really trying to achieve?"
5. Insight: "Fast feedback" → Better staging environment eliminates need for frequent production deploys

### The Constraint Flip

When stuck on constraint:

1. **Identify** the blocking constraint
2. **Invert** it completely using Assumption Inversion
3. **Explore** what becomes possible
4. **Extract** the principle from the inversion
5. **Apply** principle within original constraint

**Example:**
- Constraint: "Can't change database schema (legacy system)"
- Invert: "Must change schema constantly"
- Explore: Would need abstraction layer to isolate changes
- Principle: Abstraction layer provides flexibility
- Apply: Build abstraction layer that makes schema changes irrelevant

## Best Practices

### Do:
- **Start with diagnosis** - understand type of stuck before applying techniques
- **Read full reference files** - don't just skim, the depth matters
- **Apply systematically** - work through technique steps, don't just brainstorm vaguely
- **Generate multiple options** - each technique should yield several concrete approaches
- **Combine techniques** when single technique insufficient
- **Be willing to challenge user's problem statement** - sometimes the stated problem is wrong

### Don't:
- **Don't jump to techniques without recognizing stuck pattern** - diagnosis matters
- **Don't apply superficially** - "think outside the box" without structure doesn't help
- **Don't give up after one technique** - breakthroughs often require combination
- **Don't accept "impossible" without challenging assumptions** - most constraints are negotiable
- **Don't forget to translate back** - techniques generate insights, need concrete solutions

## References

This skill includes comprehensive reference documentation:

### references/lateral-thinking.md
Techniques for breaking out of conventional problem-solving patterns: Provocation, Reverse Assumption, Random Word Association, Perspective Shifting, Constraint Manipulation, Problem Reframing, Bisociation, Exhaustion Forcing, Creative Questioning.

Load this when: Stuck in logical loops, need creative breakthrough, conventional solutions exhausted.

### references/assumption-excavation.md
Methods for identifying and challenging hidden assumptions: Assumption Pyramid, Five-Why Excavation, Assumption Inversion Test, Constraint Audit, Stakeholder Lens, Time-Travel Test, Dependency Web, Negation Test, Taboo Word Exercise, Hidden Assumptions Checklist.

Load this when: Suspect hidden constraints, need to verify exhaustion claims, problem feels unnecessarily limited.

### references/problem-reframing.md
Systematic frameworks for viewing problems through different lenses: Five Reframing Patterns (Goal Inversion, Constraint Embrace, Level Shift, Stakeholder Rotation, Temporal Shift), Eight Analysis Lenses (Constraint, Value, System, First Principles, User Journey, Economic, Political, Risk), Problem Statement Transformers.

Load this when: Problem feels wrong as stated, at wrong abstraction level, solutions treat symptoms not causes.

### references/cross-domain.md
Methods for borrowing solutions from other fields: The Analogy Engine (abstract, find domains, extract solutions, translate), Domain Solution Library (Biology, Urban Planning, Military, Economics, Healthcare, Manufacturing, Physics), Analogical Problem-Solving Process, Advanced Techniques (Multi-Domain Synthesis, Temporal Analogy, Inversion Analogy).

Load this when: Facing novel problem, need inspiration from proven solutions elsewhere, conventional approaches in field have failed.
