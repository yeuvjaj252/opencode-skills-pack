---
name: plan-writing
description: Structured task planning with clear breakdowns, dependencies, and verification criteria
compatibility: opencode
---

# Plan Writing Skill

Khi lap ke hoach, su dung cau truc sau de dam bao day du va ro rang.

## Cau truc Ke Hoach

```
## Muc tieu
[Mo ta muc tieu cua task]

## Pham vi
- [Noi dung bao gom]
- [NOI DUNG KHONG bao gom]

## Cac buoc thuc hien

### Buoc 1: [Ten buoc]
- **Mo ta**: [Mo ta chi tiet]
- **File**: [Danh sach file]
- **Dependencies**: [Cac buoc phu thuoc]
- **Verification**: [Cach verify]

### Buoc 2: [Ten buoc]
...

## Risk va Mitigation
| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk 1] | [High/Medium/Low] | [Cach xu ly] |

## Test Strategy
- Unit test cho: [Danh sach]
- Integration test cho: [Danh sach]
- Manual test cho: [Danh sach]

## Effort Estimate
- Small (< 1 ngay)
- Medium (1-3 ngay)  
- Large (> 3 ngay)

## Rollback Plan
[Neu can rollback, can lam gi]
```

## Nguyen tac

1. **Specific**: Mo ta cu the, khong mo
2. **Measurable**: Co tieu chi verify duoc
3. **Achievable**: Co the thuc hien duoc
4. **Relevant**: Lien quan den muc tieu
5. **Time-bound**: Co khung thoi gian

## Example

Input: "Them chuc nang login"

Output:
```
## Muc tieu
Them chuc nang login voi email/password

## Pham vi
- Them trang login
- Them API login
- Them session management
- KHONG bao gom: social login, password reset

## Cac buoc thuc hien
### Buoc 1: Them trang login UI
- File: src/pages/Login.tsx
- Dependencies: none
- Verification: Trang hien thi dung

### Buoc 2: Them API login  
- File: src/api/auth.ts
- Dependencies: Buoc 1
- Verification: API tra ve token

...
```
