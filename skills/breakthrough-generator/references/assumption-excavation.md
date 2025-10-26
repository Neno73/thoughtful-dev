# Assumption Excavation

Methods for identifying and challenging hidden assumptions that constrain solution space.

## The Assumption Pyramid

Problems contain layers of assumptions - surface, structural, and foundational.

### Surface Assumptions
**Characteristics:** Explicitly stated, easily identified, often questioned
**Examples:**
- "Users won't wait more than 2 seconds"
- "We need to use REST API"
- "The database is the bottleneck"

### Structural Assumptions
**Characteristics:** Implicit in design, shape solution space, rarely questioned
**Examples:**
- "This must be solved in software"
- "Authentication happens at the gateway"
- "Data must be consistent immediately"

### Foundational Assumptions
**Characteristics:** So basic they're invisible, define the problem itself, almost never questioned
**Examples:**
- "This is a technical problem"
- "We need to solve this ourselves"
- "This is one problem, not several"
- "The problem statement is correct"

## The Five-Why Excavation

Dig deeper into assumptions by repeatedly asking "why."

**Method:**
1. State the constraint/requirement
2. Ask "Why is this necessary?"
3. For each answer, ask "Why?" again
4. Continue 5 levels deep
5. Examine if the root reason is still valid

**Example:**
- **Level 1:** "We need real-time updates"
- **Level 2:** Why? "Because users expect instant feedback"
- **Level 3:** Why? "Because modern apps work that way"
- **Level 4:** Why? "Because technology enables it"
- **Level 5:** Why? "Because... wait, do users actually need this? Or is eventual consistency fine?"

**Common revelations:**
- "Because that's how we've always done it" (habit, not requirement)
- "Because everyone else does it" (cargo culting)
- "Because it feels right" (aesthetic preference, not functional need)
- "Because I assumed we had to" (unexamined constraint)

## The Assumption Inversion Test

Flip each assumption and explore what becomes possible.

**Method:**
1. List all assumptions about the problem
2. For each, state the opposite
3. Ask: "What would have to be true for this opposite to work?"
4. Explore those conditions

**Examples:**

**Assumption:** "Users must log in"
- **Inversion:** Users never log in
- **What if true:** Anonymous personalization via cookies/fingerprinting, no sensitive data, public-only features
- **Insight:** Maybe we're mixing public and private features that should be separate

**Assumption:** "The API must be fast"
- **Inversion:** The API should be slow
- **What if true:** Better caching strategy, async processing, user expectations management
- **Insight:** Maybe we're making too many API calls; batch them or cache more aggressively

**Assumption:** "We need more engineers"
- **Inversion:** We need fewer engineers
- **What if true:** Simpler architecture, better tools, less features, more focus
- **Insight:** Maybe we have a complexity problem, not a capacity problem

## The Constraint Audit

Systematically categorize and challenge every constraint.

**Categories:**

### 1. Physical Constraints
- Actually impossible (violates physics/math)
- Example: "Can't process infinite data in finite time"
- **Challenge rarely needed** - these are usually real

### 2. Resource Constraints
- Limited by money, time, people, infrastructure
- Example: "Budget is $10K"
- **Challenge:** Is this truly fixed? Can we phase it? Find sponsors? Reduce scope?

### 3. Technical Constraints
- Limited by technology, tools, platforms
- Example: "The framework doesn't support this"
- **Challenge:** Is this actually true? Are there workarounds? Different frameworks? Custom solutions?

### 4. Organizational Constraints
- Limited by policy, politics, approval chains
- Example: "Legal won't approve that"
- **Challenge:** Have we actually asked? Can we make it compliant? Is there precedent?

### 5. Assumed Constraints
- Limitations we've imposed on ourselves
- Example: "Users won't understand that"
- **Challenge:** Have we tested? Could we design better? Educate users?

**Process:**
1. List every constraint on your problem
2. Categorize each one
3. For anything not in category #1, ask: "Is this actually true, or am I assuming?"
4. Test the questionable ones

## The Stakeholder Lens

Different stakeholders have different assumptions - explore them all.

**Method:** For each stakeholder, ask:
1. What would they assume is most important?
2. What would they assume is impossible?
3. What would they not even consider?

**Example stakeholders:**
- **End users:** Assume they want simplicity, speed, reliability
- **Developers:** Assume elegant code, good architecture, maintainability  
- **Business:** Assume revenue, growth, competitive advantage
- **Operations:** Assume stability, monitoring, disaster recovery
- **Security:** Assume zero trust, defense in depth, compliance

**Insight comes from conflicts:**
- Users assume "secure" means visible locks/indicators
- Security assumes "secure" means proper crypto and zero trust
- **Hidden tension:** Security features can make users feel less secure if UX is wrong

## The Time-Travel Test

Assumptions often become visible when viewed across time.

**Past View:**
- "How would someone solve this problem 10 years ago?"
- Often reveals modern assumptions about tooling/infrastructure
- Example: "We need a React framework" - 10 years ago, jQuery was fine

**Future View:**
- "If I solve this now, what will I regret in 2 years?"
- Reveals short-term thinking
- Example: "Quick and dirty works" - future you says "why is this unmaintainable?"

**Alternate Timeline:**
- "If I started this project today with fresh perspective, what would I do differently?"
- Reveals accumulation of incremental compromises

## The Dependency Web

Map assumptions that depend on other assumptions.

**Method:**
1. List all assumptions
2. Draw arrows showing dependencies
3. Find the "load-bearing" assumptions that support many others
4. Challenge those first - maximum impact

**Example:**
```
"Must be real-time"
    ↓
"Need WebSockets"
    ↓
"Need stateful server"
    ↓
"Can't scale horizontally"
    ↓  
"Need expensive infrastructure"
```

Challenge the root ("Must be real-time") and entire structure collapses.

## The Negation Test

Powerful for finding hidden assumptions in problem statements.

**Method:**
1. Take the problem statement
2. Add "...and we must NOT..." for each obvious solution
3. The forbidden solutions reveal your assumptions about valid approaches

**Example:**
- **Problem:** "How do we speed up page load?"
- **Negations:**
  - "...without caching" → Reveals assumption that caching is option
  - "...without CDN" → Reveals assumption that infrastructure is changeable
  - "...without reducing features" → Reveals assumption that feature count is negotiable
  - "...without changing tech stack" → Reveals assumption about technical freedom

**Insight:** Each negation reveals a degree of freedom you assumed you had.

## The Taboo Word Exercise

Ban certain words to force new thinking.

**Method:**
1. Identify overused words in problem discussions
2. Ban them temporarily
3. Describe problem without those words
4. Notice what new descriptions emerge

**Common taboo words:**
- "Just" (as in "just do X") - hides complexity
- "Should" - hides value judgment
- "Obviously" - hides assumption
- "Simply" - hides difficult tradeoffs
- "Fast/slow" - hides missing metrics
- "Better/worse" - hides evaluation criteria

**Example:**
- **With taboo words:** "We should just make it faster"
- **Without:** "We need to reduce response time from 2s to 500ms for the primary user flow because..." 
- **Reveals:** What "fast" means, which flow, why it matters

## The Assumption Origin Trace

Understand where assumptions come from to evaluate their validity.

**Categories:**

1. **Inherited assumptions** - Came with the codebase/project
   - Often outdated, originally made sense, no longer valid
   - Challenge: "Was this true then? Is it true now?"

2. **Social assumptions** - Came from what others do
   - Often cargo-culted, "best practices" that aren't
   - Challenge: "Why do they do it? Does that apply to us?"

3. **Emotional assumptions** - Came from fear, preference, comfort
   - Often risk aversion, aesthetic choices, habit
   - Challenge: "Am I avoiding this because it's wrong or scary?"

4. **Logical assumptions** - Came from reasoning and evidence
   - Often valid, but premises may have changed
   - Challenge: "Is the evidence still current? Were the premises right?"

**Process:**
1. For each assumption, ask "Where did this come from?"
2. Evaluate the source's current validity
3. Keep only those that pass scrutiny

## Hidden Assumptions Checklist

Common hidden assumptions to actively look for:

### Problem Framing Assumptions
- [ ] This is one problem, not multiple separate problems
- [ ] This is the right problem to solve
- [ ] This problem needs solving at all
- [ ] The problem is what the user said, not something deeper

### Solution Space Assumptions
- [ ] The solution must be technical
- [ ] The solution must be novel
- [ ] The solution must be elegant
- [ ] The solution must be complete
- [ ] There is one best solution

### Context Assumptions  
- [ ] Current constraints will persist
- [ ] Current resources are all we'll have
- [ ] Current timeline is fixed
- [ ] Current team composition is fixed

### Requirement Assumptions
- [ ] All stated requirements are real requirements
- [ ] Requirements are correctly prioritized
- [ ] Requirements are mutually compatible
- [ ] Requirements solve the actual problem

### Technical Assumptions
- [ ] The tech stack is correct
- [ ] The architecture is appropriate
- [ ] The data model is right
- [ ] The scale estimates are accurate
- [ ] The performance requirements are real

### User Assumptions
- [ ] We know what users want
- [ ] We know how users will behave
- [ ] Users are like us
- [ ] Users will use it as intended

### Success Assumptions
- [ ] We know what success looks like
- [ ] Success is measurable
- [ ] Success is achievable with this approach
- [ ] Success justifies the effort

## Usage Guide

**When stuck, systematically:**

1. **Start with Time-Travel Test** - Quick, reveals obvious modern assumptions
2. **Apply Five-Why Excavation** - Dig into the biggest constraint
3. **Run Constraint Audit** - Categorize all constraints, focus on categories 3-5
4. **Use Assumption Inversion** - Flip the load-bearing assumptions
5. **Apply Negation Test** - Understand forbidden solutions
6. **Check Hidden Assumptions Checklist** - Catch common blind spots

**Emergency fast mode when very stuck:**
1. Ban "should/just/obviously/simply" from discussion
2. Invert the 3 biggest assumptions
3. Ask "What would past me/future me think of this approach?"

**Combination with other techniques:**
- Find assumptions → Use lateral thinking to break them
- Find assumptions → Reframe problem without them
- Find assumptions → Apply constraint manipulation to them
