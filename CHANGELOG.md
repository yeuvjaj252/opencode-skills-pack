# Changelog

Tất cả các thay đổi nổi bật của pack sẽ được ghi lại tại đây.

## [1.0.0] - 2026-02-24

### Added
- Agent `kehoach`: Planning-only agent chỉ phân tích, không sửa file
- Agent `cook`: Implementation agent thực thi thay đổi
- Command `/kehoach`: Lập kế hoạch phân tích cho task
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
/kehoach <task>  # Lập kế hoạch
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

### Planned
- [ ] Thêm nhiều skills (refactor, debug, security-audit)
- [ ] Hỗ trợ config qua opencode.json
- [ ] Thêm command `/kehoach-tu-file` để đọc kế hoạch từ file
- [ ] Thêm pre-commit hooks cho linting
- [ ] Thêm telemetry cho usage tracking (opt-in)
