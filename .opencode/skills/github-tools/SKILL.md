---
name: github-tools
description: GitHub CLI and Git commit tools integration
compatibility: opencode
---

# GitHub Tools Skill

This skill provides guidance for GitHub and Git workflows.

## Integrated Capabilities

### 1) GitHub CLI (`gh`)
- Direct GitHub operations from terminal
- Manage pull requests, issues, and repositories

### 2) Commit Workflow
- Create clean, conventional commit messages
- Keep commit history meaningful and reviewable

## Common Commands

```bash
# Pull requests
gh pr list
gh pr create
gh pr review

# Issues
gh issue list
gh issue create

# Repository
gh repo view
gh repo clone
```

## Best Practices

1. Keep commit messages concise and intention-driven
2. Use small, focused pull requests
3. Link related issues when relevant
4. Review before merging

## Example Flow

```bash
# Create feature branch
git checkout -b feat/new-feature

# Commit changes
git add .
git commit -m "feat: add new feature"

# Push and open PR
git push -u origin feat/new-feature
gh pr create --title "feat: add new feature" --body "Summary of changes"
```
