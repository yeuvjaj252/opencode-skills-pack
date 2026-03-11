---
description: GitHub tools - commit, PR, issues, and Git workflow
agent: cook
subtask: false
---

# /csp-github - GitHub Operations

$ARGUMENTS

---

## Task

Support GitHub and Git operations:
- Create conventional commit messages
- Create pull requests
- Manage issues
- View repository information
- Execute common Git workflows

---

## Commands Guide

### Commit Changes
```bash
git status
git diff
git commit -m "feat: description"
```

### Pull Requests
```bash
gh pr list
gh pr create --title "feat: description" --body "Description here"
gh pr review --approve
gh pr review --comment
```

### Issues
```bash
gh issue list
gh issue create --title "Bug: ..." --body "Description"
gh issue view <number>
```

### Repository
```bash
gh repo view
gh repo clone <owner/repo>
gh repo fork
```

---

## Commit Types (Conventional Commits)

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Code style changes |
| `refactor` | Refactor without feature/fix |
| `test` | Add or update tests |
| `chore` | Tooling/build/maintenance |
