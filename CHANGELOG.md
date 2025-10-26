# Changelog

All notable changes to the Thoughtful Dev plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.5] - 2025-10-26

### 🔄 New Feature - Documentation Maintenance System (Phase 1)

**Problem Solved:** Documentation becomes outdated as code evolves, creating drift between docs and reality.

**Solution:** Automated maintenance system that detects drift and keeps documentation current.

---

#### 1. New Skill: `doc-maintenance` (Auto-Reminder)

**Activates automatically after:**
- Implementing new features
- Adding/removing dependencies (package.json changes)
- Refactoring code structure
- Changing architecture or patterns

**What it does:**
```
You: "Added React Query for data fetching"

doc-maintenance skill:
"I noticed new patterns introduced.

Documentation updates needed:
📦 STACK.md - Add @tanstack/react-query
📝 PATTERNS.md - Document React Query pattern

Update now? (yes/no/auto)"
```

**Features:**
- ✅ **Ask mode** (default): Prompts before updating
- ✅ **Auto mode**: Updates automatically if enabled in CLAUDE.md
- ✅ Detects which docs need updates (STACK, PATTERNS, ARCHITECTURE, etc.)
- ✅ Offers specific fixes, not vague suggestions
- ✅ Prevents documentation drift in real-time

**Enable auto-updates:**
Add to CLAUDE.md:
```markdown
## Documentation Maintenance
Mode: auto
```

---

#### 2. New Command: `/thoughtful-dev:audit-docs`

**Purpose:** Comprehensive drift detection for periodic checks

**What it checks:**
- 📦 **STACK.md** - Missing/outdated dependencies, version mismatches
- 📝 **PATTERNS.md** - Documented patterns vs actual code patterns
- 🏗️ **ARCHITECTURE.md** - Directory structure, API endpoints, data flow
- ⚙️ **STARTUP.md** - package.json scripts changes
- ⚠️ **GOTCHAS.md** - Resolved issues, new workarounds

**Output - Concise Report:**
```
# 📋 Documentation Audit Report

## 📊 Summary
✓ 4 files up to date
⚠️ 2 files with minor drift
✗ 1 file with major drift

## 📦 STACK.md - ✗ Major Drift
Missing: @tanstack/react-query@5.0.0
Version mismatch: React 18.2.0 → 18.3.1

## 📝 PATTERNS.md - ⚠️ Minor Drift
Docs mention Redux, code uses Zustand

## 📝 Action Items
1. HIGH: Update STACK.md (2 changes)
2. MEDIUM: Update PATTERNS.md (1 change)
```

**When to run:**
- Weekly during active development
- Before releases/milestones
- When suspicious of drift

---

#### 3. Enhanced: `/thoughtful-dev:init-project`

**Updated to include maintenance instructions:**

Generated CLAUDE.md now includes:
```markdown
## Documentation Maintenance
Mode: ask

The `doc-maintenance` skill will remind you to update docs after:
- Adding/removing dependencies
- Changing architecture or patterns
- Refactoring code structure

Run `/thoughtful-dev:audit-docs` periodically to check for drift.
```

Users learn about maintenance from project initialization.

---

### How the System Works Together

**Real-time Prevention (Skill):**
```
[User adds new dependency]
→ doc-maintenance skill activates
→ "STACK.md needs update - add now?"
→ Drift prevented immediately
```

**Periodic Detection (Command):**
```
[Before release]
→ User runs /audit-docs
→ Comprehensive drift report generated
→ Fix accumulated issues
```

**Both create feedback loop:** Skill catches most drift, audit catches what slipped through.

---

### Drift Detection Priorities (What We Monitor)

**HIGH Priority:**
1. Tech stack changes (dependencies, versions)
2. Pattern evolution (Redux → Zustand, etc.)
3. Architecture changes (new modules, API endpoints)

**MEDIUM Priority:**
4. Build/deploy changes (new commands, env vars)
5. Resolved issues (TODOs removed)

**LOW Priority:**
6. Minor updates (patch versions, cosmetic changes)

---

### Benefits

- ✅ **Prevents drift:** Catch outdated docs immediately
- ✅ **Low friction:** Auto-prompts, no manual tracking needed
- ✅ **Actionable:** Shows exactly what to fix
- ✅ **Flexible:** Ask mode (default) or auto mode (opt-in)
- ✅ **Comprehensive:** Periodic audits catch everything
- ✅ **Integrated:** Works with existing documentation structure

---

### What's Included in v1.0.5

**New Files:**
- `skills/doc-maintenance/SKILL.md` - Auto-reminder skill
- `commands/audit-docs.md` - Drift detection command

**Modified Files:**
- `commands/init-project.md` - Adds maintenance section to generated CLAUDE.md

**Plugin Components:**
- ✅ 4 Skills (requirements-clarifier, implementation-planner, breakthrough-generator, **doc-maintenance**)
- ✅ 3 Commands (init-project, init-personal, **audit-docs**)
- ✅ Templates (personal + 7 project files)

---

### Usage Examples

**After implementing feature:**
```bash
# Skill automatically activates
"Documentation updates needed - update now?"
→ Choose yes/no/auto
```

**Periodic audit:**
```bash
/thoughtful-dev:audit-docs
→ Get concise drift report
→ Fix issues
```

**Enable auto-updates:**
```bash
# Add to CLAUDE.md:
## Documentation Maintenance
Mode: auto
```

---

### Technical Details

Based on:
- [CLAUDE.md Protocol](https://engineering-blog.anthropic.com) - Documentation maintenance best practices
- Real-time drift detection via skill descriptions
- Comparison of package.json, code structure, and documented state
- Concise, actionable reporting format

---

## [1.0.4] - 2025-10-26

### 🎯 Enhanced: Proper CLAUDE.md Memory Architecture

**Updated `/thoughtful-dev:init-project` command:**

Now creates the **optimal hierarchical memory structure** per CLAUDE.md Protocol:

**1. Root CLAUDE.md (Lean Manifest)**
- Auto-discovered and loaded by Claude every session
- Contains only essential, always-relevant context:
  * Project description
  * Core commands (dev, test, build)
  * Mandatory rules (TDD, git workflow, DO NOT touch areas)
- Uses `@import` statements to reference detailed docs

**2. Modular .claude/ Documentation**
- Detailed docs loaded on-demand via @import
- Prevents context pollution while maintaining comprehensive knowledge
- Files: INDEX.md, STACK.md, ARCHITECTURE.md, PATTERNS.md, STARTUP.md, GOTCHAS.md, DECISIONS.md

**Key Architecture Pattern:**
```
project/
├── CLAUDE.md              ← Claude's entry point (lean, with @imports)
└── .claude/
    ├── INDEX.md           ← Human-friendly directory
    ├── STACK.md           ← Imported when working on stack
    ├── ARCHITECTURE.md    ← Imported when refactoring
    ├── PATTERNS.md        ← Imported when coding
    ├── STARTUP.md         ← Imported when setting up
    ├── GOTCHAS.md         ← Imported when troubleshooting
    └── DECISIONS.md       ← Imported for context on past choices
```

**Benefits:**
- ✅ Auto-discovery: CLAUDE.md loaded every session
- ✅ Context hygiene: Lean root prevents pollution
- ✅ Progressive disclosure: Detailed docs pulled only when needed
- ✅ Modular: Easy to update specific aspects
- ✅ Dual-use: Serves both humans and Claude

### Technical Details

Based on [The CLAUDE.md Protocol](https://engineering-blog.anthropic.com) and [official memory docs](https://docs.claude.com/en/docs/claude-code/memory):
- Hierarchical memory system: Enterprise → User → Project → Subdirectory
- @import syntax for modular composition
- Prevents context bloat in long sessions
- Living documentation that evolves with project

---

## [1.0.3] - 2025-10-26

### ✨ New Features - Intelligent Initialization Commands

**Added Two Slash Commands:**

1. **`/thoughtful-dev:init-project [project-name]`**
   - Analyzes your existing codebase intelligently
   - Discovers tech stack from package.json and project files
   - Extracts actual architecture patterns from code structure
   - Documents real code conventions (not generic best practices)
   - Finds startup commands from package.json scripts
   - Identifies gotchas from TODO/FIXME comments
   - Creates `.claude/` directory with 7 intelligent documentation files:
     * INDEX.md - Documentation directory
     * STACK.md - Actual tech stack with versions
     * ARCHITECTURE.md - Real system design
     * PATTERNS.md - Observed code patterns
     * DECISIONS.md - Decision log template
     * STARTUP.md - Project commands
     * GOTCHAS.md - Known issues

2. **`/thoughtful-dev:init-personal`**
   - Sets up `~/.claude/CLAUDE.md` with thoughtful development methodology
   - Checks for existing configuration before overwriting
   - Helps customize tech stack section
   - Provides merge options if CLAUDE.md exists

**How It Works (Like `/init`):**
- Both commands analyze before creating documentation
- Document WHAT EXISTS, not what SHOULD exist
- Project-specific, not generic templates
- Ask permission before overwriting
- Living documentation that grows with projects

### Technical Details

Commands are in the `commands/` directory and follow Claude Code slash command conventions:
- Frontmatter with description and argument hints
- Use `$ARGUMENTS` for parameters
- Leverage Explore agent for codebase analysis
- Use `${CLAUDE_PLUGIN_ROOT}` for plugin files

---

## [1.0.2] - 2025-10-26

### 🐛 Critical Fix - Correct Plugin Structure

**Plugin Configuration:**
- **MOVED:** `plugin.json` from root to `.claude-plugin/` directory (correct location per docs)
- **SIMPLIFIED:** `plugin.json` to only required fields (name, description, version, author)
- **REMOVED:** Incorrect "skills" array - skills are auto-discovered from `skills/` directory
- **VERIFIED:** Structure matches official Claude Code plugin documentation

**What This Fixes:**
- Plugin now follows the exact structure specified in Claude Code documentation
- Skills are auto-discovered from the `skills/` directory as intended
- No custom fields needed in plugin.json for skill registration

### Technical Details

Per the official docs: "Plugin Skills are automatically available when the plugin is installed." Skills should be in a `skills/` directory and do NOT need to be registered in plugin.json. The plugin.json should only contain basic metadata (name, description, version, author) and must be located in `.claude-plugin/` directory, not at the root.

---

## [1.0.1] - 2025-10-26

### 🐛 Critical Bug Fixes

**Plugin Structure:**
- **ADDED:** `plugin.json` file at root with explicit `skills` array registration
- **CHANGED:** marketplace.json `strict` field from `false` to `true`
- **REMOVED:** Incorrect `commands` array from marketplace.json

**What This Fixes:**
- All three skills (requirements-clarifier, implementation-planner, breakthrough-generator) now load correctly
- Skills are properly registered and discoverable by Claude Code
- Plugin follows correct Claude Code marketplace structure

### Technical Details

The plugin was missing a critical `plugin.json` file that explicitly registers skills. While `strict: false` allows marketplace-only configuration, skills specifically require the `skills` array in plugin.json with name, path, and description for each skill. The "commands" field in marketplace.json is only for slash commands, not for skills.

---

## [1.0.0] - 2025-10-26

### 🎉 Initial Release

The first production-ready release of Thoughtful Dev plugin for Claude Code.

### Added

#### Core Skills (109KB total)
- **Requirements Clarifier** (18KB)
  - Automatic activation on ambiguous requirements
  - Structured 5-step clarification protocol
  - Stack-specific questions (Next.js, Strapi, Medusa)
  - Assumption surfacing and validation
  - Explicit agreement requirement before coding

- **Implementation Planner** (23KB)
  - Current state analysis
  - Multiple approach proposals with honest trade-offs
  - Risk identification and mitigation strategies
  - Step-by-step implementation breakdown
  - Stack-specific planning considerations

- **Breakthrough Generator** (68KB total)
  - 9 lateral thinking techniques
  - 8 assumption excavation methods
  - 5 problem reframing patterns + 8 lenses
  - 7 cross-domain inspiration libraries
  - Progressive disclosure (loads only needed sections)

#### Templates
- **Personal CLAUDE.md** (7KB)
  - Critical safety rules (git workflow, database operations)
  - Autonomy & judgment guidelines
  - Before-coding protocols
  - Black-box architecture principles
  - Documentation protocol
  - Session hygiene best practices
  - Anti-patterns list

- **Project Documentation** (7 files)
  - INDEX.md - Table of contents for progressive discovery
  - STACK.md - Tech stack with versions and rationale
  - ARCHITECTURE.md - System design and data flow
  - PATTERNS.md - Code conventions with examples
  - DECISIONS.md - Architectural Decision Records (append-only)
  - STARTUP.md - Build/run/test commands, troubleshooting
  - GOTCHAS.md - Known issues and workarounds

#### Safety Features
- Git workflow protection (always branches, never main)
- Database operation safety (ask before DROP/DELETE/TRUNCATE)
- Secrets protection (never commit .env, check for hardcoded secrets)

#### Architecture Principles
- Black-box architecture (Eskil Steenberg's principles)
  - Constant velocity
  - Complete ownership
  - Everything replaceable
  - Clean interfaces
  - Single responsibility

#### Tech Stack Support
- Next.js 14+ (App Router, Server/Client Components, Server Actions)
- Strapi (API patterns, population, authentication)
- Medusa (Store/Admin APIs, cart handling)
- Tailwind CSS (utility-first styling)
- shadcn/ui (component library conventions)
- TypeScript (strict mode, type safety)

#### Documentation
- Comprehensive README with examples and use cases
- Detailed INSTALL.md with troubleshooting
- CONTRIBUTING.md with guidelines for contributors
- MIT License
- Complete marketplace.json for Claude Code marketplace

### Features
- Stack-specific patterns and best practices
- Systematic problem-solving when stuck
- Risk analysis and trade-off evaluation
- Architectural Decision Records support
- Team auto-install configuration via settings.json
- Progressive documentation system (maintain, don't rewrite)

---

## [Unreleased]

### Planned Features
- Additional tech stack templates (Vue, Angular, Django, Rails)
- More problem-solving techniques and patterns
- Community-contributed skills
- VS Code integration examples
- GitHub Actions workflow templates
- Docker and deployment configurations
- API documentation templates
- Performance optimization patterns
- Security best practices checklist
- Testing strategy templates

### Under Consideration
- Integration with project management tools
- AI pair programming workflows
- Code review automation
- Documentation generation tools
- Custom skill creation guide
- Team collaboration patterns

---

## Version History Overview

| Version | Date | Description |
|---------|------|-------------|
| 1.0.0 | 2024-10-26 | Initial marketplace release |

---

## Breaking Changes

None yet - this is the initial release.

---

## Migration Guide

Not applicable for initial release.

---

## Contributors

Thank you to everyone who has contributed to this project!

- [@Neno73](https://github.com/Neno73) - Creator and maintainer

---

## Feedback & Issues

Found a bug or have a feature request? 
- [Open an issue](https://github.com/Neno73/thoughtful-dev/issues)
- [Start a discussion](https://github.com/Neno73/thoughtful-dev/discussions)

---

## Links

- [GitHub Repository](https://github.com/Neno73/thoughtful-dev)
- [Installation Guide](./INSTALL.md)
- [Contributing Guidelines](./CONTRIBUTING.md)
- [License](./LICENSE)
