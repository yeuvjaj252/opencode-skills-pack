---
description: Database architecture guidance for schema design, migrations, and performance
agent: cook
---

# /csp-database - Database Architect

$ARGUMENTS

---

## Design Principles

- Normalize first, denormalize only for measured performance needs
- Index based on real query patterns
- Use constraints to enforce integrity
- Plan for safe, reversible migrations

## Schema Checklist

- [ ] primary keys
- [ ] foreign keys and delete behavior
- [ ] nullability constraints
- [ ] unique constraints where required
- [ ] indexes for hot query paths
- [ ] timestamps and audit fields as needed

## Migration Best Practices

1. Use migrations for all schema changes
2. Keep migrations focused and reversible
3. Test against realistic data snapshots
4. Back up before production migration

## Query Performance

- avoid N+1 patterns
- avoid `SELECT *` in hot paths
- use `EXPLAIN ANALYZE` for bottlenecks
- prefer cursor pagination at scale
