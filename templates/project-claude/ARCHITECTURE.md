# System Architecture

*Last updated: YYYY-MM-DD HH:MM*

## High-Level Overview

[Brief 2-3 sentence description of the system]

```
┌─────────────┐
│   Next.js   │  Frontend (App Router)
│   Frontend  │
└──────┬──────┘
       │
       ├─────────► Strapi (Content/CMS)
       │
       └─────────► Medusa (E-commerce)
```

---

## Data Flow

### Content Flow (Strapi)
1. Content editors create/update content in Strapi admin
2. Next.js fetches via Strapi REST API
3. Server Components render content (ISR/SSR/SSG)

### E-commerce Flow (Medusa)
1. Customer browses products (SSG pages)
2. Add to cart → Medusa Store API
3. Checkout → Medusa payment integration
4. Order → Medusa admin API

---

## Directory Structure

```
project/
├── app/                    # Next.js App Router
│   ├── (marketing)/       # Marketing pages
│   ├── (shop)/            # E-commerce pages
│   ├── api/               # API routes
│   └── layout.tsx         # Root layout
│
├── components/
│   ├── ui/                # shadcn components
│   └── [feature]/         # Feature-specific components
│
├── lib/
│   ├── strapi.ts          # Strapi client
│   ├── medusa.ts          # Medusa client
│   └── utils.ts           # Shared utilities
│
└── types/                 # TypeScript types
```

---

## Key Design Decisions

### Server vs. Client Components

**Server Components (default):**
- Data fetching from Strapi/Medusa
- Static content rendering
- No interactivity needed

**Client Components ('use client'):**
- Forms and user input
- Interactive UI (modals, dropdowns)
- State management

### Data Fetching Strategy

**Static Generation (SSG):**
- Product listings
- Content pages (blog, about, etc.)

**Incremental Static Regeneration (ISR):**
- Product details (revalidate every 60s)
- Content with occasional updates

**Server-Side Rendering (SSR):**
- User-specific pages
- Real-time data requirements

---

## Integration Points

### Strapi Integration
- **Endpoint:** `process.env.STRAPI_URL`
- **Auth:** Bearer token for preview/draft content
- **Caching:** ISR with 60s revalidation

### Medusa Integration
- **Store API:** Customer-facing operations
- **Admin API:** Order management, inventory
- **Cart:** Stored in Medusa, cart ID in cookies

---

## Component Architecture

### Composition Pattern

```tsx
// Container components (Server)
async function ProductList() {
  const products = await getProducts()
  return <ProductGrid products={products} />
}

// Presentational components (can be Server or Client)
function ProductGrid({ products }) {
  return (
    <div className="grid grid-cols-3 gap-4">
      {products.map(p => <ProductCard key={p.id} product={p} />)}
    </div>
  )
}

// Interactive components (Client)
'use client'
function AddToCartButton({ productId }) {
  // Handles interactivity
}
```

---

## Performance Considerations

- Images: Use Next.js `<Image>` component
- Fonts: Next.js font optimization
- Bundle size: Monitor with `@next/bundle-analyzer`
- API calls: Minimize waterfalls, fetch in parallel

---

## Security

- Environment variables for sensitive config
- CSRF protection via Server Actions
- Input validation with Zod
- SQL injection protection (ORMs handle this)
