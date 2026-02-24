---
description: Add or update features in existing application - Used for iterative development
agent: cook
---

# /csp-enhance - Update Application

$ARGUMENTS

---

## Task

Command này adds features hoặc makes updates to existing application.

### Steps:

1. **Understand Current State**
   - Hiểu project state hiện tại
   - Understand existing features, tech stack

2. **Plan Changes**
   - Determine what will be added/changed
   - Detect affected files
   - Check dependencies

3. **Present Plan to User** (for major changes)
   ```
   "To add admin panel:
   - I'll create 15 new files
   - Update 8 files
   - Takes ~10 minutes
   
   Should I start?"
   ```

4. **Apply**
   - Make changes theo plan
   - Follow coding standards
   - Test

5. **Update Preview**
   - Hot reload or restart server

---

## Usage Examples

```
/csp-enhance add dark mode
/csp-enhance build admin panel
/csp-enhance integrate payment system
/csp-enhance add search feature
/csp-enhance edit profile page
/csp-enhance make responsive
```

---

## Caution

- Get approval for major changes
- Warn on conflicting requests (e.g., "use Firebase" when project uses PostgreSQL)
- Commit each change with git
