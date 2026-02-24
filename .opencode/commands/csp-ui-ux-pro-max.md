---
description: AI-powered design intelligence - 50+ styles, 95+ color palettes, automated design system generation
agent: cook
---

# /csp-ui-ux-pro-max - UI/UX Design Intelligence

$ARGUMENTS

Comprehensive design guide for web and mobile applications. Contains 50+ styles, 97 color palettes, 57 font pairings, 99 UX guidelines, and 25 chart types across 9 technology stacks.

---

## How to Use This Workflow

When user requests UI/UX work (design, build, create, implement, review, fix, improve), follow this workflow:

### Step 1: Analyze User Requirements

Extract key information from user request:
- **Product type**: SaaS, e-commerce, portfolio, dashboard, landing page, etc.
- **Style keywords**: minimal, playful, professional, elegant, dark mode, etc.
- **Industry**: healthcare, fintech, gaming, education, etc.
- **Stack**: React, Vue, Next.js, or default to `html-tailwind`

### Step 2: Generate Design System

Always start với design system analysis:

1. **Search for design patterns** phù hợp với product type và industry
2. **Select style** dựa trên keywords và emotion mong muốn
3. **Choose color palette** phù hợp với industry và target audience
4. **Select typography** pairings cho headers và body
5. **Define effects** - shadows, gradients, animations

### Step 3: Implementation

Apply design system với stack-specific best practices.

---

## Design System Reference

### Style Guide

| Style | Characteristics | Best For |
|-------|-----------------|----------|
| **Minimalist** | Clean, whitespace, subtle | Professional, luxury |
| **Glassmorphism** | Blur, transparency, depth | Modern, tech |
| **Brutalist** | Raw, bold, unconventional | Creative, standout |
| **Neo-retro** | Vintage + modern mix | Unique, memorable |
| **Corporate** | Professional, structured | Enterprise, B2B |

### Color Palettes by Industry

| Industry | Primary | Accent | Emotion |
|----------|---------|--------|---------|
| **Fintech** | Deep blue, Navy | Gold, Green | Trust, stability |
| **Healthcare** | Teal, Soft blue | White, Green | Calm, professional |
| **E-commerce** | Brand-specific | Orange, Red | Action, urgency |
| **Beauty/Spa** | Rose, Cream | Gold | Luxury, relaxation |
| **Tech/SaaS** | Electric blue | Purple, Cyan | Innovation |
| **Food** | Warm orange, Red | Yellow | Appetite, energy |

### Typography Pairings

| Style | Heading | Body | Use Case |
|-------|---------|------|----------|
| **Modern Clean** | Inter | Inter | SaaS, dashboards |
| **Elegant** | Playfair Display | Lato | Luxury, beauty |
| **Friendly** | Poppins | Open Sans | Consumer apps |
| **Professional** | Montserrat | Source Sans Pro | Corporate |
| **Bold Statement** | Bebas Neue | Roboto | Marketing, landing |

---

## Common Rules for Professional UI

### Icons & Visual Elements

| Rule | Do | Don't |
|------|----|----- |
| **No emoji icons** | Use SVG icons (Heroicons, Lucide, Simple Icons) | Use emojis as UI icons |
| **Stable hover states** | Use color/opacity transitions on hover | Use scale transforms that shift layout |
| **Correct brand logos** | Research official SVG from Simple Icons | Guess or use incorrect logo paths |
| **Consistent icon sizing** | Use fixed viewBox (24x24) with w-6 h-6 | Mix different icon sizes randomly |

### Interaction & Cursor

| Rule | Do | Don't |
|------|----|----- |
| **Cursor pointer** | Add `cursor-pointer` to all clickable/hoverable cards | Leave default cursor on interactive elements |
| **Hover feedback** | Provide visual feedback (color, shadow, border) | No indication element is interactive |
| **Smooth transitions** | Use `transition-colors duration-200` | Instant state changes or too slow (>500ms) |

### Light/Dark Mode Contrast

| Rule | Do | Don't |
|------|----|----- |
| **Glass card light mode** | Use `bg-white/80` or higher opacity | Use `bg-white/10` (too transparent) |
| **Text contrast light** | Use `#0F172A` (slate-900) for text | Use `#94A3B8` (slate-400) for body text |
| **Muted text light** | Use `#475569` (slate-600) minimum | Use gray-400 or lighter |
| **Border visibility** | Use `border-gray-200` in light mode | Use `border-white/10` (invisible) |

---

## Pre-Delivery Checklist

Before delivering UI code, verify these items:

### Visual Quality
- [ ] No emojis used as icons (use SVG instead)
- [ ] All icons from consistent icon set (Heroicons/Lucide)
- [ ] Brand logos are correct (verified from Simple Icons)
- [ ] Hover states don't cause layout shift
- [ ] Use theme colors directly (bg-primary) not var() wrapper

### Interaction
- [ ] All clickable elements have `cursor-pointer`
- [ ] Hover states provide clear visual feedback
- [ ] Transitions are smooth (150-300ms)
- [ ] Focus states visible for keyboard navigation

### Light/Dark Mode
- [ ] Light mode text has sufficient contrast (4.5:1 minimum)
- [ ] Glass/transparent elements visible in light mode
- [ ] Borders visible in both modes
- [ ] Test both modes before delivery

### Layout
- [ ] Floating elements have proper spacing from edges
- [ ] No content hidden behind fixed navbars
- [ ] Responsive at 375px, 768px, 1024px, 1440px
- [ ] No horizontal scroll on mobile

### Accessibility
- [ ] All images have alt text
- [ ] Form inputs have labels
- [ ] Color is not the only indicator
- [ ] `prefers-reduced-motion` respected
