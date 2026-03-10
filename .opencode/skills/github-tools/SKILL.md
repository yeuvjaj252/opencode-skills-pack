---
name: github-tools
description: GitHub CLI and Git commit tools integration
compatibility: opencode
---

# GitHub Tools Skill

Skill nay cung cap cac tool va command lam viec voi GitHub va Git.

## Installed Skills

### 1. gh-cli
- GitHub CLI integration
- Cho phep thuc hien cac lenh GitHub truc tiep
- Quan ly issues, pull requests, repositories

### 2. git-commit
- Ho tro viet git commit messages chuan
- Tu dong tao commit message dua tren changes
- Ap dung conventions: Conventional Commits

## Available Commands

### /csp-commit
Mo ta: Tao commit message chuan cho project
Cong dung:
- Phan tich cac thay doi trong git staging area
- Tao commit message theo dinh dang Conventional Commits
- Ho tro cac loai commit: feat, fix, docs, style, refactor, test, chore

Vi du:
```
/csp-commit
```

Output se co dang:
```
feat: them chuc nang X

- Mo ta chi tiet change 1
- Mo ta chi tiet change 2
```

## Su dung GitHub CLI

Cac lenh co the dung qua `gh` command:

```bash
# Quan ly Pull Requests
gh pr list
gh pr create
gh pr review

# Quan ly Issues
gh issue list
gh issue create

# Quan ly Repository
gh repo view
gh repo clone
```

## Best Practices

1. **Commit Messages**:
   - Su dung Conventional Commits format
   - Message ngan gon, ro rang
   - Giai thich "why" thay vi "what"

2. **Pull Requests**:
   - Tao PR nho, tap trung
   - Mo ta day du changes
   - Link related issues

3. **Code Review**:
   - Review truoc khi merge
   - Su dung `gh pr review`
   - Provide constructive feedback

## Workflow Vi Du

### 1. Lam viec voi Feature Moi
```bash
# Tao branch moi
gh repo fork
git checkout -b feat/new-feature

# Sau khi code xong
/csp-commit

# Day len va tao PR
git push origin feat/new-feature
gh pr create --title "feat: them new feature" --body "Mo ta chi tiet..."
```

### 2. Fix Bug
```bash
# Checkout branch fix
git checkout -b fix/bug-123

# Sau khi fix xong
/csp-commit

# Tao PR
gh pr create --title "fix: sua bug #123" --body "Fixes #123"
```

## Ngin Dung

- Da cai dat: `gh-cli` va `git-commit` skills
- San sang su dung cho project GitHub
- Ho tro full GitHub workflow
