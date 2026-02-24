---
name: test-strategy
description: Testing patterns and principles for unit, integration, and E2E testing
compatibility: opencode
---

# Test Strategy Skill

Su dung cac nguyen tac sau de viet test hieu qua.

## Testing Pyramid

```
       /\
      /  \     E2E (it)
     /----\    Integration (vua)
    /      \   Unit (nhieu)
   /________\
```

## Unit Test

### Nguyen tac
- Test 1 function/unit
- Mock external dependencies
- AAA pattern: Arrange, Act, Assert
- Ten ro nghia: `describe('functionName', ...)`

### Example

```typescript
describe('calculateTotal', () => {
  it('tinh tong don hang dung', () => {
    // Arrange
    const items = [{ price: 100, qty: 2 }];
    
    // Act
    const result = calculateTotal(items);
    
    // Assert
    expect(result).toBe(200);
  });
  
  it('tra ve 0 khi khong co item', () => {
    expect(calculateTotal([])).toBe(0);
  });
});
```

## Integration Test

### Nguyen tac
- Test nhieu unit hoat dong cung nhau
- Test voi real database (hoac test DB)
- Cleanup sau moi test
- Define test data rõ ràng

## E2E Test

### Nguyen tac
- Test flow hoan chinh
- Use real browser/server
- Run it nhat, vi cham va ton kem
- Focus vao critical path

## Test Coverage

- Target: 70-80% coverage
- Focus vao:
  - Business logic
  - Edge cases
  - Error handling
- Khong can test:
  - Boilerplate
  - Simple getters/setters
  - Generated code

## Test Naming

Su dung format:
```
[Method]_[Scenario]_[ExpectedResult]
```

Vi du:
- `it('adds two numbers correctly')`
- `it('throws error when input is invalid')`
- `describe('when user is logged in')`

## Mocking Guidelines

### Mock khi:
- External API call
- Database operations
- File system
- Time/Date
- Random numbers

### Khong Mock khi:
- Business logic dang test
- Simple functions
- Config values

## Running Tests

```bash
# All tests
npm test

# Watch mode
npm test -- --watch

# Coverage
npm test -- --coverage

# Specific file
npm test -- path/to/test.spec.ts
```

## Verification Checklist

Truoc khi commit:
- [ ] All tests pass
- [ ] Coverage meets target
- [ ] No console.log/debugger
- [ ] No skipped tests (except temporarily)
- [ ] Test code reviewed
