---
description: 🐞 Debugging command. Activates DEBUG mode for systematic problem investigation.
agent: debugger
---

# /csp-debug - Systematic Problem Investigation

$ARGUMENTS

---

## Purpose

This command activates DEBUG mode for systematic investigation of issues, errors, or unexpected behavior.

Before debugging, use `prompt-leverage` if the bug report is incomplete or messy:

- `clarify` if reproduction steps, expected behavior, or scope are missing
- `structure` if logs, symptoms, and context are mixed together in a hard-to-follow way

Only ask for information that changes the debugging path.

## Behavior

1. **Gather information**
   - Run a quick `prompt-leverage` pass if the report is vague or messy
   - Error message
   - Reproduction steps
   - Expected vs actual behavior
   - Recent changes

2. **Form hypotheses**
   - List possible causes
   - Order by likelihood

3. **Investigate systematically**
   - Test each hypothesis
   - Check logs, data flow
   - Use elimination method

4. **Fix and prevent**
   - Apply fix
   - Explain root cause
   - Add prevention measures
