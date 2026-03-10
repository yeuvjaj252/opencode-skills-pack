---
description: GitHub tools - commit, PR, issues, và git workflow
agent: cook
subtask: false
---

# /github-tools - GitHub Operations

$ARGUMENTS

---

## Task

Hỗ trợ các thao tác GitHub và Git:
- Tạo commit message chuẩn
- Tạo pull requests
- Quản lý issues
- Xem repository info
- Git workflow operations

---

## Available Tools

### 1. Git Commit (`git-commit`)
Tạo commit message tự động theo Conventional Commits.

**Ví dụ:**
```
/commit
```

**Output format:**
```
feat: thêm chức năng mới

- Mô tả chi tiết change 1
- Mô tả chi tiết change 2
```

### 2. GitHub CLI (`gh-cli`)
Thực thi lệnh GitHub trực tiếp.

---

## Commands Guide

### Commit Changes
```bash
# Xem thay đổi
git status
git diff

# Tạo commit với message chuẩn
git commit -m "feat: description"
```

### Pull Requests
```bash
# List PRs
gh pr list

# Tạo PR mới
gh pr create --title "feat: description" --body "Description here"

# Review PR
gh pr review --approve
gh pr review --comment
```

### Issues
```bash
# List issues
gh issue list

# Tạo issue mới
gh issue create --title "Bug: ..." --body "Description"

# View issue
gh issue view <number>
```

### Repository
```bash
# Xem repo info
gh repo view

# Clone repo
gh repo clone <owner/repo>

# Fork repo
gh repo fork
```

### Workflow
```bash
# Tạo branch mới
gh repo fork
git checkout -b feat/new-feature

# Push và tạo PR
git push origin feat/new-feature
gh pr create --title "feat: new feature" --body "Description"

# Check CI status
gh pr checks <pr-number>
```

---

## Commit Types (Conventional Commits)

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Code style (formatting) |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `test` | Adding or updating tests |
| `chore` | Changes to build process or auxiliary tools |

---

## Usage Examples

### Example 1: Commit current changes
```
/github-tools commit
```

### Example 2: Create PR
```
/github-tools create-pr --title "feat: add user auth" --body "Implements JWT authentication"
```

### Example 3: List open issues
```
/github-tools list-issues --state open
```

### Example 4: Check PR status
```
/github-tools check-pr 123
```

---

## Best Practices

1. **Commit Messages**:
   - Dùng Conventional Commits format
   - Message ngắn gọn, rõ ràng
   - Giải thích "why" thay vì "what"

2. **Pull Requests**:
   - Tạo PR nhỏ, tập trung
   - Mô tả đầy đủ changes
   - Link related issues (Fixes #123)

3. **Code Review**:
   - Review trước khi merge
   - Dùng `gh pr review`
   - Provide constructive feedback

---

## Workflow Template

### Feature Development
```bash
# 1. Fork repo
gh repo fork

# 2. Tạo branch
git checkout -b feat/feature-name

# 3. Code xong thì commit
/csp-commit

# 4. Push lên GitHub
git push origin feat/feature-name

# 5. Tạo PR
gh pr create --title "feat: feature-name" --body "Description of changes"
```

### Bug Fix
```bash
# 1. Tạo branch fix
git checkout -b fix/issue-123

# 2. Fix bug và commit
/csp-commit

# 3. Tạo PR với link issue
gh pr create --title "fix: fix bug #123" --body "Fixes #123"
```
