---
description: Display agent and project status - Progress tracking and status board
agent: kehoach
---

# /csp-status - Show Status

$ARGUMENTS

---

## Task

Show current project và agent status.

### What It Shows

1. **Project Info**
   - Project name and path
   - Tech stack
   - Current features

2. **Agent Status Board**
   - Which agents are running
   - Which tasks are completed
   - Pending work

3. **File Statistics**
   - Files created count
   - Files modified count

4. **Preview Status**
   - Is server running
   - URL
   - Health check

---

## Example Output

```
=== Project Status ===

📁 Project: my-ecommerce
📂 Path: /projects/my-ecommerce
🏷️ Type: nextjs-ecommerce
📊 Status: active

🔧 Tech Stack:
   Framework: next.js
   Database: postgresql
   Auth: clerk
   Payment: stripe

✅ Features (5):
   • product-listing
   • cart
   • checkout
   • user-auth
   • order-history

⏳ Pending (2):
   • admin-panel
   • email-notifications

📄 Files: 73 created, 12 modified

=== Agent Status ===

✅ kehoach → Completed
✅ cook → Completed
🔄 explore → Running (60%)

=== Preview ===

🌐 URL: http://localhost:3000
💚 Health: OK
```

---

## Technical

Để hiển thị status, chạy các lệnh:
- Kiểm tra project info: `ls -la`, `cat package.json`
- Kiểm tra git status: `git status`
- Kiểm tra server: `curl -f http://localhost:3000/health`
