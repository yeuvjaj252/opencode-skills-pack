---
description: Execute tasks based on approved plan - implement and verify
agent: cook
---

# /cook - Execute Task

Task: $ARGUMENTS

## Instructions

1. **Understand requirements**: ask clarifying questions if needed
2. **Implement changes**:
   - apply requested updates
   - follow project coding standards
   - keep code concise and meaningful
3. **Verify**:
   - run lint when available
   - run typecheck when available
   - run tests when available
4. **Report**:
   - list changed files
   - provide verification results
   - fix failures before completion

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
