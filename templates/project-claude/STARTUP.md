# Startup & Development Commands

*Last updated: YYYY-MM-DD HH:MM*

## Prerequisites

- Node.js >= 18.x
- npm/pnpm >= 8.x
- [Add other requirements]

## Initial Setup

```bash
# Clone repository
git clone [repo-url]
cd [project-name]

# Install dependencies
npm install
# OR
pnpm install

# Copy environment file
cp .env.example .env.local

# Set required environment variables (see below)
```

---

## Environment Variables

Required variables in `.env.local`:

```bash
# Next.js
NEXT_PUBLIC_SITE_URL=http://localhost:3000

# Strapi
STRAPI_URL=http://localhost:1337
STRAPI_TOKEN=your-strapi-token-here

# Medusa
MEDUSA_URL=http://localhost:9000
MEDUSA_PUBLISHABLE_KEY=your-medusa-key-here

# [Add other variables]
```

**How to get values:**
- Strapi token: [Instructions]
- Medusa key: [Instructions]

---

## Development Commands

### Start Development Server

```bash
npm run dev
# App available at http://localhost:3000
```

### Run Tests

```bash
# All tests
npm test

# Watch mode
npm test -- --watch

# Coverage
npm run test:coverage
```

### Linting & Formatting

```bash
# Lint
npm run lint

# Fix lint issues
npm run lint:fix

# Format
npm run format
```

### Build for Production

```bash
npm run build

# Test production build locally
npm run start
```

### Type Checking

```bash
npm run typecheck
```

---

## Common Issues & Troubleshooting

### Issue: Port 3000 already in use

**Solution:**
```bash
# Find process using port 3000
lsof -i :3000

# Kill the process
kill -9 [PID]

# Or use different port
PORT=3001 npm run dev
```

### Issue: Strapi connection refused

**Symptoms:** `ECONNREFUSED` errors in console

**Solutions:**
1. Ensure Strapi is running (check `STRAPI_URL`)
2. Verify token is valid
3. Check firewall/network settings

### Issue: Environment variables not loading

**Solutions:**
1. Ensure file is named `.env.local` (not `.env`)
2. Restart dev server after changing env vars
3. Client-side vars must start with `NEXT_PUBLIC_`

### Issue: Module not found errors

**Solution:**
```bash
# Clear node_modules and reinstall
rm -rf node_modules
npm install

# Clear Next.js cache
rm -rf .next
npm run dev
```

### Issue: Type errors after package update

**Solution:**
```bash
# Regenerate types
npm run typecheck

# If using Strapi types
npm run strapi:types
```

---

## Database Setup (if applicable)

```bash
# Run migrations
npm run db:migrate

# Seed database
npm run db:seed

# Reset database (WARNING: destructive)
npm run db:reset
```

---

## Useful Scripts

```bash
# Generate new component
npm run generate:component [name]

# Generate Strapi types
npm run strapi:types

# Analyze bundle size
npm run analyze

# [Add custom scripts]
```

---

## VS Code Setup (Optional)

Recommended extensions:
- ES Lint
- Prettier
- Tailwind CSS IntelliSense
- TypeScript + JavaScript

Workspace settings (`.vscode/settings.json`):
```json
{
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```

---

*Update this doc when commands change or new issues are discovered*
