---
name: test-strategy
description: Testing patterns and principles for unit, integration, and E2E testing
compatibility: opencode
---

# Test Strategy Skill

Use this skill to design effective and maintainable tests.

## Testing Pyramid

- Unit tests: many, fast, focused
- Integration tests: moderate, boundary behavior
- E2E tests: few, critical user flows

## Unit Testing Principles

- Test one unit at a time
- Mock external dependencies
- Follow Arrange → Act → Assert
- Use descriptive test names

## Integration Testing Principles

- Validate interaction between components
- Prefer realistic test data
- Ensure cleanup/isolation per test

## E2E Testing Principles

- Cover only high-value user journeys
- Use real runtime/browser when possible
- Keep E2E suite lean and stable

## Coverage Guidance

- Typical target: 70–80% overall
- Prioritize business logic, edge cases, and error handling
- Avoid wasting effort on boilerplate/generated code

## Mocking Guidance

Mock when dealing with:
- External APIs
- Databases
- File system
- Time/randomness

Avoid mocking core business logic under test.

## Verification Before Commit

- All tests pass
- Coverage is acceptable for scope
- No skipped tests without reason
- No debug leftovers (`console.log`, `debugger`)
