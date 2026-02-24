# OpenCode Kehoach Cook Pack

Bo pack mo rong cho OpenCode voi 2 che do hoat dong: `/kehoach` (lap ke hoach) va `/cook` (thuc thi).

## Tinh nang

- **Agents**: `kehoach` (planning-only) va `cook` (implementation)
- **Commands**: `/kehoach` va `/cook` 
- **Skills**: `plan-writing`, `coding-standard`, `test-strategy`

## Cai dat

### Cau truoc

- OpenCode da duoc cai dat
- Bash shell (Linux/macOS/WSL)

### Buoc cai dat

```bash
# Clone repo hoac tai pack ve may
git clone <your-repo-url> opencode-kehoach-cook-pack
cd opencode-kehoach-cook-pack

# Cai dat vao project hien tai
./bin/install.sh

# Hoac cai dat vao project cu the
./bin/install.sh -p /path/to/project
```

## Su dung

### Che do Ke Hoach (Planning)

```bash
/kehoach Them chuc nang search cho trang home
```

Agent `kehoach` se:
- Phan tich yeu cau
- Khao sat code hien tai
- De xuat cac buoc thuc hien
- Xac dinh risk
- De xuat test strategy

**Luu y**: Agent nay chi phan tich, KHONG thay doi file.

### Che do Cook (Implementation)

```bash
/cook Them chuc nang search cho trang home
```

Agent `cook` se:
- Thuc hien thay doi theo yeu cau
- Follow coding standards
- Chay lint/typecheck
- Verify bang test
- Bao cao ket qua

### Chuyen doi giua che do

Trong OpenCode TUI:
- Su dung phim **Tab** de chuyen doi giua cac agent
- Hoac su dung lenh `/kehoach` va `/cook` truc tiep

## Cap nhat

```bash
# Cap nhat pack
./bin/update.sh

# Cap nhat cuong bap
./bin/update.sh -p /path/to/project
```

## Go cai dat

```bash
# Go cai dat
./bin/uninstall.sh

# Go cai dat khoi project cu the
./bin/uninstall.sh -p /path/to/project
```

## Cau truc

```
opencode-kehoach-cook-pack/
├── .opencode/
│   ├── skills/
│   │   ├── plan-writing/
│   │   ├── coding-standard/
│   │   └── test-strategy/
│   ├── agents/
│   │   ├── kehoach.md
│   │   └── cook.md
│   └── commands/
│       ├── kehoach.md
│       └── cook.md
├── bin/
│   ├── install.sh
│   ├── uninstall.sh
│   └── update.sh
├── README.md
└── CHANGELOG.md
```

## Them moi Skill

De them skill moi:

1. Tao thu muc `.opencode/skills/<ten-skill>/`
2. Tao file `SKILL.md` ben trong voi frontmatter:

```yaml
---
name: ten-skill
description: Mo ta skill
compatibility: opencode
---
```

3. Cap nhat lai pack:

```bash
./bin/update.sh -f
```

## Cau hinh them (Optional)

Tao file `opencode.json` trong project neu can thay doi quyen:

```json
{
  "agent": {
    "kehoach": {
      "permission": {
        "edit": "deny",
        "bash": "ask"
      }
    }
  }
}
```

## Troubleshooting

### Khong thay lenh /kehoach hoac /cook

Dam bao pack da duoc cai dung:
```bash
ls -la .opencode/commands/
```

### Agent khong hien thi

Kiem tra agent da duoc link:
```bash
ls -la .opencode/agents/
```

### Symlink loi

Xoa va cai lai:
```bash
./bin/install.sh -f
```

## Dong gop

Moi contribution deu duoc welcome! Vui long tao PR voi mo ta chi tiet.

## License

MIT License
