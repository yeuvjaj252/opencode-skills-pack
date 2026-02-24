---
description: Preview server start, stop, and status check - Local development server management
agent: cook
---

# /csp-preview - Preview Management

$ARGUMENTS

---

## Task

Manage preview server: start, stop, status check.

### Commands

```
/csp-preview           - Show current status
/csp-preview start     - Start server
/csp-preview stop      - Stop server
/csp-preview restart   - Restart
/csp-preview check     - Health check
```

---

## Usage Examples

### Start Server
```
/csp-preview start

Response:
🚀 Starting preview...
   Port: 3000
   Type: Next.js

✅ Preview ready!
   URL: http://localhost:3000
```

### Status Check
```
/csp-preview

Response:
=== Preview Status ===

🌐 URL: http://localhost:3000
📁 Project: /projects/my-app
🏷️ Type: nextjs
💚 Health: OK
```

### Port Conflict
```
/csp-preview start

Response:
⚠️ Port 3000 is in use.

Options:
1. Start on port 3001
2. Close app on 3000
3. Specify different port

Which one? (default: 1)
```

---

## Technical

Tùy thuộc vào framework của project:

```bash
# Next.js
npm run dev
npm run start

# Vite
npm run dev

# React
npm start

# Vue
npm run dev

# Custom
node server.js
```

Để kiểm tra status:
```bash
curl -f http://localhost:3000/health
lsof -i :3000
```
