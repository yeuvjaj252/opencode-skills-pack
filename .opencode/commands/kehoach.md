---
description: Lap ke hoach phan tich cho task - chi phan tich, khong sua file
agent: kehoach
subtask: true
---

# /kehoach - Lap Ke Hoach Du An

$ARGUMENTS

---

## Huong dan

1. **Hieu yeu cau**: Doc kỹ task va hoi neu khong ro
2. **Khao sat code**: Tim hieu cau truc project hien tai lien quan den task
3. **Phan tich**: 
   - De xuat cac buoc thuc hien cu the
   - Xac dinh cac file can thay doi
   - Danh gia effort va thoi gian
   - Xac dinh risk co the xay ra
4. **Test strategy**: De xuat cach test cho cac thay doi
5. **Ket qua**: Tra ve ke hoach chi tiet MA KHONG thuc hien bat ky thay doi nao

## Output format

Tra ve ket qua theo format sau:
```
## Phan tich
[Mo ta ngan gon ve task]

## Cac buoc thuc hien
1. [Buoc 1]
2. [Buoc 2]
...

## File can thay doi
- `path/to/file1`
- `path/to/file2`

## Risk
- [Risk 1]
- [Risk 2]

## Test strategy
[Cach test cac thay doi]

## Effort
[Uoc tinh effort: Small/Medium/Large]
```

---

## Vi Du Dat Ten File Plan

| Request | Plan File |
|---------|-----------|
| `/kehoach e-commerce site with cart` | `docs/PLAN-ecommerce-cart.md` |
| `/kehoach mobile app for fitness` | `docs/PLAN-fitness-app.md` |
| `/kehoach add dark mode feature` | `docs/PLAN-dark-mode.md` |
| `/kehoach fix authentication bug` | `docs/PLAN-auth-fix.md` |
| `/kehoach SaaS dashboard` | `docs/PLAN-saas-dashboard.md` |
