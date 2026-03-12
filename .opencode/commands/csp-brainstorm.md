---
description: Structured brainstorming before implementation
agent: cook
subtask: true
---

# /csp-brainstorm - Structured Idea Exploration

$ARGUMENTS

---

## Purpose

Use this mode to explore multiple options before committing to implementation.

Before generating options, use `prompt-leverage` when the request needs cleanup:

- `clarify` when the goal, users, or constraints are missing
- `structure` when the prompt is long, scattered, or mixes multiple objectives
- `brainstorm` when the request should first be reframed into an option comparison setup

## Behavior

1. Clarify goal, users, and constraints
2. Propose at least 3 approaches
3. Compare tradeoffs (pros/cons, effort)
4. Recommend a direction with clear reasoning

## Output

Provide options A/B/C with:
- summary
- benefits
- drawbacks
- effort estimate
- recommendation
