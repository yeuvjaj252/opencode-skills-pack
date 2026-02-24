---
description: Database architect - schema design, migrations, optimization
agent: kehoach
---

# /csp-database - Database Architect

$ARGUMENTS

---

## Database Design Principles

- **Normalize first, denormalize for performance**: Bắt đầu với 3NF
- **Index strategically**: Dựa trên query patterns, không phải giả định
- **Use constraints**: Để database enforce data integrity
- **Plan for migrations**: Schema sẽ evolve

---

## Schema Design Checklist

- [ ] Primary keys defined (ưu tiên UUID hoặc ULID cho distributed)
- [ ] Foreign keys với proper ON DELETE behavior
- [ ] NOT NULL constraints where appropriate
- [ ] Unique constraints cho natural keys
- [ ] Check constraints cho valid values
- [ ] Indexes trên frequently queried columns
- [ ] Created/updated timestamps

---

## Database Selection Guide

| Need | Recommendation |
|------|---------------|
| Full SQL features | PostgreSQL |
| Serverless PostgreSQL | Neon, Supabase |
| Edge/Low latency | Turso (SQLite) |
| Document storage | MongoDB |
| Caching | Redis, Upstash |
| Vector/AI | PostgreSQL + pgvector |
| Time series | TimescaleDB |

---

## ORM Selection Guide

| Scenario | Node.js | Python |
|----------|---------|--------|
| Type-safe, edge-ready | Drizzle | - |
| Full-featured | Prisma | SQLAlchemy |
| Lightweight | Kysely | Tortoise |

---

## Index Strategy

### Khi Nào Index
- Columns trong WHERE clauses
- Columns trong JOIN conditions
- Columns trong ORDER BY
- Foreign key columns

### Khi Nào KHÔNG Index
- Small tables (< 1000 rows)
- Columns với low cardinality
- Frequently updated columns
- Columns rarely queried

---

## Migration Best Practices

1. **Always use migrations** - Đừng modify schema manually trong production
2. **Make migrations reversible** - Include down/rollback
3. **Small, focused changes** - One logical change per migration
4. **Test migrations** - Run on copy of production data
5. **Backup before migrating** - Luôn luôn

---

## Query Optimization

### Common Issues
- **N+1 queries**: Dùng JOINs hoặc includes
- **Missing indexes**: Check EXPLAIN ANALYZE
- **SELECT ***: Chỉ select needed columns
- **Large offsets**: Dùng cursor pagination

### EXPLAIN ANALYZE
```sql
EXPLAIN ANALYZE
SELECT * FROM orders
WHERE user_id = 123
ORDER BY created_at DESC
LIMIT 10;
```

Look for:
- Seq Scan on large tables → Add index
- High cost numbers → Optimize query
- Nested loops with many rows → Consider JOIN strategy
