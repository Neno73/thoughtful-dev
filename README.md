# Thoughtful Dev - Claude Code Marketplace

Transform Claude Code from a fast coder into a **thoughtful development partner**.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-purple)

---

## 🎯 What This Does

Prevents **"code first, realize wrong later"** problems with three cognitive enhancement skills:

1. **Requirements Clarifier** - Surfaces ambiguity before coding starts
2. **Implementation Planner** - Analyzes approaches and risks before writing code  
3. **Breakthrough Generator** - Systematic problem-solving when stuck

Plus **safety-first workflows** (git branches, database protection), **black-box architecture** principles, and **progressive documentation** templates.

---

## 🚀 Quick Install

### Option 1: Direct Install (Recommended)

```bash
# Add marketplace and install plugin in one command
/plugin marketplace add Neno73/thoughtful-dev
/plugin install thoughtful-dev
```

### Option 2: Step-by-Step

```bash
# Add the marketplace
/plugin marketplace add Neno73/thoughtful-dev

# Browse available plugins
/plugin

# Install the plugin
/plugin install thoughtful-dev@thoughtful-dev-marketplace
```

### Option 3: Auto-Install for Teams

Add to your project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "thoughtful-dev-marketplace": {
      "source": {
        "source": "github",
        "repo": "Neno73/thoughtful-dev"
      }
    }
  },
  "enabledPlugins": ["thoughtful-dev"]
}
```

When team members trust the repository, Claude Code automatically installs the marketplace and plugin.

---

## 📦 What's Included

### Core Skills (109KB total)

#### 1. Requirements Clarifier (18KB)
**Prevents:** Coding before understanding the full scope

**Activates when:** User gives ambiguous requirements like "add authentication"

**Does:**
- Asks stack-specific clarifying questions
- Surfaces hidden assumptions
- Gets explicit agreement before coding

**Example:**
```
User: "Add authentication"

Claude: [Activates skill]
"Let me clarify before I start:

1. Authentication method?
   - Email/password
   - OAuth (Google, GitHub, etc.)
   - Magic link

2. Integration with Strapi backend?
   - Yes, use Strapi's auth
   - No, separate auth service

3. Scope?
   - Just login/logout
   - Also password reset, email verification

4. Session management?
   - JWT tokens
   - Server-side sessions

Which direction should I take?"
```

#### 2. Implementation Planner (23KB)
**Prevents:** Rushing into code without considering trade-offs

**Activates when:** Requirements are clear and user is ready to build

**Does:**
- Analyzes current state
- Proposes multiple approaches with honest trade-offs
- Identifies risks and mitigation strategies
- Creates step-by-step implementation plan

**Example:**
```
Claude: [Activates skill]
"## Implementation Analysis

### Current State
- Next.js 14 with App Router
- Strapi backend at /api
- No auth currently

### Proposed Approaches

**Option A: NextAuth.js**
- ✅ Pros: Battle-tested, built-in session management
- ❌ Cons: Custom adapter needed for Strapi
- 🎯 Risk: Low | Effort: Medium (2-3 hours)

**Option B: Manual OAuth**
- ✅ Pros: Full control, perfect Strapi integration
- ❌ Cons: Security complexity, more maintenance
- ⚠️ Risk: High | Effort: Large (6-8 hours)

### Recommendation: Option A
Lower risk, faster delivery, proven pattern.

### Implementation Steps:
1. Install NextAuth.js and dependencies
2. Create Strapi adapter
3. Configure auth API routes
4. Add session provider to layout
5. Create login/logout components
6. Test auth flow

Ready to proceed with Option A?"
```

#### 3. Breakthrough Generator (68KB total)
**Prevents:** Getting stuck without systematic problem-solving techniques

**Activates when:** User says "tried everything" or similar frustration

**Does:**
- Applies 9 lateral thinking techniques
- Uses 8 assumption excavation methods
- Employs 5 problem reframing patterns
- Draws from 7 cross-domain inspiration libraries
- Progressive disclosure (loads only needed sections)

**Example:**
```
User: "API keeps timing out, I've tried everything"

Claude: [Activates skill]
[Applies Assumption Excavation → Exhaustion Forcing]

"Let me verify you've actually tried EVERYTHING:

❓ What you measured:
- Query execution time: 50ms
- Did you profile FULL request time? (Not just query)

❓ What you didn't check:
- Connection pool exhaustion?
- GC pauses during response serialization?
- Network latency between services?
- JSON serialization of large payloads?

🔍 Let's check JSON serialization:
How large is the response payload? (MB?)

[After user responds with "2.5MB"]

💡 BREAKTHROUGH HYPOTHESIS:
The API isn't timing out - it's taking 30+ seconds
to serialize 2.5MB of JSON in memory.

🎯 Solutions:
1. Paginate the response (100 items per page)
2. Stream the response instead of buffering
3. Use a CDN for static data

Which approach fits your use case?"
```

---

### Templates & Documentation

#### Personal CLAUDE.md (7KB)
User-level methodology file for `~/.claude/CLAUDE.md`

**Includes:**
- Critical safety rules (git workflow, database operations)
- Autonomy & judgment guidelines
- Before-coding protocols (invoke skills)
- Black-box architecture principles
- Documentation protocol
- Session hygiene best practices

#### Project Templates (7 files)
Project-level `.claude/` directory structure

**Files:**
- `INDEX.md` - Table of contents for progressive discovery
- `STACK.md` - Tech stack with versions and rationale
- `ARCHITECTURE.md` - System design and data flow
- `PATTERNS.md` - Code conventions with examples
- `DECISIONS.md` - Architectural Decision Records (append-only)
- `STARTUP.md` - Build/run/test commands, troubleshooting
- `GOTCHAS.md` - Known issues and workarounds

---

## 🛡️ Safety Features

### Git Workflow Protection
```
User: "git push origin main"

Claude: [STOPS immediately]
"⛔ NEVER push directly to main.

Creating feature branch instead:
$ git checkout -b feature/your-feature
$ git push origin feature/your-feature

Would you like me to create a pull request?"
```

### Database Safety
```
User: "Drop the users table"

Claude: [STOPS and asks]
"⚠️ DESTRUCTIVE OPERATION DETECTED

You're asking me to:
- DROP TABLE users

This will permanently delete all user data.

Are you absolutely sure? (yes/no)"
```

### Secrets Protection
```
Claude: [Before any commit]
"🔍 Checking for secrets...
❌ Found hardcoded API key in config.js:12
✅ Added .env to .gitignore
✅ Created .env.example template

Secrets protected. Safe to commit."
```

---

## 🏗️ Architecture Philosophy

Based on **Eskil Steenberg's Black-Box Architecture**:

1. **Constant Velocity** - Write 5 new lines today vs. edit 1 line later
2. **Complete Ownership** - One module, one person, full responsibility
3. **Everything Replaceable** - Can't understand it? Rewrite it.
4. **Clean Interfaces** - Hide implementation details
5. **Single Responsibility** - One module, one purpose

---

## 📊 Built-in Tech Stack Support

**Optimized for:**
- Next.js 14+ (App Router, Server/Client Components, Server Actions)
- Strapi (API patterns, population, authentication)
- Medusa (Store/Admin APIs, cart handling)
- Tailwind CSS (utility-first styling)
- shadcn/ui (component library conventions)
- TypeScript (strict mode, type safety)

**Easily adaptable** for other stacks by customizing templates.

---

## 🎬 Demo Scenarios

### Scenario 1: Building Authentication
```
User: "Add authentication"
→ requirements-clarifier: Asks OAuth vs email/password, Strapi integration
→ Gets explicit agreement on scope
→ implementation-planner: Proposes NextAuth.js vs manual, analyzes trade-offs
→ Creates step-by-step plan
→ Gets approval
→ Implements on feature branch with safety checks
→ Updates documentation
```

### Scenario 2: Debugging Stuck Problem
```
User: "API timing out, tried everything"
→ breakthrough-generator: Applies Assumption Excavation
→ Discovers only query was profiled, not full request
→ Reveals GC pause during JSON serialization
→ Breakthrough: Paginate or stream the response
```

### Scenario 3: Safety Protection
```
User: "git push origin main"
→ Safety rules: STOPS immediately
→ Creates feature/your-feature branch instead
→ Pushes to feature branch
→ Creates pull request
```

---

## 🎯 Perfect For

✅ Developers who want thoughtful collaboration, not just speed  
✅ Teams needing consistent code quality and documentation  
✅ Projects using Next.js + Strapi + Medusa (or similar stacks)  
✅ Anyone who's experienced "code first, fix later" pain  
✅ Developers who value safety guardrails  

❌ Quick prototyping where speed > thoughtfulness  
❌ Solo hobby projects with no documentation requirements  

---

## 📚 Documentation

- [Installation Guide](./INSTALL.md) - Detailed setup instructions
- [Contributing Guidelines](./CONTRIBUTING.md) - How to improve the plugin
- [Changelog](./CHANGELOG.md) - Version history and updates
- [License](./LICENSE) - MIT License

---

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

**Ways to contribute:**
- Report bugs and suggest features via [Issues](https://github.com/Neno73/thoughtful-dev/issues)
- Submit pull requests for improvements
- Share your experience using the plugin
- Suggest new skills or templates

---

## 📄 License

MIT License - see [LICENSE](./LICENSE) file for details.

---

## 🙏 Acknowledgments

Built on Claude Code plugin system by Anthropic.

Inspired by:
- Eskil Steenberg's Black-Box Architecture
- Test-Driven Development (TDD) methodology
- Community best practices from Claude Code users

---

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/Neno73/thoughtful-dev/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Neno73/thoughtful-dev/discussions)

---

**Transform Claude Code from fast coder to thoughtful partner!** 🚀
