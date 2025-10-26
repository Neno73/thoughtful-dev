# Contributing to Thoughtful Dev

Thank you for considering contributing to the Thoughtful Dev plugin! We welcome contributions from the community.

---

## 🎯 Ways to Contribute

### 1. Report Bugs 🐛
Found a bug? [Open an issue](https://github.com/Neno73/thoughtful-dev/issues) with:
- Clear description of the problem
- Steps to reproduce
- Expected vs. actual behavior
- Claude Code version
- Screenshots (if applicable)

### 2. Suggest Features 💡
Have an idea? [Create a feature request](https://github.com/Neno73/thoughtful-dev/issues) with:
- Use case explanation
- Why it would be valuable
- Proposed implementation (if you have ideas)

### 3. Submit Pull Requests 🔧
Fix bugs or add features by:
- Following the development setup below
- Writing clear commit messages
- Testing your changes thoroughly
- Documenting new features

### 4. Share Feedback 💬
[Start a discussion](https://github.com/Neno73/thoughtful-dev/discussions) to:
- Share how you're using the plugin
- Discuss best practices
- Help other users
- Suggest improvements

### 5. Improve Documentation 📚
Help others by:
- Fixing typos or unclear instructions
- Adding examples
- Writing guides
- Translating documentation

---

## 🛠️ Development Setup

### Prerequisites
- Claude Code installed
- Git installed
- Text editor (VS Code, Vim, etc.)
- Basic understanding of Markdown

### Clone and Install

```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/thoughtful-dev.git
cd thoughtful-dev

# Add as local marketplace in Claude Code
/plugin marketplace add ./thoughtful-dev

# Install for testing
/plugin install thoughtful-dev@thoughtful-dev
```

### Test Your Changes

```bash
# After making changes, reload the plugin
/plugin reload thoughtful-dev

# Or reinstall
/plugin uninstall thoughtful-dev
/plugin install thoughtful-dev@thoughtful-dev
```

---

## 🔀 Pull Request Process

### 1. Create a Feature Branch

```bash
git checkout -b feature/my-awesome-feature
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code improvements

### 2. Make Your Changes

**For Skills:**
- Edit SKILL.md files in `skills/` directory
- Use clear markdown formatting
- Include practical examples
- Test with real scenarios

**For Templates:**
- Edit files in `templates/` directory
- Keep templates concise and scannable
- Add timestamps for updates
- Include inline examples

**For Documentation:**
- Update README.md, INSTALL.md, or create new guides
- Use clear headings and examples
- Keep language practical and approachable

### 3. Test Thoroughly

Test scenarios:
- ✅ Skill activation triggers correctly
- ✅ Questions/analysis are relevant
- ✅ Safety features work as expected
- ✅ Templates load properly
- ✅ No syntax errors in markdown
- ✅ Links are not broken

### 4. Commit Your Changes

Write clear commit messages:

```bash
# Good examples
git commit -m "feat: Add TypeScript-specific questions to requirements-clarifier"
git commit -m "fix: Correct git branch protection logic in safety rules"
git commit -m "docs: Add troubleshooting section for plugin installation"

# Use conventional commits
# feat: New feature
# fix: Bug fix
# docs: Documentation
# refactor: Code improvement
# test: Testing updates
# chore: Maintenance
```

### 5. Push and Create PR

```bash
# Push your branch
git push origin feature/my-awesome-feature
```

Then:
1. Go to https://github.com/Neno73/thoughtful-dev
2. Click "Compare & pull request"
3. Fill in the PR template (see below)
4. Submit for review

---

## 📝 Pull Request Template

When creating a PR, please include:

```markdown
## Description
[Brief description of what this PR does]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring
- [ ] Other (please describe)

## Changes Made
- [List key changes]
- [One bullet per significant change]

## Testing Done
- [ ] Tested locally with Claude Code
- [ ] Verified skill activation
- [ ] Checked documentation links
- [ ] Tested with demo scenarios

## Screenshots (if applicable)
[Add screenshots showing the change in action]

## Related Issues
Fixes #[issue number]
Related to #[issue number]

## Checklist
- [ ] Code follows project style guidelines
- [ ] Documentation updated (if needed)
- [ ] Changelog updated (if significant change)
- [ ] All tests passing
- [ ] No breaking changes (or clearly documented)
```

---

## 📋 Code Style Guidelines

### Markdown (Skills & Templates)

**Skills (SKILL.md files):**
```markdown
# Skill Name

## Purpose
[Clear one-line purpose]

## When to Activate
[Specific triggers]

## Process
[Step-by-step approach]

## Example
[Practical example with user input and Claude response]
```

**Templates:**
- Use `##` for main sections
- Keep lines under 100 characters
- Use bullet points for lists
- Include timestamps: `[Updated: 2024-10-26]`
- Add inline examples

### Documentation
- Use clear, practical language
- Include code examples with syntax highlighting
- Add emoji sparingly for visual breaks (✅ ❌ 💡 🎯)
- Test all command examples
- Keep sentences short and scannable

---

## 🧪 Testing Guidelines

### Manual Testing Checklist

**Requirements Clarifier:**
- [ ] Activates on ambiguous request
- [ ] Asks relevant clarifying questions
- [ ] Stack-specific questions appear
- [ ] Gets explicit agreement before coding

**Implementation Planner:**
- [ ] Analyzes current state correctly
- [ ] Proposes multiple options
- [ ] Identifies risks accurately
- [ ] Creates actionable step-by-step plan

**Breakthrough Generator:**
- [ ] Activates on "stuck" indicators
- [ ] Applies appropriate techniques
- [ ] Challenges assumptions systematically
- [ ] Provides actionable insights

**Safety Features:**
- [ ] Git main protection triggers
- [ ] Database operation confirmation works
- [ ] Secrets detection functions
- [ ] No false positives

### Edge Cases to Test
- Very long user inputs
- Ambiguous tech stack mentions
- Conflicting requirements
- Invalid commands
- Missing dependencies

---

## 🏗️ Project Structure

Understanding the structure helps you contribute effectively:

```
thoughtful-dev/
├── .claude-plugin/
│   └── marketplace.json        # ⚠️ Core marketplace config
│
├── skills/                     # Plugin skills
│   ├── requirements-clarifier/
│   ├── implementation-planner/
│   └── breakthrough-generator/
│
├── templates/                  # User templates
│   ├── personal-CLAUDE.md
│   └── project-claude/
│
└── docs/                       # Documentation
    ├── README.md
    ├── INSTALL.md
    └── CONTRIBUTING.md (this file)
```

---

## 🎨 Design Principles

When contributing, keep these principles in mind:

### 1. Safety First
- Git workflow protection is non-negotiable
- Database operations must require confirmation
- Never commit secrets or sensitive data

### 2. Thoughtful Over Fast
- Clarify before coding
- Plan before implementing
- Think before answering

### 3. Black-Box Architecture
- Constant velocity (write new, don't edit old)
- Complete ownership (one module, one person)
- Everything replaceable (rewrite > understand complex code)
- Clean interfaces (hide implementation)
- Single responsibility (one purpose per module)

### 4. Progressive Documentation
- Index-based discovery
- Timestamp accountability
- Examples over essays
- Maintain, don't rewrite

---

## 🤝 Community Guidelines

### Be Respectful
- Assume good intentions
- Be patient with new contributors
- Give constructive feedback
- Celebrate contributions

### Be Clear
- Use clear language
- Provide context
- Link to relevant resources
- Show examples

### Be Helpful
- Answer questions
- Review PRs promptly
- Share knowledge
- Welcome newcomers

---

## 🚀 Release Process

For maintainers:

1. **Version Bump**
   ```bash
   # Update version in:
   # - marketplace.json
   # - CHANGELOG.md
   # - README.md badges
   ```

2. **Update Changelog**
   ```markdown
   ## [1.1.0] - 2024-XX-XX
   ### Added
   - New feature
   ### Fixed
   - Bug fix
   ```

3. **Create Release**
   ```bash
   git tag v1.1.0
   git push origin v1.1.0
   ```

4. **Announce**
   - Create GitHub release with notes
   - Post in discussions
   - Update documentation

---

## ❓ Questions?

- **General Questions:** [GitHub Discussions](https://github.com/Neno73/thoughtful-dev/discussions)
- **Bug Reports:** [GitHub Issues](https://github.com/Neno73/thoughtful-dev/issues)
- **Private Concerns:** [[email protected]]

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for making Thoughtful Dev better!** 🙏

Every contribution, no matter how small, helps developers write better code with Claude. We appreciate your effort! 🚀
