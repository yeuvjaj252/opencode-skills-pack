---
description: Production deployment workflow with pre-flight checks and verification
agent: cook
---

# /csp-deploy - Deployment

$ARGUMENTS

---

## Purpose

Handle production deployment safely with clear validation and rollback awareness.

## Workflow

1. pre-flight checks (config, secrets, environment)
2. build and deploy
3. post-deploy verification
4. rollback plan if checks fail

## Checklist

- [ ] build passes
- [ ] required env vars configured
- [ ] health checks pass
- [ ] rollback path documented
