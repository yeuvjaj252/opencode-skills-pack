---
description: Generate and execute tests for files, features, and flows
agent: cook
---

# /csp-test - Test Generation and Execution

$ARGUMENTS

---

## Purpose

Generate tests, run existing tests, and report test quality.

## Sub-commands

```text
/csp-test                # run all tests
/csp-test [target]       # generate tests for file/feature
/csp-test coverage       # show coverage report
/csp-test watch          # run in watch mode
```

---

## Behavior

1. Analyze target behavior and edge cases
2. Generate tests following project conventions
3. Mock external dependencies where appropriate
4. Execute test suite and report outcomes clearly

---

## Output Format

```markdown
## Tests: [Target]

### Test Plan
| Test Case | Type | Coverage |
|-----------|------|----------|
| ... | ... | ... |

### Generated Files
- tests/[file].test.ts

### Execution Result
- Passed: X
- Failed: Y
- Notes: ...
```
