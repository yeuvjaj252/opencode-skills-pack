---
description: Coordinate multiple specialists for complex, multi-domain tasks
agent: cook
subtask: true
---

# /csp-orchestrate - Multi-Agent Orchestration

$ARGUMENTS

---

## Critical Requirement

> **ORCHESTRATION = AT LEAST 3 DIFFERENT SPECIALIST ROLES**

If fewer than 3 roles are involved, this is delegation, not orchestration.

Validation before completion:
- count invoked specialist roles
- if `role_count < 3`, stop and expand coverage

### Suggested Role Matrix

| Task Type | Minimum Roles |
|-----------|---------------|
| Web App | frontend, backend, testing |
| API | backend, security, testing |
| UI/Design | frontend, performance, seo |
| Database | database, backend, security |
| Full Stack | planning, frontend, backend |
| Debug | exploration, implementation, testing |
| Security | security, devops, backend |

---

## 2-Phase Workflow

### Phase 1: Planning (sequential)
1. Create or refine plan
2. Explore codebase if needed
3. Ask for user approval before implementation

### Phase 2: Implementation (parallelizable)
- Implement core tasks
- Validate with lint/typecheck/tests
- Synthesize a final orchestration report

---

## Output Format

```markdown
## Orchestration Report

### Task
[Original task summary]

### Roles Invoked (>= 3)
| # | Role | Focus Area | Status |
|---|------|------------|--------|
| 1 | planning | Task breakdown | ✅ |
| 2 | exploration | Codebase mapping | ✅ |
| 3 | implementation | Code changes | ✅ |

### Verification
- [x] Lint
- [x] Typecheck
- [x] Tests

### Key Findings
1. ...
2. ...
3. ...

### Summary
[One-paragraph synthesis]
```
