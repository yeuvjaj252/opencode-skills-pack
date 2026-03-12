---
name: prompt-leverage
description: Improve rough user input before planning or execution. Use to clarify ambiguity, restructure messy requests, compare options, or turn intent into implementation-ready instructions.
compatibility: opencode
---

# Prompt Leverage

Use this skill to transform rough user intent into a better working prompt.

In OpenCode, this is primarily a **supporting skill** used by higher-level commands such as `/csp-plan`, `/cook`, `/csp-brainstorm`, `/csp-debug`, and `/csp-docs`.

The user should usually call the command, not this skill directly.

---

## Purpose

`prompt-leverage` helps improve task input before planning, implementation, debugging, or documentation work begins.

Use it to:

1. clarify ambiguity before action
2. structure messy requests before delegation
3. compare options before committing
4. frame clear work for execution

---

## Core Rule

Only use this skill when it adds value.

### Good triggers
- the request is ambiguous
- the request is under-specified
- multiple goals are mixed together
- the prompt is long but poorly structured
- the workflow depends on choosing an approach first

### Skip when
- the request is already specific
- the scope is already clear
- the user already chose a direction
- the task is directly actionable

---

## Modes

### `clarify`

Use when critical information is missing.

#### Output
- restated goal
- missing information
- 1-3 highest-value questions
- safe assumptions if unanswered

#### Best for
- vague planning tasks
- missing users, scope, or constraints
- unclear debugging reports

---

### `structure`

Use when the request contains useful details but is hard to act on.

#### Output
- goal
- context
- constraints
- expected output
- success criteria

#### Best for
- long freeform requests
- mixed requirements in one message
- messy error reports

---

### `brainstorm`

Use when the direction is not decided yet.

#### Output
- goal
- constraints
- option A / B / C
- benefits
- drawbacks
- recommendation

#### Best for
- solution shaping
- architecture decisions
- early exploration before planning

---

### `execute`

Use when the request is clear enough to hand off into implementation or writing.

#### Output
- task summary
- plan or steps
- constraints
- verification expectations
- desired output format

#### Best for
- implementation tasks
- documentation tasks
- final execution framing

---

## Recommended Command Integration

### `/csp-plan`
- `clarify` for missing scope or constraints
- `structure` for messy requests
- `brainstorm` when planning depends on choosing a direction first

### `/cook`
- `clarify` for missing requirements
- `structure` for mixed requests
- `execute` before implementation

### `/csp-brainstorm`
- `clarify` for missing context
- `structure` for scattered prompts
- `brainstorm` to frame option comparison

### `/csp-debug`
- `clarify` for missing reproduction data
- `structure` for hard-to-follow bug reports

### `/csp-docs`
- `clarify` for missing audience or scope
- `structure` for mixed documentation requests
- `execute` before drafting

---

## Quick Heuristic

| If the request is... | Use mode |
|---|---|
| missing purpose, users, or constraints | `clarify` |
| long and unstructured | `structure` |
| still deciding approach | `brainstorm` |
| ready for direct implementation or writing | `execute` |

If none apply, continue without this skill.

---

## Best Practices

1. Ask fewer, better questions
2. Prefer restructuring over over-questioning
3. Preserve user intent when rewriting
4. Keep outputs compact and actionable
5. Avoid adding process to simple tasks

---

## Anti-Patterns

- asking questions that do not change the next step
- reformatting already-good prompts
- brainstorming when the direction is already chosen
- inventing requirements the user did not ask for
- forcing this skill into every workflow
