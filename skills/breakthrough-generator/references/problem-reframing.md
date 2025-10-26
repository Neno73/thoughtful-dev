# Problem Reframing Frameworks

Systematic methods for viewing problems through different lenses to unlock new solution paths.

## The Five Reframing Patterns

### 1. Goal Inversion: "Don't do X" → "Prevent needing X"

Instead of achieving goal directly, eliminate the need for it.

**Pattern:** "How to X" → "How to avoid needing X"

**Examples:**
- "How to deploy faster" → "How to deploy less often" → Batch releases, feature flags
- "How to debug complex system" → "How to prevent bugs" → Better types, contracts, testing
- "How to optimize database" → "How to query it less" → Aggressive caching, denormalization
- "How to scale servers" → "How to need fewer servers" → Edge caching, static generation

**When to use:** When direct solution is expensive/complex, or when symptom vs root cause unclear

### 2. Constraint Embrace: "X is impossible" → "What if X being impossible is good?"

Turn the obstacle into the feature.

**Pattern:** "Can't do X because Y" → "How does Y enable better solutions?"

**Examples:**
- "Can't use real-time updates (bandwidth)" → Embrace: Optimistic UI, local-first architecture
- "Can't hire more engineers (budget)" → Embrace: Simpler architecture, better tools, more focus
- "Can't break backward compatibility" → Embrace: Versioned APIs, adapters, evolutionary design
- "Can't change legacy system" → Embrace: Build around it, strangler pattern, facade layer

**When to use:** When constraints feel insurmountable, or when fighting constraints hasn't worked

### 3. Level Shift: "Problem at layer N" → "Actually problem at layer N±1"

Move up/down the abstraction stack.

**Pattern:** Technical → Human, or Infrastructure → Application, or Feature → Architecture

**Examples:**

**Shift Up (More Abstract):**
- "API is slow" → "Users perceive slowness" → Better loading states, optimistic updates
- "Code is complex" → "Requirements are complex" → Simplify product, not code
- "Database design is wrong" → "Data model is wrong" → Fix domain model first

**Shift Down (More Concrete):**  
- "Need better architecture" → "Need better module boundaries" → Specific refactoring targets
- "Culture problem" → "Meeting structure problem" → Fix retrospective format
- "Strategy is unclear" → "Decision process is broken" → Define RACI, decision framework

**When to use:** When solutions at current level aren't working, or feel like treating symptoms

### 4. Stakeholder Rotation: "My problem" → "Their opportunity"

View problem through different stakeholder's goals.

**Method:** Reframe problem as seen by:
- End users: "How do users benefit?"
- Business: "What revenue opportunity?"
- Engineers: "What technical debt removal?"  
- Operations: "What operational simplification?"
- Security: "What risk reduction?"
- Support: "What ticket volume reduction?"

**Examples:**
- "Need to add feature X" 
  - User view: "Finally can do Y easily"
  - Business view: "Captures Z market segment"
  - Engineer view: "Excuse to refactor messy module"
  - Support view: "Reduces top complaint"

**When to use:** When struggling to justify solution, or when facing resistance from stakeholders

### 5. Temporal Shift: "Today's problem" → "Different time frame"

Change the time horizon to reveal different problem/solution spaces.

**Patterns:**

**Extended (Longer horizon):**
- "How to ship this feature" → "How to build sustainable feature pipeline"
- "How to fix this bug" → "How to prevent this class of bugs"
- "How to meet deadline" → "How to make deadlines less stressful"

**Compressed (Shorter horizon):**
- "Build perfect system" → "What ships value in 1 week?"
- "Comprehensive solution" → "What's the MVP?"
- "Solve entire problem" → "What's the smallest step forward?"

**Retrospective (From future):**
- "Should we build X?" → "In 2 years, what will we regret about X?"
- "Which architecture?" → "Which will we be happy maintaining in 5 years?"

**When to use:** When perfectionism blocks progress, or when short-term thinking causes problems

## The Lens Catalog

Systematic frameworks for viewing any problem through different perspectives.

### Lens 1: The Constraint Lens

**View problem purely as constraints and what they enable/disable.**

**Questions:**
- What are ALL the constraints (budget, time, tech, people, policy)?
- Which constraints are real vs. assumed?
- Which constraints are actually opportunities in disguise?
- What becomes possible if we remove each constraint?
- What becomes impossible if we add extreme constraints?

**Example:**
- Problem: "Can't scale database"
- Through constraint lens: 
  - Real constraint: Budget for hardware
  - Assumed constraint: Must use SQL database
  - Hidden opportunity: Constraint forces us to fix inefficient queries
  - With constraint removed: Could shard, but reveals we don't need to
  - With extreme constraint: If storage was $0, we'd cache everything

### Lens 2: The Value Lens

**View problem purely in terms of value creation/delivery.**

**Questions:**
- What value are we actually trying to create?
- For whom?
- Why does that value matter?
- What's preventing value delivery?
- What's the simplest way to deliver that value?

**Example:**
- Problem: "Real-time updates aren't working"
- Through value lens:
  - Value: Users see current state
  - For whom: Collaborative users
  - Why matters: Make correct decisions
  - Prevention: Technical sync complexity
  - Simplest delivery: Periodic refresh + "last updated" timestamp

### Lens 3: The System Lens

**View problem as part of larger system with feedback loops.**

**Questions:**
- What system is this problem part of?
- What are the feedback loops?
- What are the downstream effects?
- What are the upstream causes?
- What's the leverage point?

**Example:**
- Problem: "Too many bugs in production"
- Through system lens:
  - System: Development → Testing → Deploy → Monitor → Fix
  - Feedback: Fast (monitoring) but fixes are slow (deploy cycle)
  - Downstream: User trust erosion, support load
  - Upstream: Fast iteration pressure, testing culture
  - Leverage: Improve deploy cycle speed (enables faster fixes, encourages testing)

### Lens 4: The First Principles Lens

**Strip away assumptions to fundamental truths.**

**Questions:**
- What are we actually trying to accomplish? (Not how, but what and why)
- What are the immutable requirements?
- What are the fundamental constraints (physics, math, logic)?
- What would this look like if we designed from scratch today?
- What are we assuming that isn't necessarily true?

**Example:**
- Problem: "Authentication is too slow"
- Through first principles:
  - Actually trying to: Verify user identity
  - Immutable: Need proof of identity
  - Fundamental: Math of crypto is fast, network is slow
  - From scratch: Would use JWT tokens, not session cookies
  - Assuming: Need to verify every request (could cache verification)

### Lens 5: The User Journey Lens

**View problem through user's experience across time.**

**Questions:**
- What's the user's goal?
- What's their journey to achieve it?
- Where does this problem appear in their journey?
- What came before? What comes after?
- How does this affect their overall experience?

**Example:**
- Problem: "Signup form has high abandonment"
- Through user journey:
  - Goal: Start using the product
  - Journey: Discover → Decide → Signup → Onboard → Use
  - Problem appears: At friction point before value
  - Before: User is motivated (just decided to try)
  - After: User gets value (if they make it)
  - Overall effect: Loses motivated users before they see value
  - Insight: Defer signup until after initial value delivery

### Lens 6: The Economic Lens

**View problem purely as resource allocation and opportunity cost.**

**Questions:**
- What resources (time, money, attention) does this consume?
- What's the opportunity cost?
- What's the ROI of solving vs. not solving?
- What's the value of information (would data change decision)?
- What's the cost of being wrong?

**Example:**
- Problem: "Should we build feature X?"
- Through economic lens:
  - Resources: 3 engineer-months
  - Opportunity cost: Could build features Y+Z instead
  - ROI solve: 10% user retention improvement
  - ROI not solve: Users use workaround, neutral retention
  - Value of information: A/B test mockup would clarify need
  - Cost of wrong: If overbuilt, 3 months wasted; if underbuilt, can iterate

### Lens 7: The Political Lens

**View problem as conflicting interests and power dynamics.**

**Questions:**
- Who has what interests?
- Who has what power?
- What are the alliances?
- What are the conflicts?
- What does each party need to win?

**Example:**
- Problem: "Can't get approval for architectural change"
- Through political lens:
  - Engineering wants: Technical elegance, maintainability
  - Product wants: Features, speed
  - Operations wants: Stability, no surprises
  - Leadership wants: Risk mitigation, business value
  - Power: Leadership has veto, product has priority setting
  - Conflict: Technical vs. feature velocity
  - Each needs: Engineering needs stability guarantees, product needs timeline, ops needs rollback plan
  - Solution: Phased approach with rollback, ties technical improvement to feature velocity

### Lens 8: The Risk Lens

**View problem through what could go wrong and probability × impact.**

**Questions:**
- What are all possible failure modes?
- What's the probability of each?
- What's the impact of each?
- What are the warning signs?
- What are the mitigation strategies?
- Which risks are worth taking?

**Example:**
- Problem: "Choose between approach A (proven but slow) vs. B (fast but novel)"
- Through risk lens:
  - A risks: Opportunity cost (slow), competitive disadvantage
  - B risks: Technical failure, timeline overrun, team learning curve
  - Probability: A is certain slow, B is uncertain but potentially fast
  - Impact: A is manageable drag, B could be disaster or triumph
  - Warning signs: Early B prototypes showing issues
  - Mitigation: Timeboxed B spike, fallback to A
  - Worth taking: Yes, if can detect failure early and pivot

## The Problem Statement Transformer

Systematic ways to rewrite problem statements to reveal new angles.

### Transform Type 1: Question Flipping

**Original question → Flipped question**

**Patterns:**
- "How to achieve X?" → "How to avoid needing X?"
- "How to fix X?" → "How to live with X?"
- "How to add X?" → "How to remove X?"
- "How to speed up X?" → "How to slow down X meaningfully?"
- "How to make X better?" → "What's right about X as-is?"

### Transform Type 2: Subject Shifting

**Original subject → Different subject**

**Patterns:**
- "User can't do X" → "System doesn't enable X"
- "System is slow" → "User perceives slowness"
- "Code is complex" → "Requirements are complex"
- "Feature is missing" → "Value is undelivered"
- "Bug exists" → "Quality process failed"

### Transform Type 3: Scope Adjusting

**Original scope → Narrower or broader scope**

**Patterns:**
- "Fix entire system" → "Fix this one use case"
- "Make everything fast" → "Make primary flow fast"
- "Solve for all users" → "Solve for power users first"
- "Build complete feature" → "Build smallest valuable piece"

Conversely:
- "Fix this bug" → "Fix this class of bugs"
- "Speed up this query" → "Rethink data access strategy"
- "Add this feature" → "Evolve product capability"

### Transform Type 4: Negative to Positive

**What's wrong → What's desired**

**Patterns:**
- "Too slow" → "Need 500ms response time for primary flow"
- "Users are confused" → "Users need clear mental model for X"
- "System is complex" → "System needs clear separation of concerns"
- "Can't scale" → "Need to handle 10x traffic with current architecture"

### Transform Type 5: Symptom to Cause

**Observed problem → Root cause**

**Patterns:**
- "API times out" → "Database query scans full table"
- "Users don't understand feature" → "Feature doesn't match user mental model"
- "Team is slow" → "Deployment process has 15-step manual checklist"
- "Code is buggy" → "Test coverage is missing for edge cases"

## The Reframing Decision Tree

When stuck, follow this systematic reframing process:

```
1. Is this the right problem?
   ├─ NO → Use Temporal Shift (retrospective: what will we regret?)
   └─ UNSURE → Use First Principles Lens

2. Have we tried the obvious solutions?
   ├─ YES → Use Goal Inversion (avoid needing X)
   └─ NO → Try obvious first, then reframe

3. Is there a constraining assumption?
   ├─ YES → Use Constraint Embrace (make it a feature)
   └─ UNSURE → Use assumption excavation first

4. Are we at the wrong abstraction level?
   ├─ TOO ABSTRACT → Use Level Shift (down to concrete)
   └─ TOO CONCRETE → Use Level Shift (up to abstract)

5. Is this a political problem disguised as technical?
   └─ POSSIBLY → Use Stakeholder Rotation + Political Lens

6. Are we solving for the wrong time horizon?
   └─ SHORT-TERM → Use Temporal Shift (extended)
   └─ LONG-TERM → Use Temporal Shift (compressed to MVP)
```

## Combination Strategies

Reframing techniques work better in combination:

### Combo 1: Double Reframe
1. Apply Goal Inversion: "Don't do X" → "Avoid needing X"
2. Apply Constraint Embrace to the avoidance approach
3. Result: Novel solution that neither reframe would find alone

**Example:**
- Start: "How to scale database"
- Inversion: "How to not need to scale"
- Embrace constraint: "Use impossibility of scaling as design forcing function"
- Result: Event sourcing with CQRS (doesn't need to scale relational DB)

### Combo 2: Lens Hopping
1. View through Lens A, identify insight
2. View through Lens B, identify insight
3. Find synthesis between insights
4. Result: Multi-dimensional solution

**Example:**
- Start: "Should we refactor or keep building?"
- Value Lens: Refactor delivers no user value
- System Lens: Technical debt compounds, eventually prevents value
- Economic Lens: Calculate inflection point where technical debt cost exceeds refactor cost
- Result: Threshold-based approach (refactor when debt impact > X)

### Combo 3: Progressive Reframing
1. Apply one reframe
2. Apply another reframe to the reframed problem
3. Apply another to that result
4. Continue until breakthrough

**Example:**
- Start: "How to make deploys faster?"
- Reframe 1 (Inversion): "How to deploy less?"
- Reframe 2 (Level Shift): "Why do we deploy so often?"
- Reframe 3 (First Principles): "What are we really trying to achieve?"
- Result: "Fast feedback loops" → Better staging environment makes deploys less urgent

## Usage Guidelines

**When to reframe:**
- Stuck after trying obvious solutions
- Solution feels like treating symptom, not cause
- High resistance to proposed solutions
- Problem seems unsolvable as stated
- Too many competing "right" solutions

**How to choose reframing technique:**
1. **If problem feels wrong** → First Principles Lens, Problem Statement Transformer
2. **If solution seems impossible** → Constraint Embrace, Goal Inversion
3. **If at wrong level** → Level Shift
4. **If stakeholders disagree** → Stakeholder Rotation, Political Lens
5. **If treating symptoms** → System Lens, Symptom to Cause transform
6. **If too big/small** → Scope Adjusting
7. **If timeline misaligned** → Temporal Shift

**Danger signs you need reframing:**
- "We've always done it this way"
- "There's no way to..."
- "Everyone says we should..."
- "It's impossible to..."
- "We just need to..."
- Circular arguments
- Analysis paralysis
- Argument about "right" solution

**Reframing success indicators:**
- Sudden clarity about what really matters
- Previously invisible options become obvious
- Resistance melts away
- Problem feels smaller/simpler
- Multiple stakeholders align
- "Why didn't we see this before?" moment
