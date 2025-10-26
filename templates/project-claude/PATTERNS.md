# Code Patterns & Conventions

*Last updated: YYYY-MM-DD HH:MM*

## Server vs. Client Components

### When to Use Server Components
- Fetching data from Strapi/Medusa
- No interactivity needed
- SEO-critical content
- Access to backend resources

### When to Use Client Components
- Forms with validation
- Interactive UI (modals, dropdowns, tabs)
- State management (useState, useReducer)
- Browser APIs (localStorage, window)
- Event handlers (onClick, onChange)

**Example:**
```tsx
// ✅ Server Component - fetch data
async function ProductList() {
  const products = await strapi.getProducts()
  return <div>{products.map(p => <ProductCard key={p.id} product={p} />)}</div>
}

// ✅ Client Component - interactivity
'use client'
function AddToCartButton({ productId }: { productId: string }) {
  const [loading, setLoading] = useState(false)
  
  const handleClick = async () => {
    setLoading(true)
    await addToCart(productId)
    setLoading(false)
  }
  
  return <Button onClick={handleClick} disabled={loading}>Add to Cart</Button>
}
```

---

## Strapi Data Fetching

### Standard Pattern

```tsx
// lib/strapi.ts
const STRAPI_URL = process.env.STRAPI_URL!
const STRAPI_TOKEN = process.env.STRAPI_TOKEN

export async function getProducts() {
  const res = await fetch(
    `${STRAPI_URL}/api/products?populate=*`,
    {
      headers: { Authorization: `Bearer ${STRAPI_TOKEN}` },
      next: { revalidate: 60 } // ISR: revalidate every 60s
    }
  )
  
  if (!res.ok) throw new Error('Failed to fetch products')
  
  const { data } = await res.json()
  return data
}
```

### Key Rules
- **ALWAYS** use `populate=*` to get relations (or specify exact fields)
- **ALWAYS** handle errors
- **USE** ISR for content that changes occasionally (`next: { revalidate: N }`)
- **USE** `cache: 'no-store'` for dynamic content

---

## Medusa Integration

### Cart Pattern

```tsx
// lib/medusa.ts
export async function addToCart(cartId: string, variantId: string, quantity: number) {
  const res = await fetch(
    `${MEDUSA_URL}/store/carts/${cartId}/line-items`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ variant_id: variantId, quantity })
    }
  )
  
  if (!res.ok) throw new Error('Failed to add to cart')
  
  return res.json()
}
```

### Key Rules
- **Store cart ID in cookies** (not localStorage for SSR compatibility)
- **Create cart on first add** if no cart exists
- **Use Medusa's built-in validation** (inventory, pricing)

---

## shadcn/ui Component Usage

### Always Use shadcn Components

**DO:**
```tsx
import { Button } from '@/components/ui/button'
import { Card, CardHeader, CardContent } from '@/components/ui/card'
import { Form, FormField } from '@/components/ui/form'

<Button variant="default">Click me</Button>
<Card>...</Card>
```

**DON'T:**
```tsx
// ❌ Don't use raw HTML elements
<button>Click me</button>

// ❌ Don't override shadcn styles directly
<Button className="bg-red-500">Click me</Button>

// ✅ Instead, use variants or create new variants
<Button variant="destructive">Delete</Button>
```

---

## Form Handling

### Standard Pattern: react-hook-form + Zod

```tsx
'use client'

import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import * as z from 'zod'
import { Form, FormField, FormItem, FormLabel, FormControl, FormMessage } from '@/components/ui/form'

const formSchema = z.object({
  email: z.string().email('Invalid email'),
  password: z.string().min(8, 'Password must be at least 8 characters')
})

function LoginForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: { email: '', password: '' }
  })
  
  const onSubmit = async (values: z.infer<typeof formSchema>) => {
    // Handle submission
  }
  
  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)}>
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        {/* More fields */}
      </form>
    </Form>
  )
}
```

---

## Error Handling

### API Calls

```tsx
try {
  const data = await fetchData()
  return data
} catch (error) {
  console.error('Failed to fetch data:', error)
  throw error // Re-throw for React error boundaries
}
```

### Next.js Error Boundaries

```tsx
// app/error.tsx
'use client'

export default function Error({
  error,
  reset,
}: {
  error: Error
  reset: () => void
}) {
  return (
    <div>
      <h2>Something went wrong!</h2>
      <button onClick={reset}>Try again</button>
    </div>
  )
}
```

---

## Styling Patterns

### Tailwind Class Organization

```tsx
// Order: layout → spacing → colors → typography → effects
<div className="
  flex items-center justify-between
  p-4 gap-2
  bg-white border border-gray-200
  text-lg font-semibold
  rounded-lg shadow-sm hover:shadow-md
">
  Content
</div>
```

### Use `cn()` Utility for Conditional Classes

```tsx
import { cn } from '@/lib/utils'

<Button className={cn(
  "base-classes",
  isActive && "active-classes",
  isDisabled && "disabled-classes"
)}>
  Button
</Button>
```

---

## TypeScript Patterns

### Type Imports

```tsx
import type { Product } from '@/types'

// OR for Strapi types
import type { Product } from '@/types/strapi'
```

### API Response Types

```tsx
// types/api.ts
export interface ApiResponse<T> {
  data: T
  meta?: {
    pagination?: {
      page: number
      pageSize: number
      pageCount: number
      total: number
    }
  }
}

// Usage
const response: ApiResponse<Product[]> = await fetchProducts()
```

---

## Anti-Patterns to Avoid

- ❌ Mixing Server and Client Component logic in same file
- ❌ Fetching data in Client Components (use Server Components)
- ❌ Using localStorage in Server Components
- ❌ Overriding shadcn component styles directly
- ❌ Not populating Strapi relations
- ❌ Storing sensitive data in client-side state
- ❌ Not handling loading/error states

---

*Add project-specific patterns as they emerge*
