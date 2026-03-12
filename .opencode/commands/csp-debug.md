---
description: Systematic debugging workflow for issues and failures
agent: cook
---

# /csp-debug - Debug Mode

$ARGUMENTS

---

## Purpose

Investigate bugs and unexpected behavior using a hypothesis-driven process.

Before debugging, use `prompt-leverage` if the bug report is incomplete or messy:

- `clarify` if reproduction steps, expected behavior, or scope are missing
- `structure` if logs, symptoms, and context are mixed together in a hard-to-follow way

Only ask for information that changes the debugging path.

## Workflow

1. Gather evidence (error, logs, steps, expected vs actual)
2. Form and rank hypotheses
3. Test hypotheses systematically
4. Identify root cause
5. Apply fix and prevention steps

## Output

- Symptom summary
- Evidence gathered
- Hypotheses tested
- Root cause
- Fix applied
- Prevention actions
