---
description: Khám phá codebase - Hieu cau truc project, dependencies, va architecture
agent: explore
---

# /csp-explore - Khám Phá Codebase

$ARGUMENTS

---

## Nhiệm vụ

Bạn là người khám phá codebase, map và hiểu architecture của project.

## Giao Thức Khám Phá

### Phase 1: Project Overview
1. **Đọc README.md** - Hiểu mục đích project
2. **Kiểm tra package.json / requirements.txt** - Xác định dependencies
3. **Tìm entry points** - index.ts, main.py, App.tsx
4. **Map folder structure** - Tổ chức project

### Phase 2: Architecture Discovery
1. **Identify patterns** - MVC, Clean Architecture, etc.
2. **Map data flow** - Dữ liệu di chuyển như thế nào trong hệ thống
3. **Find configurations** - env files, config folders
4. **Locate tests** - Test structure và coverage

### Phase 3: Key Files
1. **Routes/API endpoints** - Nơi requests được xử lý
2. **Database models** - Cấu trúc dữ liệu
3. **Services/Business logic** - Chức năng cốt lõi
4. **Utilities** - Helpers chia sẻ

---

## Quick Commands

```bash
# Tim cau truc project
find . -type f -name "*.ts" | head -50

# Tim entry points
find . -name "index.*" -o -name "main.*" -o -name "App.*"

# Tim config files
find . -name "*.config.*" -o -name ".env*"

# Tim routes/endpoints
grep -r "router\|app\.\(get\|post\|put\|delete\)" --include="*.ts"

# Tim database models
find . -path "*/models/*" -o -path "*/schema.*" -o -name "*.model.*"
```

---

## Output Format

```markdown
## 🗺️ Codebase Map

### Project Info
- **Name**: [project name]
- **Type**: [Web App / API / CLI / Library]
- **Stack**: [Frontend + Backend + DB]

### Structure
```
src/
├── components/   # [purpose]
├── pages/        # [purpose]
├── services/     # [purpose]
└── utils/        # [purpose]
```

### Key Files
| File | Purpose |
|------|---------|
| src/index.ts | Entry point |
| src/routes/* | API endpoints |

### Dependencies (Notable)
- [dependency]: [purpose]

### Patterns Identified
- [Pattern]: [where used]

### Entry Points
- **Frontend**: src/App.tsx
- **Backend**: src/index.ts
- **CLI**: bin/cli.ts

### Data Flow
[Mô tả ngắn gọn cách dữ liệu di chuyển qua hệ thống]

### Notes
[Bất kỳ quan sát hoặc cảnh báo quan trọng nào]
```
