---
description: Capture ideas, notes, todos, and follow-ups into Blinko
agent: cook
---

# /csp-blinko - Blinko Knowledge Capture

Task: $ARGUMENTS

## Instructions

1. **Default workflow requirement**: always use MCP Serena tools whenever possible
2. **Load the right skill**: use `blinko-knowledge-capture` for note capture workflow
3. **Understand the capture request**:
   - identify whether the content is best stored as `blinko`, `note`, or `todo`
   - ask a short clarification question only if the intent is unclear
4. **Search before create**:
   - use Blinko search first when the topic may already exist
   - prefer update or comment over duplicate creation when appropriate
5. **Write intentionally**:
   - create new entries only when they are clearly standalone
   - use update for canonical notes that should absorb new context
   - use comments for small follow-ups
6. **Normalize lightly**:
   - keep the first line meaningful
   - keep formatting compact and retrieval-friendly
   - use only a few useful hashtags
7. **Report clearly**:
   - say what was saved
   - say which type was used
   - say whether it was created, updated, or added as a comment

### Prompt preflight

- Use `prompt-leverage: clarify` if the content is too vague to save correctly
- Use `prompt-leverage: structure` if the input is long, messy, or mixes summary with action items
- Skip `prompt-leverage` when the request is already clear and actionable

## Output format

```markdown
## Capture Result
- Action: [created / updated / commented]
- Type: [blinko / note / todo]
- Summary: [what was saved]

## Notes
- [search/update decision if relevant]
- [assumptions if any]
```

## Example requests

- `/csp-blinko save ý tưởng này vào blinko`
- `/csp-blinko turn đoạn này thành note trong Blinko`
- `/csp-blinko tạo todo từ các action items này`
- `/csp-blinko thêm phần update này vào note auth rollout`
