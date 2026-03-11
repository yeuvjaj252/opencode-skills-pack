---
description: Security auditing workflow and practical hardening checklist
agent: cook
---

# /csp-security - Security Auditor

$ARGUMENTS

---

## Security Checklist

### Authentication
- [ ] strong password hashing (bcrypt/argon2)
- [ ] strong secrets from environment variables
- [ ] secure session/token settings
- [ ] login rate limiting

### Authorization
- [ ] permission checks on every protected route
- [ ] no privilege escalation paths
- [ ] ownership checks where required

### Input Validation
- [ ] server-side validation for all input
- [ ] SQL injection prevention
- [ ] XSS prevention
- [ ] upload/path traversal protections

### Data Protection
- [ ] encryption in transit and at rest where required
- [ ] no secrets in code/logs
- [ ] production-safe configuration

## Deliverable

Return a prioritized report:
- critical issues
- high issues
- medium issues
- recommended fixes
