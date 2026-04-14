---
description: 📋 Lập kế hoạch dự án bằng project-planner agent. Chỉ tạo plan file, không viết code.
agent: project-planner
subtask: true
---

# /csp-plan - Project Planning Mode

$ARGUMENTS

---

## 🔴 CRITICAL RULES

1. **NO CODE WRITING** - This command creates plan file only
2. **Use project-planner agent**
3. **Socratic Gate** - Use `prompt-leverage` when clarification or restructuring is needed before planning
4. **Dynamic Naming** - Plan file named based on task
5. **Use Context7 selectively** - consult docs only when framework/library behavior or version-specific guidance materially affects the plan
6. **Do not fake docs research** - if Context7 is not configured, say so and point to setup instructions

---

## Task

Before invoking `project-planner`, do a quick input quality check:

- If the request is ambiguous or under-specified, apply `prompt-leverage` in `clarify` mode
- If the request is detailed but messy, apply `prompt-leverage` in `structure` mode
- If the request needs option comparison before planning, apply `prompt-leverage` in `brainstorm` mode
- If the request is already clear, skip `prompt-leverage` and continue directly

Keep this preflight lightweight. Do not block planning with unnecessary questions.

Use `skill-csp-context7-research` before finalizing the plan when:
- the request includes a named library or framework
- the plan depends on official best practices or framework conventions
- APIs, config, or behavior may be version-sensitive

If Context7 is missing but docs-backed planning is needed:
- tell the user that Context7 MCP is not configured
- point them to two setup paths:
  - add the Context7 plugin in Claude if the client supports plugins
  - or configure Context7 through the MCP config file
- reference the README setup section instead of inventing unofficial behavior

Use the `project-planner` agent with this context:

```text
CONTEXT:
- User Request: $ARGUMENTS
- Mode: PLANNING ONLY (no code)
- Output: docs/PLAN-{task-slug}.md (dynamic naming)

NAMING RULES:
1. Extract 2-3 key words from request
2. Lowercase, hyphen-separated
3. Max 30 characters
4. Example: "e-commerce cart" → PLAN-ecommerce-cart.md

RULES:
1. Follow project-planner.md Phase -1 (Context Check)
2. Follow project-planner.md Phase 0 (Socratic Gate)
3. If `prompt-leverage` was used, pass the clarified or structured request forward
4. If Context7 was used, pass the docs-backed constraints or recommendations forward
5. If Context7 was needed but unavailable, record that limitation and the recommended setup path in the plan
6. Create PLAN-{slug}.md with task breakdown
7. DO NOT write any code files
8. REPORT the exact file name created
```

---

## Expected Output

| Deliverable | Location |
|-------------|----------|
| Project Plan | `docs/PLAN-{task-slug}.md` |
| Task Breakdown | Inside plan file |
| Agent Assignments | Inside plan file |
| Verification Checklist | Phase X in plan file |

---

## After Planning

Tell user:
```text
[OK] Plan created: docs/PLAN-{slug}.md

Next steps:
- Review the plan
- Run `/cook` to start implementation
- Or modify plan manually
```
