---
description: Phoi hop nhieu agent cho task phuc tap - Use cho multi-perspective analysis, comprehensive reviews, hoac tasks can nhieu domain expertise
agent: csp-plan
subtask: true
---

# /csp-orchestrate - Phối Hợp Nhiều Agent

$ARGUMENTS

---

## QUAN TRỌNG: Yêu Cầu Tối Thiểu

> **ORCHESTRATION = TỐI THIỂU 3 AGENT KHÁC NHAU**
> 
> Nếu dùng ít hơn 3 agent, bạn KHÔNG phải đang orchestrate - chỉ đang delegate.
> 
> **Validation trước khi hoàn thành:**
> - Đếm số agent đã gọi
> - Nếu `agent_count < 3` → DỪNG và gọi thêm agent
> - 1 agent = THẤT BẠI của orchestration

### Ma Trận Chọn Agent

| Task Type | Agent Yêu Cầu (tối thiểu) |
|-----------|---------------------------|
| **Web App** | frontend-specialist, backend-specialist, test-engineer |
| **API** | backend-specialist, security-auditor, test-engineer |
| **UI/Design** | frontend-specialist, seo-specialist, performance-optimizer |
| **Database** | database-architect, backend-specialist, security-auditor |
| **Full Stack** | csp-plan, frontend-specialist, backend-specialist |
| **Debug** | explorer (tim hiểu), cook (fix) |
| **Security** | security-auditor, devops |

---

## 2-PHASE STRICT ORCHESTRATION

### PHASE 1: PLANNING (Sequential - KHÔNG parallel agents)

| Step | Agent | Action |
|------|-------|--------|
| 1 | `csp-plan` | Tạo docs/PLAN.md |
| 2 | `explore` | Khảo sát codebase nếu cần |

> **KHÔNG CÓ AGENT KHÁC trong giai đoạn planning!**

### ⏸️ CHECKPOINT: Chờ User Approval

```
Sau khi PLAN.md hoàn thành, HỎI:

"✅ Plan created: docs/PLAN.md

Bạn có approve? (Y/N)
- Y: Bắt đầu implementation
- N: Tôi sẽ revise plan"
```

> **KHÔNG tiến tới Phase 2 nếu KHÔNG có user approval rõ ràng!**

### PHASE 2: IMPLEMENTATION (Parallel agents sau khi approve)

| Nhóm | Agents |
|------|--------|
| Foundation | `cook` (backend), `cook` (frontend) |
| Core | Xử lý task chính |
| Polish | Verify với lint/test |

---

## Available Agents Trong OpenCode

| Agent | Domain | Use When |
|-------|--------|----------|
| `csp-plan` | Planning | Task breakdown, PLAN.md |
| `explore` | Discovery | Codebase mapping |
| `cook` | Implementation | Build, fix, refactor |

---

## Orchestration Protocol

### Bước 1: Phân Tích Task Domains
Xác định TẤT CẢ domains mà task này ảnh hưởng:
```
□ Security     → Thêm kiểm tra security
□ Backend/API  → Backend specialist
□ Frontend/UI  → Frontend specialist
□ Database     → Database design
□ Testing      → Viết test
□ DevOps       → Deploy/CI/CD
```

### Bước 2: Phase Detection

| Nếu Plan Tồn Tại | Action |
|------------------|--------|
| KHÔNG có `docs/PLAN.md` | → Đi PHASE 1 (planning only) |
| CÓ `docs/PLAN.md` + user approved | → Đi PHASE 2 (implementation) |

### Bước 3: Thực Thi Theo Phase

**PHASE 1 (Planning):**
```
Sử dụng agent csp-plan để tạo PLAN.md
→ DỪNG sau khi plan được tạo
→ HỎI user cho approval
```

**PHASE 2 (Implementation - sau khi approve):**
```
Sử dụng agent cook để thực hiện task:
- Với context từ plan đã approve
- Follow coding standards
- Chạy verify (lint/typecheck/test)
```

### Bước 4: Verification (BẮT BUỘC)
Chạy scripts verify phù hợp:
```bash
npm run lint
npm run typecheck
npm test
```

---

## Output Format

```markdown
## Orchestration Report

### Task
[Original task summary]

### Mode
[Current OpenCode mode: plan/build]

### Agents Invoked (TỐI THIỂU 3)
| # | Agent | Focus Area | Status |
|---|-------|------------|--------|
| 1 | csp-plan | Task breakdown | ✅ |
| 2 | explore | Codebase discovery | ✅ |
| 3 | cook | Implementation | ✅ |

### Verification Executed
- [x] Lint → Pass/Fail
- [x] Typecheck → Pass/Fail
- [x] Test → Pass/Fail

### Key Findings
1. **[Agent 1]**: Finding
2. **[Agent 2]**: Finding
3. **[Agent 3]**: Finding

### Deliverables
- [ ] PLAN.md created
- [ ] Code implemented
- [ ] Tests passing
- [ ] Verified

### Summary
[One paragraph synthesis of all agent work]
```

---

## EXIT GATE

Trước khi hoàn thành orchestration, verify:

1. ✅ **Agent Count:** `invoked_agents >= 3`
2. ✅ **Scripts Executed:** Đã chạy lint/test
3. ✅ **Report Generated:** Orchestration Report với tất cả agents được liệt kê

> **Nếu bất kỳ check nào fail → KHÔNG đánh dấu orchestration complete. Gọi thêm agents hoặc chạy scripts.**
