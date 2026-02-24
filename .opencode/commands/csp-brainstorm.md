---
description: Structured brainstorming - Explores multiple options before implementation
agent: kehoach
subtask: true
---

# /csp-brainstorm - Structured Idea Exploration

$ARGUMENTS

---

## Purpose

Command này activates BRAINSTORM mode cho structured idea exploration. Dùng khi bạn cần explore options trước khi commit vào implementation.

---

## Behavior

Khi `/csp-brainstorm` được kích hoạt:

1. **Understand the goal**
   - Problem chúng ta đang giải quyết là gì?
   - User là ai?
   - Constraints hiện có là gì?

2. **Generate options**
   - Provide ít nhất 3 approaches khác nhau
   - Mỗi cái với pros và cons
   - Consider unconventional solutions

3. **Compare and recommend**
   - Summarize tradeoffs
   - Give a recommendation với reasoning

---

## Output Format

```markdown
## 🧠 Brainstorm: [Topic]

### Context
[Brief problem statement]

---

### Option A: [Name]
[Description]

✅ **Pros:**
- [benefit 1]
- [benefit 2]

❌ **Cons:**
- [drawback 1]

📊 **Effort:** Low | Medium | High

---

### Option B: [Name]
[Description]

✅ **Pros:**
- [benefit 1]

❌ **Cons:**
- [drawback 1]
- [drawback 2]

📊 **Effort:** Low | Medium | High

---

### Option C: [Name]
[Description]

✅ **Pros:**
- [benefit 1]

❌ **Cons:**
- [drawback 1]

📊 **Effort:** Low | Medium | High

---

## 💡 Recommendation

**Option [X]** because [reasoning].

What direction would you like to explore?
```

---

## Examples

```
/csp-brainstorm authentication system
/csp-brainstorm state management for complex form
/csp-brainstorm database schema for social app
/csp-brainstorm caching strategy
```

---

## Key Principles

- **No code** - this is about ideas, not implementation
- **Visual when helpful** - use diagrams for architecture
- **Honest tradeoffs** - don't hide complexity
- **Defer to user** - present options, let them decide
