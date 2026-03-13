---
description: Review pull requests with high-signal findings and optional PR comment posting
agent: cook
subtask: false
---

# /csp-code-review - Pull Request Code Review

$ARGUMENTS

---

## Purpose

Review the current pull request or a specified PR using an OpenCode-native workflow inspired by Claude Code's code review plugin.

Focus on **high-signal findings only**:
- correctness and regression risk
- security or data-safety issues
- explicit guideline violations from repository guidance files
- change-context risks supported by git history or blame

Do **not** waste output on lint noise, style nits, or speculative complaints.

---

## Prompt preflight

- Use `prompt-leverage: execute` when the request is already actionable
- Use `prompt-leverage: clarify` if the PR target, review mode, or comment intent is ambiguous
- Keep preflight lightweight; prefer moving directly into review

---

## Inputs

Supported forms:

```text
/csp-code-review
/csp-code-review 123
/csp-code-review --comment
/csp-code-review 123 --comment
```

Interpretation:
- no argument: review the current branch PR if one exists
- PR number: review that pull request explicitly
- `--comment`: post a synthesized PR-level comment using `gh pr comment`

---

## Required workflow

1. **Identify the target PR**
   - Prefer current branch PR when no PR number is supplied
   - Use `gh pr view` / `gh pr status` / `gh pr diff` as appropriate
   - If no PR can be resolved, stop and explain what input is needed

2. **Skip when review is not useful**
   - Skip closed PRs
   - Skip draft PRs unless the user explicitly asks to review drafts
   - Skip trivial automated PRs when changes are obviously mechanical
   - Skip when an equivalent review was already posted and nothing meaningful changed

3. **Gather context**
   - PR title, body, base/head branches
   - changed files and diff
   - relevant guideline files such as `CLAUDE.md`, repo docs, or rules near touched areas
   - git blame/history when it helps validate whether a concern is newly introduced

4. **Run multiple review passes**
   - **Pass A - Correctness:** obvious bugs, broken assumptions, missing error handling, invalid edge cases
   - **Pass B - Guidelines:** explicit repository guidance violations only when the guideline clearly applies
   - **Pass C - Change Context:** regression risk, partial refactors, suspicious history, or mismatched surrounding patterns
   - When helpful, use `parallel-agents` to split these passes and synthesize findings

5. **Filter aggressively**
   - Keep only findings with strong evidence
   - Prefer issues introduced by the PR, not pre-existing repo problems
   - Ignore pure style/lint nits unless the repository guidance explicitly treats them as important
   - If uncertain, downgrade or drop the finding instead of creating noise

6. **Score confidence internally**
   - Use a simple internal rubric: low / medium / high confidence
   - Report only **high-confidence** findings by default
   - Mention medium-confidence findings only if the user explicitly asks for broader review coverage

7. **Prepare final output**
   - If no high-signal findings exist, say so clearly
   - Otherwise output a concise PR review summary with issue list, severity, rationale, and file/line references
   - If `--comment` is present, post the synthesized PR-level summary with `gh pr comment`

---

## Review output format

```markdown
## Code Review
PR: #123 - Fix auth callback handling
Mode: terminal | comment

### Summary
- Reviewed 8 changed files
- Checked correctness, guideline compliance, and change context
- Found 2 high-signal issues

### Findings
1. 🔴 High — Missing failure handling in OAuth callback can leave session state inconsistent
   - Why it matters: failed callback paths do not clear temporary auth state
   - Evidence: `src/auth/callback.ts#L61-L78`
   - Recommendation: add cleanup in failure path or `finally`

2. 🟡 Medium — Repository guideline requires explicit validation for external payloads
   - Why it matters: request body is trusted before schema validation
   - Evidence: `CLAUDE.md`, `src/api/webhook.ts#L12-L29`
   - Recommendation: validate payload before branching on fields
```

If posting to GitHub, convert references into real GitHub blob links when possible.

---

## GitHub CLI guidance

Preferred commands:

```bash
# Discover current PR
gh pr status
gh pr view
gh pr view <number>

# Diff and metadata
gh pr diff <number>
gh pr view <number> --json title,body,state,isDraft,baseRefName,headRefName,files,reviews

# Comment when requested
gh pr comment <number> --body "..."
```

Use `gh api` when structured data or timeline details are needed and not available from `gh pr view` defaults.

---

## Guardrails

- Prefer Serena/MCP tools for codebase discovery and file inspection
- Use `gh` for GitHub/PR operations rather than manual web fetching during execution
- Do not claim certainty without evidence from the diff, repository guidance, tests, or history
- Do not post comments unless `--comment` was explicitly requested
- Keep output concise and actionable
