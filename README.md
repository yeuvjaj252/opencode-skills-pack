# OpenCode Kế Hoạch Cook Pack

Bộ pack mở rộng cho OpenCode với 2 chế độ hoạt động chính: `/kehoach` (lập kế hoạch) và `/cook` (thực thi), cùng với nhiều commands chuyên biệt khác.

## Tính năng

- **Agents**: `kehoach` (planning-only), `cook` (implementation), `explore` (discovery)
- **Commands**: 21 commands chuyên biệt cho từng workflow
- **Skills**: `plan-writing`, `coding-standard`, `test-strategy`

## Cài đặt

### Yêu cầu trước

- OpenCode đã được cài đặt
- Bash shell (Linux/macOS/WSL)

### Bước cài đặt

```bash
# Clone repo về máy
git clone https://github.com/yeuvjaj252/opencode-skills-pack.git
cd opencode-skills-pack

# Cài đặt vào project cụ thể (khuyến nghị)
./bin/install.sh -p /path/to/project

# Ví dụ cài từ repo pack vào project bên cạnh
./bin/install.sh -p ../my-project
```

Lưu ý quan trọng:
- Không chạy `./bin/install.sh` để cài vào chính repo `opencode-skills-pack`.
- Script đã chặn self-install để tránh ghi đè source pack.
- Luôn dùng `-p` để chỉ định đúng thư mục project đích.

## Danh Sách Commands

### Commands Chính

| Command | Mô Tả | Agent |
|---------|-------|-------|
| `/kehoach` | Lập kế hoạch phân tích - chỉ phân tích, không sửa file | kehoach |
| `/cook` | Thực thi task - implement và verify | cook |

### Commands Chuyên Biệt

| Command | Mô Tả | Agent |
|---------|-------|-------|
| `/csp-orchestrate` | Phối hợp nhiều agent cho task phức tạp | kehoach |
| `/csp-explore` | Khám phá codebase - hiểu cấu trúc project | explore |
| `/csp-frontend` | Frontend architect - UI components, styling | cook |
| `/csp-backend` | Backend architect - API, server-side logic | cook |
| `/csp-database` | Database architect - schema, migrations | kehoach |
| `/csp-test` | Test generation and execution | cook |
| `/csp-debug` | Debug mode - điều tra vấn đề | kehoach |
| `/csp-security` | Security auditor - vulnerability assessment | kehoach |
| `/csp-performance` | Performance optimizer | cook |
| `/csp-devops` | DevOps engineer - CI/CD, Docker | cook |
| `/csp-deploy` | Deployment command | cook |
| `/csp-docs` | Documentation writer | kehoach |
| `/csp-ui` | UI/UX design | cook |
| `/csp-mobile` | Mobile developer - React Native, Flutter | cook |
| `/csp-status` | Hiển thị trạng thái project và agent | kehoach |
| `/csp-brainstorm` | Brainstorming - khám phá nhiều options | kehoach |
| `/csp-preview` | Preview server management | cook |
| `/csp-enhance` | Thêm/cập nhật features | cook |
| `/csp-ui-ux-pro-max` | AI-powered design intelligence | cook |

## Sử Dụng

### Ví Dụ Commands

```bash
# Lập kế hoạch
/kehoach xây dựng hệ thống e-commerce

# Thực thi
/cook thêm chức năng đăng nhập

# Khám phá codebase
/csp-explore hiểu cấu trúc project

# Frontend work
/csp-frontend tạo component Login

# Backend work  
/csp-backend tạo API authentication

# Debug
/csp-debug API trả về lỗi 500

# Security audit
/csp-security review hệ thống authentication
```

### Chuyển đổi giữa chế độ

Trong OpenCode TUI:
- Sử dụng phím **Tab** để chuyển đổi giữa các agent
- Hoặc sử dụng lệnh `/kehoach` và `/cook` trực tiếp

## Cập nhật

```bash
# Cập nhật pack
./bin/update.sh

# Cập nhật cưỡng bức
./bin/update.sh -p /path/to/project
```

## Gỡ cài đặt

```bash
# Gỡ cài đặt
./bin/uninstall.sh

# Gỡ cài đặt khỏi project cụ thể
./bin/uninstall.sh -p /path/to/project
```

## Cấu trúc

```
opencode-skills-pack/
├── .opencode/
│   ├── skills/
│   │   ├── plan-writing/
│   │   ├── coding-standard/
│   │   └── test-strategy/
│   ├── agents/
│   │   ├── kehoach.md
│   │   ├── cook.md
│   │   └── explore.md
│   └── commands/
│       ├── kehoach.md
│       ├── cook.md
│       ├── csp-orchestrate.md
│       ├── csp-explore.md
│       ├── csp-frontend.md
│       ├── csp-backend.md
│       ├── csp-database.md
│       ├── csp-test.md
│       ├── csp-debug.md
│       ├── csp-security.md
│       ├── csp-performance.md
│       ├── csp-devops.md
│       ├── csp-deploy.md
│       ├── csp-docs.md
│       ├── csp-ui.md
│       ├── csp-mobile.md
│       ├── csp-status.md
│       ├── csp-brainstorm.md
│       ├── csp-preview.md
│       ├── csp-enhance.md
│       └── csp-ui-ux-pro-max.md
├── bin/
│   ├── install.sh
│   ├── uninstall.sh
│   └── update.sh
├── README.md
└── CHANGELOG.md
```

## Thêm mới Skill

Để thêm skill mới:

1. Tạo thư mục `.opencode/skills/<ten-skill>/`
2. Tạo file `SKILL.md` bên trong với frontmatter:

```yaml
---
name: ten-skill
description: Mô tả skill
compatibility: opencode
---
```

3. Cập nhật lại pack:

```bash
./bin/update.sh -f
```

## Cấu hình thêm (Optional)

Tạo file `opencode.json` trong project nếu cần thay đổi quyền:

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

## Khắc phục sự cố

### Không thấy lệnh

Đảm bảo pack đã được cài đúng:
```bash
ls -la .opencode/commands/
```

### Agent không hiển thị

Kiểm tra agent đã được link:
```bash
ls -la .opencode/agents/
```

### Symlink lỗi

Xóa và cài lại:
```bash
./bin/install.sh -f
```

## Đóng góp

Mọi contribution đều được welcome! Vui lòng tạo PR với mô tả chi tiết.

## License

MIT License
