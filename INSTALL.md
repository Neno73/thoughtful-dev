# Installation Guide - Thoughtful Dev

Complete guide to installing and configuring the Thoughtful Dev plugin for Claude Code.

---

## Prerequisites

- **Claude Code** installed and running
- **Git** installed (for cloning/updating)
- Basic familiarity with command line

---

## Installation Methods

### Method 1: Quick Install (Recommended)

The fastest way to get started:

```bash
# Add marketplace and install plugin in one step
/plugin marketplace add Neno73/thoughtful-dev
/plugin install thoughtful-dev
```

Done! The plugin is now active.

---

### Method 2: Manual Marketplace Setup

For more control over the installation process:

#### Step 1: Add the Marketplace

```bash
# Add the Thoughtful Dev marketplace
/plugin marketplace add Neno73/thoughtful-dev
```

#### Step 2: Verify Marketplace

```bash
# List all marketplaces to confirm it was added
/plugin marketplace list
```

You should see `thoughtful-dev-marketplace` in the list.

#### Step 3: Browse Available Plugins

```bash
# See what's available in the marketplace
/plugin
```

You'll see the `thoughtful-dev` plugin with its description.

#### Step 4: Install the Plugin

```bash
# Install from the marketplace
/plugin install thoughtful-dev@thoughtful-dev-marketplace
```

Or simply:

```bash
/plugin install thoughtful-dev
```

#### Step 5: Verify Installation

```bash
# List installed plugins
/plugin list
```

You should see `thoughtful-dev` as active.

---

### Method 3: Team/Project Auto-Install

For teams that want automatic plugin installation when cloning a project:

#### Create Project Configuration

In your project root, create `.claude/settings.json`:

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

#### How It Works

When a team member:
1. Clones the repository
2. Opens it in Claude Code
3. Trusts the workspace

Claude Code automatically:
- Adds the `thoughtful-dev-marketplace`
- Installs the `thoughtful-dev` plugin
- Activates all three skills

**Benefits:**
- ✅ Consistent setup across the team
- ✅ No manual installation steps
- ✅ Version controlled with your project
- ✅ New team members get it automatically

---

### Method 4: Local Development Install

For testing or contributing to the plugin:

#### Step 1: Clone the Repository

```bash
# Clone to your local machine
git clone https://github.com/Neno73/thoughtful-dev.git
cd thoughtful-dev
```

#### Step 2: Add Local Marketplace

```bash
# Add the local directory as a marketplace
/plugin marketplace add ./thoughtful-dev
```

Or specify the marketplace.json directly:

```bash
# Point to the marketplace file
/plugin marketplace add ./thoughtful-dev/.claude-plugin/marketplace.json
```

#### Step 3: Install from Local Marketplace

```bash
# Install the local version
/plugin install thoughtful-dev@thoughtful-dev
```

#### Step 4: Make Changes and Test

```bash
# Edit skills in ./thoughtful-dev/skills/
# Reload plugin to test changes
/plugin reload thoughtful-dev
```

---

## Post-Installation Setup

### 1. Set Up Personal Methodology File

Copy the personal CLAUDE.md template to your home directory:

```bash
# Create .claude directory if it doesn't exist
mkdir -p ~/.claude

# Copy the personal template
cp templates/personal-CLAUDE.md ~/.claude/CLAUDE.md
```

**Customize it:**
- Edit git workflow preferences
- Adjust autonomy levels
- Add your preferred tech stack specifics

### 2. Set Up Project Documentation (Optional)

For each project, create a `.claude/` directory:

```bash
# In your project root
mkdir -p .claude

# Copy project templates
cp -r templates/project-claude/* ./.claude/
```

**Customize each file:**
- `STACK.md` - Your actual tech stack
- `ARCHITECTURE.md` - Your system design
- `PATTERNS.md` - Your code conventions
- `DECISIONS.md` - Your ADRs
- `STARTUP.md` - Your commands
- `GOTCHAS.md` - Your known issues

---

## Verification & Testing

### Test Skill Activation

#### Test Requirements Clarifier

```
User: "Add authentication to the app"

Expected: Claude should activate the requirements-clarifier skill
and ask clarifying questions about:
- Authentication method (OAuth, email/password, etc.)
- Backend integration
- Scope (login/logout, password reset, etc.)
```

#### Test Implementation Planner

```
User: [After clarifying requirements] "Okay, build it"

Expected: Claude should activate the implementation-planner skill
and provide:
- Current state analysis
- Multiple approach options with trade-offs
- Risk assessment
- Step-by-step implementation plan
```

#### Test Breakthrough Generator

```
User: "I've tried everything, the API keeps timing out"

Expected: Claude should activate the breakthrough-generator skill
and apply:
- Assumption excavation techniques
- Problem reframing
- Systematic debugging approaches
```

### Test Safety Features

#### Test Git Protection

```
User: "git push origin main"

Expected: Claude should STOP and say:
"⛔ NEVER push directly to main. Creating feature branch instead..."
```

#### Test Database Safety

```
User: "Drop the users table"

Expected: Claude should ASK for confirmation:
"⚠️ DESTRUCTIVE OPERATION DETECTED... Are you sure?"
```

---

## Updating the Plugin

### Update from Marketplace

```bash
# Refresh marketplace metadata
/plugin marketplace update thoughtful-dev-marketplace

# Update the plugin
/plugin update thoughtful-dev
```

### Update Local Development Version

```bash
# Pull latest changes
cd thoughtful-dev
git pull origin main

# Reload the plugin
/plugin reload thoughtful-dev
```

---

## Uninstalling

### Remove Plugin Only

```bash
# Uninstall the plugin (keeps marketplace)
/plugin uninstall thoughtful-dev
```

### Remove Marketplace and Plugin

```bash
# Remove the marketplace (also uninstalls plugins from it)
/plugin marketplace remove thoughtful-dev-marketplace
```

### Remove Personal Files

```bash
# Remove personal methodology file
rm ~/.claude/CLAUDE.md

# Remove project templates from a project
rm -rf ./.claude/
```

---

## Troubleshooting

### Plugin Not Loading

**Symptoms:**
- Plugin appears in list but skills don't activate
- Commands not found

**Solutions:**
1. Reload the plugin:
   ```bash
   /plugin reload thoughtful-dev
   ```

2. Check plugin status:
   ```bash
   /plugin list
   ```

3. Restart Claude Code

4. Reinstall:
   ```bash
   /plugin uninstall thoughtful-dev
   /plugin install thoughtful-dev
   ```

---

### Marketplace Not Found

**Symptoms:**
- Can't add marketplace
- "Marketplace not found" error

**Solutions:**
1. Verify GitHub repository is accessible:
   ```bash
   # Open in browser
   https://github.com/Neno73/thoughtful-dev
   ```

2. Check internet connection

3. Try full GitHub URL:
   ```bash
   /plugin marketplace add https://github.com/Neno73/thoughtful-dev.git
   ```

4. Use local clone:
   ```bash
   git clone https://github.com/Neno73/thoughtful-dev.git
   /plugin marketplace add ./thoughtful-dev
   ```

---

### Skills Not Activating

**Symptoms:**
- Plugin installed but skills don't trigger
- No clarification questions or planning steps

**Solutions:**
1. Check skill files exist:
   ```bash
   # In plugin directory
   ls -la skills/
   ```

2. Verify SKILL.md files are valid Markdown

3. Check marketplace.json has correct paths:
   ```json
   "commands": [
     "./skills/requirements-clarifier/SKILL.md",
     "./skills/implementation-planner/SKILL.md",
     "./skills/breakthrough-generator/SKILL.md"
   ]
   ```

4. Reload plugin:
   ```bash
   /plugin reload thoughtful-dev
   ```

---

### Template Files Missing

**Symptoms:**
- Can't find templates after installation
- No personal-CLAUDE.md or project templates

**Solutions:**
1. Templates are in the repository, not auto-installed:
   ```bash
   # Clone the repo to access templates
   git clone https://github.com/Neno73/thoughtful-dev.git
   cd thoughtful-dev/templates
   ```

2. Manual copy:
   ```bash
   # Personal template
   cp templates/personal-CLAUDE.md ~/.claude/CLAUDE.md
   
   # Project templates
   cp -r templates/project-claude/* /your-project/.claude/
   ```

---

### Version Conflicts

**Symptoms:**
- Plugin updated but still shows old version
- Changes not reflected

**Solutions:**
1. Clear marketplace cache:
   ```bash
   /plugin marketplace update thoughtful-dev-marketplace
   ```

2. Force reinstall:
   ```bash
   /plugin uninstall thoughtful-dev
   /plugin install thoughtful-dev
   ```

3. Check installed version:
   ```bash
   /plugin list
   ```

---

## Getting Help

If you're still having issues:

1. **Check existing issues:** [GitHub Issues](https://github.com/Neno73/thoughtful-dev/issues)
2. **Create new issue:** Include:
   - Claude Code version
   - Error messages
   - Steps to reproduce
   - Plugin list output
3. **Ask in discussions:** [GitHub Discussions](https://github.com/Neno73/thoughtful-dev/discussions)

---

## Next Steps

After successful installation:

1. ✅ Test all three skills with demo scenarios
2. ✅ Customize personal CLAUDE.md for your workflow
3. ✅ Set up project templates for your current project
4. ✅ Read the [Best Practices Guide](./docs/best-practices.md)
5. ✅ Join the [Discussions](https://github.com/Neno73/thoughtful-dev/discussions)

**You're ready to transform Claude Code into your thoughtful development partner!** 🚀
