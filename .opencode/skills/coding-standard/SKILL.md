---
name: coding-standard
description: Coding standards and best practices for maintaining code quality
compatibility: opencode
---

# Coding Standard Skill

Follow cac nguyen tac coding standard sau de dam bao code chat luong cao.

## Nguyen tac Chung

1. **DRY** - Don't Repeat Yourself
2. **KISS** - Keep It Simple, Stupid
3. **YAGNI** - You Aren't Gonna Need It
4. **SOLID** - Cho OOP
5. **Clean Code** - Ten bien ro nghia, ham nho gon, comment khi can thiet

## TypeScript/JavaScript

### Naming
- Bien/ham: camelCase (`userName`, `getData`)
- Class/interface: PascalCase (`UserService`, `IUser`)
- Constant: UPPER_SNAKE_CASE
- File: kebab-case hoac PascalCase tuy loai

### Functions
- Ham nho hon 20 dong
- Chi lam 1 viec
- Dung async/await thay vi callback
- Dung try-catch cho async

### Example

```typescript
// TOT
async function getUserById(id: string): Promise<User | null> {
  try {
    return await db.users.findOne({ id });
  } catch (error) {
    logger.error('getUserById', error);
    return null;
  }

// SAI
function getUser(id) {
  // 50 dong code, vua query vua validate vua transform
}
```

## Python

### Naming
- Function/variable: snake_case (`get_user`, `user_list`)
- Class: PascalCase (`UserService`)
- Constant: UPPER_SNAKE_CASE

### Style
- Follow PEP 8
- Type hints cho function
- Docstring cho class/function public

## Go

### Naming
- CamelCase cho bien/ham
- PascalCase cho export
- Ten file: snake_case

### Style
- Error handling ngay lap tuc
- Context cho async operations
- Interface nho, ro

## Rust

### Naming
- snake_case cho bien/ham
- PascalCase cho struct/enum
- Tên file: snake_case

### Style
- Use Result cho error handling
- Follow Rust idiom
- Write tests with #[test]

## Verification

Sau khi code, tu dong:
1. Chay lint (eslint, ruff, golangci-lint, clippy)
2. Chay typecheck (tsc --noEmit, mypy)
3. Chay test
4. Review code lan cuoi

## Anti-patterns

Tranh cac:
- Magic numbers -> Dung constant
- Long functions -> Tach thanh function nho
- Deep nesting -> Early return
- Global state -> Dependency injection
- Hardcoding -> Config/ENV
