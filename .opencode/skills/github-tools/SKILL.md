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
gh pr view
gh pr diff
gh pr comment

# Issues
gh issue list
gh issue create

# Repository
gh repo view
gh repo clone
```

## PR Review Workflow

Use this workflow when reviewing a pull request from the terminal:

1. Resolve the target PR
   - `gh pr status` for the current branch
   - `gh pr view <number>` when the PR number is known
2. Gather review context
   - title, body, state, base/head refs
   - changed files and full diff
   - existing reviews/comments if skip logic matters
3. Perform a high-signal review
   - correctness and regression risk
   - security/data-safety issues
   - explicit repository guideline violations
   - change-context checks with git history/blame when needed
4. Post only synthesized findings
   - prefer PR-level comment with `gh pr comment`
   - avoid low-value nitpicks and style noise

### Recommended Commands

```bash
# Resolve current PR
gh pr status
gh pr view

# Structured PR metadata
gh pr view <number> --json title,body,state,isDraft,baseRefName,headRefName,files,reviews

# Diff and comments
gh pr diff <number>
gh pr comment <number> --body "Review summary"
```

### Review Guardrails

- Skip closed or draft PRs unless the user explicitly asks otherwise
- Skip trivial or clearly automated changes when no meaningful review signal exists
- Focus on issues introduced by the PR, not pre-existing repository debt
- Prefer one concise synthesized review over many noisy comments

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
