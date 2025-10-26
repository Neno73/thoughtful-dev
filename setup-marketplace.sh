#!/bin/bash

# Thoughtful Dev Marketplace Setup Script
# This script helps you organize your files and push to GitHub

set -e  # Exit on error

echo "🚀 Thoughtful Dev Marketplace Setup"
echo "======================================"
echo ""

# Check if we're in the right directory
if [ ! -f "marketplace.json" ]; then
    echo "❌ Error: marketplace.json not found!"
    echo "Please run this script from the repository root where you've placed the marketplace files."
    exit 1
fi

echo "✅ Found marketplace.json"
echo ""

# Create required directory structure
echo "📁 Creating directory structure..."

# Create .claude-plugin directory
mkdir -p .claude-plugin

# Move marketplace.json to correct location
if [ -f "marketplace.json" ]; then
    mv marketplace.json .claude-plugin/marketplace.json
    echo "  ✅ Moved marketplace.json to .claude-plugin/"
fi

# Create skills directory structure
mkdir -p skills/requirements-clarifier
mkdir -p skills/implementation-planner
mkdir -p skills/breakthrough-generator/references

# Create templates directory structure
mkdir -p templates/project-claude

echo "  ✅ Created all directories"
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing git repository..."
    git init
    git branch -M main
    echo "  ✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

echo ""

# Add remote if not exists
REMOTE_URL="https://github.com/Neno73/thoughtful-dev.git"
if ! git remote | grep -q "origin"; then
    echo "🔗 Adding remote origin..."
    git remote add origin $REMOTE_URL
    echo "  ✅ Remote added: $REMOTE_URL"
else
    echo "✅ Remote origin already exists"
fi

echo ""

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    echo "📝 Creating .gitignore..."
    cat > .gitignore << 'EOF'
# OS Files
.DS_Store
Thumbs.db

# Editor directories
.vscode/
.idea/
*.swp
*.swo

# Temporary files
*.tmp
*.bak
*~

# Logs
*.log
logs/

# Dependencies (if any)
node_modules/
EOF
    echo "  ✅ Created .gitignore"
fi

echo ""

# Show current file structure
echo "📂 Current file structure:"
echo ""
find . -type f -not -path "./.git/*" | sort

echo ""
echo "=========================================="
echo "✅ Setup Complete!"
echo "=========================================="
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. Copy your plugin files to the appropriate directories:"
echo "   - Skills: ./skills/"
echo "   - Templates: ./templates/"
echo ""
echo "2. Add and commit your files:"
echo "   git add ."
echo "   git commit -m \"Initial marketplace setup with Thoughtful Dev plugin v1.0.0\""
echo ""
echo "3. Push to GitHub:"
echo "   git push -u origin main"
echo ""
echo "4. Create a release tag:"
echo "   git tag v1.0.0"
echo "   git push origin v1.0.0"
echo ""
echo "5. Users can then install with:"
echo "   /plugin marketplace add Neno73/thoughtful-dev"
echo "   /plugin install thoughtful-dev"
echo ""
echo "=========================================="
echo "🎉 Your marketplace is ready to use!"
echo "=========================================="
