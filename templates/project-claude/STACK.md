# Tech Stack

*Project: [PROJECT NAME]*
*Last updated: YYYY-MM-DD HH:MM*

## Frontend

- **Next.js 14+** (App Router) - React framework with SSR/SSG
- **TypeScript** - Type safety and better DX
- **Tailwind CSS** - Utility-first styling
- **shadcn/ui** - Accessible component library

## Backend

- **Strapi** - Headless CMS for content management
- **Medusa** - E-commerce engine for store functionality

## Key Libraries

- **react-hook-form** - Form handling
- **zod** - Schema validation
- **@tanstack/react-query** - Data fetching (if using)
- [Add other important dependencies]

## Database

- **PostgreSQL** (via Strapi/Medusa) - Primary database

## Deployment

- **Vercel** - Frontend hosting
- [Add backend hosting details]

---

## Why This Stack

### Next.js 14+
- App Router for better performance and DX
- Server Components reduce client bundle size
- Built-in optimization (images, fonts, etc.)

### Strapi
- Flexible content modeling
- REST + GraphQL APIs
- Admin panel out of the box

### Medusa
- Modular e-commerce engine
- Customizable without rebuilding from scratch
- Good developer experience

### shadcn/ui
- Accessible by default
- Tailwind-based (consistent with our styling)
- Copy-paste components (no package dependency)

---

## Version Requirements

- **Node.js:** >= 18.x
- **npm/pnpm:** >= 8.x
- **Next.js:** >= 14.0.0
- **Strapi:** [version]
- **Medusa:** [version]

## Version Notes

- Next.js 14+ required for stable Server Actions
- Strapi version [X] fixes [specific issue if relevant]
- Medusa version [X] adds [specific feature if relevant]
