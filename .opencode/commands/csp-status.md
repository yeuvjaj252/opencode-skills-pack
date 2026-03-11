---
description: Show current project and workflow status
agent: cook
---

# /csp-status - Project Status

$ARGUMENTS

---

## Purpose

Display a concise status report for the current workspace.

## What to report

- Project metadata (name, stack when detectable)
- Git status (branch, changed files, staged files)
- Active workflow context (planning / implementation)
- Optional preview/server status if available

## Suggested checks

```bash
ls -la
git status
```

If a local health endpoint exists, check it as optional context.

## Output format

```markdown
## Project Status

- Project: ...
- Branch: ...
- Working tree: clean/dirty
- Changed files: ...
- Mode: planning/implementation
- Preview: running/not running/unknown
```
