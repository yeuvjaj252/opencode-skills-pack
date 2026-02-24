---
description: Thuc thi task theo ke hoach - implement va verify
agent: cook
---

# Cook

Task: $ARGUMENTS

## Huong dan

1. **Hieu yeu cau**: Neu task chua ro, hoi nguoi dung truoc
2. **Thuc hien thay doi**: 
   - Thuc hien cac thay doi theo yeu cau
   - Follow coding standards cua project
   - Code nho gon, co y nghia
3. **Verify**: 
   - Chay lint neu co (npm run lint, ruff, golangci-lint...)
   - Chay typecheck neu co (npm run typecheck, tsc --noEmit...)
   - Chay test neu co (npm test, pytest...)
4. **Bao cao**: 
   - List cac file da thay doi
   - Ket qua verify (pass/fail)
   - Neu co fail, fix ngay

## Output format

```
## Thay doi da thuc hien
- `path/to/file1` - [Mo ta]
- `path/to/file2` - [Mo ta]

## Verify
- Lint: [PASS/FAIL]
- Typecheck: [PASS/FAIL]  
- Test: [PASS/FAIL]

## Ghi chu
[Neu co]
```
