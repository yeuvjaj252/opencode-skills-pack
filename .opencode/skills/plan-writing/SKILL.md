---
name: plan-writing
description: Structured task planning with clear breakdowns, dependencies, and verification criteria
compatibility: opencode
---

# Plan Writing Skill

Use this skill to create practical, verifiable implementation plans.

## Recommended Plan Structure

```markdown
## Goal
[One clear sentence about the outcome]

## Scope
- In scope: [...]
- Out of scope: [...]

## Implementation Steps
### Step 1: [Name]
- Description: [Specific action]
- Files: [Files affected]
- Dependencies: [What this depends on]
- Verification: [How to validate]

### Step 2: [Name]
...

## Risks and Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|
| ...  | ...    | ...        |

## Test Strategy
- Unit tests: [...]
- Integration tests: [...]
- Manual checks: [...]

## Effort Estimate
- Small (< 1 day)
- Medium (1–3 days)
- Large (> 3 days)

## Rollback Plan
[How to safely revert if needed]
```

## Principles

1. Be specific (avoid vague tasks)
2. Make every step verifiable
3. Keep tasks achievable and scoped
4. Tie all work to the goal
5. Add realistic effort expectations
