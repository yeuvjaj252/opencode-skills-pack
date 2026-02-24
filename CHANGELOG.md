# Changelog

Tat ca cac thay doi noi bat cua pack se duoc ghi lai tai day.

## [1.0.0] - 2026-02-24

### Added
- Agent `kehoach`: Planning-only agent chi phan tich, khong sua file
- Agent `cook`: Implementation agent thuc thi thay doi
- Command `/kehoach`: Lap ke hoach phan tich cho task
- Command `/cook`: Thuc thi task theo ke hoach
- Skill `plan-writing`: Huong dan cau truc ke hoach
- Skill `coding-standard`: Coding standards cho TypeScript/JavaScript, Python, Go, Rust
- Skill `test-strategy`: Testing patterns va nguyen tac

### Features
- Symlink-based installation (de update, rollback)
- Manifest tracking cho uninstall/update chinh xac
- Ho tro multiple projects (moi project cau hinh rieng)
- Color-coded output cho install/uninstall/update scripts

### Installation
```bash
./bin/install.sh -p /path/to/project
```

### Usage
```bash
/kehoach <task>  # Lap ke hoach
/cook <task>     # Thuc thi
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
- [ ] Them nhieu skills (refactor, debug, security-audit)
- [ ] Ho tro config qua opencode.json
- [ ] Them command `/kehoach-tu-file` de doc ke hoach tu file
- [ ] Them pre-commit hooks cho linting
- [ ] Them telemetry cho usage tracking (opt-in)
