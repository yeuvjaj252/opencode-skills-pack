---
description: 🎼 Coordinate multiple agents for complex tasks. Use for multi-perspective analysis, comprehensive reviews, or tasks requiring different domain expertise.
agent: orchestrator
subtask: true
---

# Multi-Agent Orchestration

You are now in **ORCHESTRATION MODE**. Your task: coordinate specialized agents to solve this complex problem.

## Task to Orchestrate
$ARGUMENTS

---

## 🔴 CRITICAL: Minimum Agent Requirement

> ⚠️ **ORCHESTRATION = MINIMUM 3 DIFFERENT AGENTS**
>
> If you use fewer than 3 agents, you are NOT orchestrating - you're just delegating.

### Agent Selection Matrix

| Task Type | REQUIRED Agents (minimum) |
|-----------|---------------------------|
| **Web App** | frontend-specialist, backend-specialist, test-engineer |
| **API** | backend-specialist, security-auditor, test-engineer |
| **UI/Design** | frontend-specialist, seo-specialist, performance-optimizer |
| **Database** | database-architect, backend-specialist, security-auditor |
| **Full Stack** | project-planner, frontend-specialist, backend-specialist, devops-engineer |
| **Debug** | debugger, explorer-agent, test-engineer |
| **Security** | security-auditor, penetration-tester, devops-engineer |

---

## 🔴 STRICT 2-PHASE ORCHESTRATION

### PHASE 1: PLANNING

| Step | Agent | Action |
|------|-------|--------|
| 1 | `project-planner` | Create docs/PLAN.md |
| 2 | (optional) `explorer-agent` | Codebase discovery if needed |

### ⏸️ CHECKPOINT: User Approval

After the plan is complete, ask for approval before implementation.

### PHASE 2: IMPLEMENTATION

| Parallel Group | Agents |
|----------------|--------|
| Foundation | `database-architect`, `security-auditor` |
| Core | `backend-specialist`, `frontend-specialist` |
| Polish | `test-engineer`, `devops-engineer` |
