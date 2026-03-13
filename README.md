# 🚀 Opencode Skill Pack

Bộ pack mở rộng cho OpenCode theo hướng **usability-first**: dùng 1 agent chính (`cook`) cho toàn bộ command, giảm nhu cầu chuyển tab nhưng vẫn giữ workflow chuyên biệt theo từng lệnh.

## ✨ Tính năng

- **Agents**: `cook` (primary, single-agent workflow)
- **Commands**: 23 commands chuyên biệt cho từng workflow
- **Skills**: 50 skills (full migration từ claude-skills-pack)

## 📥 Cài đặt

### ⚠️ Yêu cầu trước

- OpenCode đã được cài đặt
- Bash shell (Linux/macOS/WSL)

### 🔧 Bước cài đặt

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

## 💡 Skill nội bộ mới

### `prompt-leverage`

OpenCode Skill Pack hiện có thêm skill hỗ trợ nội bộ `prompt-leverage` để nâng chất lượng input trước khi planning, implement, debug hoặc viết docs.

Skill này không phải command chính mà là utility skill để các command cấp cao tự dùng khi cần.

### 🎯 Các mode hỗ trợ

- `clarify` — làm rõ request mơ hồ hoặc thiếu thông tin quan trọng
- `structure` — tái cấu trúc request dài, rối, hoặc trộn nhiều mục tiêu
- `brainstorm` — đưa request về dạng so sánh nhiều hướng tiếp cận
- `execute` — biến intent đã rõ thành instruction sẵn sàng để thực thi

### 🔗 Tích hợp hiện tại

- `/csp-plan`
- `/cook`
- `/csp-brainstorm`
- `/csp-debug`
- `/csp-docs`

### 📝 Ghi chú sử dụng

- User vẫn nên gọi các command cấp cao như `/csp-plan` hoặc `/cook`
- `prompt-leverage` hoạt động phía sau khi request cần được làm rõ hoặc làm sạch
- Không nên kích hoạt nó cho mọi task đơn giản

## 📋 Danh Sách Commands

### 🎯 Commands Chính

| Command | Mô Tả | Agent |
|---------|-------|-------|
| `/csp-plan` | 📋 Lập kế hoạch phân tích - chỉ phân tích, không sửa file | cook |
| `/cook` | 👨‍🍳 Thực thi task - implement và verify | cook |

### ⚡ Commands Chuyên Biệt

| Command | Mô Tả | Agent |
|---------|-------|-------|
| `/csp-orchestrate` | 🎼 Phối hợp nhiều agent cho task phức tạp | cook |
| `/csp-explore` | 🔍 Khám phá codebase - hiểu cấu trúc project | cook |
| `/csp-frontend` | 🎨 Frontend architect - UI components, styling | cook |
| `/csp-backend` | ⚙️ Backend architect - API, server-side logic | cook |
| `/csp-database` | 🗄️ Database architect - schema, migrations | cook |
| `/csp-test` | ✅ Test generation and execution | cook |
| `/csp-debug` | 🐛 Debug mode - điều tra vấn đề | cook |
| `/csp-security` | 🔒 Security auditor - vulnerability assessment | cook |
| `/csp-performance` | 🚀 Performance optimizer | cook |
| `/csp-devops` | 🐳 DevOps engineer - CI/CD, Docker | cook |
| `/csp-deploy` | 🚀 Deployment command | cook |
| `/csp-docs` | 📄 Documentation writer | cook |
| `/csp-ui` | 🎨 UI/UX design | cook |
| `/csp-mobile` | 📱 Mobile developer - React Native, Flutter | cook |
| `/csp-status` | 📊 Hiển thị trạng thái project và agent | cook |
| `/csp-brainstorm` | 💡 Brainstorming - khám phá nhiều options | cook |
| `/csp-preview` | 👁️ Preview server management | cook |
| `/csp-enhance` | ✨ Thêm/cập nhật features | cook |
| `/csp-ui-ux-pro-max` | 🎯 AI-powered design intelligence | cook |
| `/csp-github` | 🐙 GitHub workflow: commit, PR, issue operations | cook |
| `/csp-code-review` | 🧪 Review pull requests with high-signal findings | cook |

## 📚 Skills Catalog

### Core Development (16 skills)

| Skill | Description |
|-------|-------------|
| `api-patterns` | API design patterns (REST, GraphQL, tRPC) |
| `architecture` | Architecture decision framework & ADR |
| `clean-code` | Clean code principles & refactoring |
| `code-review-checklist` | Code review guidelines |
| `coding-standard` | Coding standards & best practices |
| `database-design` | Schema design, migrations, ORM |
| `documentation-templates` | Documentation templates |
| `frontend-design` | Frontend design thinking |
| `mcp-builder` | MCP server building |
| `nextjs-best-practices` | Next.js App Router patterns |
| `nextjs-react-expert` | React/Next.js performance |
| `nodejs-best-practices` | Node.js patterns |
| `react-patterns` | Modern React patterns |
| `tailwind-patterns` | Tailwind CSS patterns |
| `testing-patterns` | Testing strategies |
| `typescript-expert` | TypeScript patterns |

### DevOps & Infrastructure (6 skills)

| Skill | Description |
|-------|-------------|
| `bash-linux` | Bash/Linux terminal patterns |
| `cloudflare-expert` | Cloudflare Workers, Pages, KV, D1 |
| `deployment-procedures` | Safe deployment workflows |
| `docker-expert` | Docker containerization |
| `server-management` | Server management & monitoring |
| `powershell-windows` | PowerShell patterns |

### Specialized Frameworks (6 skills)

| Skill | Description |
|-------|-------------|
| `nestjs-expert` | Nest.js framework |
| `prisma-expert` | Prisma ORM |
| `vue-expert` | Vue 3 & Nuxt.js |
| `python-patterns` | Python development |
| `rust-pro` | Rust systems programming |
| `mobile-design` | Mobile-first design |

### Security & Quality (5 skills)

| Skill | Description |
|-------|-------------|
| `lint-and-validate` | Linting & static analysis |
| `systematic-debugging` | Debug methodology |
| `vulnerability-scanner` | Vulnerability analysis |
| `red-team-tactics` | Red team tactics |
| `geo-fundamentals` | Generative Engine Optimization |

### Workflow & Process (6 skills)

| Skill | Description |
|-------|-------------|
| `brainstorming` | Socratic questioning protocol |
| `behavioral-modes` | AI operational modes |
| `tdd-workflow` | Test-Driven Development |
| `parallel-agents` | Multi-agent orchestration |
| `intelligent-routing` | Automatic agent selection |
| `performance-profiling` | Performance analysis |

### Design & UX (3 skills)

| Skill | Description |
|-------|-------------|
| `ui-ux-pro-max` | UI/UX design intelligence |
| `frontend-design` | Web UI design |
| `mobile-design` | Mobile app design |

### Game Development (10 skills)

| Skill | Description |
|-------|-------------|
| `game-development` | Game dev orchestrator |
| `2d-games` | 2D game development |
| `3d-games` | 3D game development |
| `web-games` | Web browser games |
| `mobile-games` | Mobile games |
| `pc-games` | PC & console games |
| `vr-ar` | VR/AR development |
| `game-design` | Game design principles |
| `game-art` | Game art & animation |
| `game-audio` | Game audio |
| `multiplayer` | Multiplayer networking |

### Utilities (5 skills)

| Skill | Description |
|-------|-------------|
| `prompt-leverage` | Input improvement |
| `plan-writing` | Task planning |
| `test-strategy` | Test design |
| `github-tools` | GitHub CLI integration |
| `i18n-localization` | Internationalization |
| `web-design-guidelines` | Web design review |
| `webapp-testing` | Web app testing |
| `seo-fundamentals` | SEO fundamentals |

## 💻 Sử Dụng

### 📌 Ví Dụ Commands

```bash
# Lập kế hoạch
/csp-plan xây dựng hệ thống e-commerce

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

# Pull request review
/csp-code-review 123 --comment
```

### 🔄 Chuyển đổi giữa chế độ

Trong OpenCode TUI:
- Chỉ cần dùng agent `cook` (mặc định)
- Ưu tiên dùng command (`/csp-*`) để chuyển ngữ cảnh task thay vì đổi agent bằng Tab

## 🔄 Cập nhật

```bash
# Cập nhật pack
./bin/update.sh

# Cập nhật cưỡng bức
./bin/update.sh -p /path/to/project
```

## 🗑️ Gỡ cài đặt

```bash
# Gỡ cài đặt
./bin/uninstall.sh

# Gỡ cài đặt khỏi project cụ thể
./bin/uninstall.sh -p /path/to/project
```

## 🏗️ Cấu trúc

```
opencode-skills-pack/
├── .opencode/
│   ├── skills/
│   │   ├── plan-writing/
│   │   ├── coding-standard/
│   │   ├── test-strategy/
│   │   └── prompt-leverage/
│   ├── agents/
│   │   └── cook.md
│   └── commands/
│       ├── csp-plan.md
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
│       ├── csp-ui-ux-pro-max.md
│       └── csp-github.md
├── bin/
│   ├── install.sh
│   ├── uninstall.sh
│   └── update.sh
├── README.md
└── CHANGELOG.md
```

## ➕ Thêm mới Skill

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

## ⚙️ Cấu hình thêm (Optional)

Tạo file `opencode.json` trong project nếu cần thay đổi quyền:

```json
{
  "agent": {
    "cook": {
      "permission": {
        "edit": "deny",
        "bash": "ask"
      }
    }
  }
}
```

## 🔧 Khắc phục sự cố

### ❌ Không thấy lệnh

Đảm bảo pack đã được cài đúng:
```bash
ls -la .opencode/commands/
```

### 👤 Agent không hiển thị

Kiểm tra agent đã được link:
```bash
ls -la .opencode/agents/
```

### 🔗 Symlink lỗi

Xóa và cài lại:
```bash
./bin/install.sh -f
```

## 🤝 Đóng góp

Mọi contribution đều được welcome! Vui lòng tạo PR với mô tả chi tiết.

## 📄 License

MIT License
