---
name: coding-standard
description: Coding standards and best practices for maintaining code quality
compatibility: opencode
---

# Coding Standard Skill

Follow these standards to keep code maintainable and consistent.

## Core Principles

1. DRY — Don't Repeat Yourself
2. KISS — Keep It Simple
3. YAGNI — Avoid speculative code
4. SOLID — For object-oriented design when applicable
5. Clean Code — Meaningful names, focused functions, minimal comments

## TypeScript / JavaScript

### Naming
- Variables/functions: `camelCase`
- Classes/interfaces/types: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case` (or framework-conventional casing)

### Functions
- Prefer small, focused functions
- One responsibility per function
- Prefer `async/await` over callback chains
- Use structured error handling

## Python

- Follow PEP 8
- Use type hints on public functions
- Add docstrings for public classes/functions
- Use `snake_case` for variables/functions and `PascalCase` for classes

## Go

- Keep interfaces small and purposeful
- Handle errors explicitly and early
- Use context for request-scoped operations

## Rust

- Use idiomatic Result-based error handling
- Keep naming idiomatic (`snake_case`, `PascalCase`)
- Add unit tests with `#[test]`

## Verification Checklist

After coding:
1. Run lint
2. Run type checks
3. Run tests
4. Perform a final self-review

## Anti-Patterns to Avoid

- Magic numbers without constants
- Overly long functions
- Deep nesting instead of early returns
- Hidden global state
- Hardcoded secrets/config
