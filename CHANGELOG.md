# Changelog

Tất cả các thay đổi nổi bật của pack sẽ được ghi lại tại đây.

## [1.0.0] - 2026-02-24

### Added
- Agent `csp-plan`: Planning-only agent chỉ phân tích, không sửa file
- Agent `cook`: Implementation agent thực thi thay đổi
- Command `/csp-plan`: Lập kế hoạch phân tích cho task
- Command `/cook`: Thực thi task theo kế hoạch
- Skill `plan-writing`: Hướng dẫn cấu trúc kế hoạch
- Skill `coding-standard`: Coding standards cho TypeScript/JavaScript, Python, Go, Rust
- Skill `test-strategy`: Testing patterns và nguyên tắc

### Features
- Symlink-based installation (để update, rollback)
- Manifest tracking cho uninstall/update chính xác
- Hỗ trợ multiple projects (mỗi project cấu hình riêng)
- Color-coded output cho install/uninstall/update scripts

### Installation
```bash
./bin/install.sh -p /path/to/project
```

### Usage
```bash
/csp-plan <task>  # Lập kế hoạch
/cook <task>     # Thực thi
```

### Update
```bash
./bin/update.sh -p /path/to/project
```

### Uninstall
```bash
./bin/uninstall.sh -p /path/to/project
```

---

## [Unreleased]

### Added
- Skill `prompt-leverage`: skill nội bộ để cải thiện input trước khi planning, implementation, debugging, hoặc documentation
- Command `/csp-code-review`: workflow review pull request theo hướng OpenCode-native, tập trung vào high-signal findings và hỗ trợ `--comment` qua GitHub CLI

### Changed
- Skill `github-tools`: bổ sung workflow review PR với `gh pr view`, `gh pr diff`, `gh pr comment`, skip logic, và review guardrails
- Skill `code-review-checklist`: bổ sung PR review heuristics, confidence rubric, và output template cho high-signal review
- Command `/csp-plan`: thêm prompt preflight với các mode `clarify`, `structure`, `brainstorm`
- Command `/cook`: thêm prompt preflight với các mode `clarify`, `structure`, `execute`
- Command `/csp-brainstorm`: tích hợp `prompt-leverage` để làm rõ context và tái cấu trúc input trước khi tạo options
- Command `/csp-debug`: tích hợp `prompt-leverage` để chuẩn hóa bug report trước khi điều tra
- Command `/csp-docs`: tích hợp `prompt-leverage` để làm rõ audience, scope, và loại tài liệu trước khi viết
- README: bổ sung tài liệu cho skill `prompt-leverage` và phạm vi tích hợp hiện tại

### Planned
- [ ] Thêm nhiều skills (refactor, debug, security-audit)
- [ ] Hỗ trợ config qua opencode.json
- [ ] Thêm command `/csp-plan-tu-file` để đọc kế hoạch từ file
- [ ] Thêm pre-commit hooks cho linting
- [ ] Thêm telemetry cho usage tracking (opt-in)
