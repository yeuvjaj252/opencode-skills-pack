---
description: Project planning analysis for tasks - analysis only, no file edits
agent: cook
subtask: true
---

# /csp-plan - Project Planning

$ARGUMENTS

---

## Instructions

1. **Default workflow requirement**: always use MCP Serena tools whenever possible
2. **Understand the request**: read carefully and use `prompt-leverage` when the request needs clarification or restructuring
3. **Inspect the codebase**: identify current structure and relevant areas
4. **Analyze and plan**:
   - propose concrete implementation steps
   - identify files likely to change
   - estimate effort and timeline
   - call out potential risks
5. **Test strategy**: propose how to validate the changes
6. **Output only plan**: do not perform any code or file changes

### Prompt preflight

- Use `prompt-leverage: clarify` if scope, users, or constraints are missing
- Use `prompt-leverage: structure` if the request is detailed but messy
- Use `prompt-leverage: brainstorm` if planning depends on comparing approaches first
- Skip `prompt-leverage` when the request is already clear and actionable

## Output format

Return results in this format:

```markdown
## Analysis
[Short summary of the task]

## Implementation Steps
1. [Step 1]
2. [Step 2]
...

## Candidate Files
- `path/to/file1`
- `path/to/file2`

## Risks
- [Risk 1]
- [Risk 2]

## Test Strategy
[How to test and verify]

## Effort
[Small / Medium / Large]
```

---

## Plan File Naming Examples

| Request | Plan File |
|---------|-----------|
| `/csp-plan e-commerce site with cart` | `docs/PLAN-ecommerce-cart.md` |
| `/csp-plan mobile app for fitness` | `docs/PLAN-fitness-app.md` |
| `/csp-plan add dark mode feature` | `docs/PLAN-dark-mode.md` |
| `/csp-plan fix authentication bug` | `docs/PLAN-auth-fix.md` |
| `/csp-plan SaaS dashboard` | `docs/PLAN-saas-dashboard.md` |
