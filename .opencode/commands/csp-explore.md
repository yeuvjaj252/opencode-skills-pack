---
description: Explore codebase structure, dependencies, and architecture
agent: cook
---

# /csp-explore - Codebase Exploration

$ARGUMENTS

---

## Mission

Map and understand the project architecture.

## Exploration Protocol

### Phase 1: Project Overview
1. Read `README.md` to understand purpose
2. Check `package.json` / `requirements.txt` for dependencies
3. Locate entry points (`index.*`, `main.*`, `App.*`)
4. Map folder structure

### Phase 2: Architecture Discovery
1. Identify architectural patterns (MVC, Clean Architecture, etc.)
2. Map data flow through the system
3. Locate configurations (`.env*`, `*.config.*`)
4. Locate tests and coverage structure

### Phase 3: Key Files
1. Routes/API endpoints
2. Database models/schemas
3. Services/business logic
4. Shared utilities/helpers

---

## Quick Commands

```bash
# Find project structure
find . -type f -name "*.ts" | head -50

# Find entry points
find . -name "index.*" -o -name "main.*" -o -name "App.*"

# Find config files
find . -name "*.config.*" -o -name ".env*"

# Find routes/endpoints
grep -r "router\|app\.\(get\|post\|put\|delete\)" --include="*.ts"

# Find database models
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
[Brief description of how data moves through the system]

### Notes
[Important observations or warnings]
```
