---
description: Execute tasks based on approved plan - implement and verify
agent: cook
---

# /cook - Execute Task

Task: $ARGUMENTS

## Instructions

1. **Default workflow requirement**: always use MCP Serena tools whenever possible
2. **Understand requirements**: use `prompt-leverage` if the request is ambiguous, messy, or not yet implementation-ready
3. **Implement changes**:
   - apply requested updates
   - follow project coding standards
   - keep code concise and meaningful
4. **Verify**:
   - run lint when available
   - run typecheck when available
   - run tests when available
5. **Report**:
   - list changed files
   - provide verification results
   - fix failures before completion

### Prompt preflight

- Use `prompt-leverage: clarify` if the request is missing critical requirements
- Use `prompt-leverage: structure` if the request mixes multiple goals or priorities
- Use `prompt-leverage: execute` when the request is clear enough to frame direct implementation
- Keep this preflight lightweight and avoid unnecessary questions

## Output format

```markdown
## Implemented Changes
- `path/to/file1` - [description]
- `path/to/file2` - [description]

## Verification
- Lint: [PASS/FAIL]
- Typecheck: [PASS/FAIL]
- Test: [PASS/FAIL]

## Notes
[if any]
```
