---
description: Update-first Blinko capture for notes, ideas, and todos
agent: cook
---

# /csp-blinko - Blinko Knowledge Capture

Task: $ARGUMENTS

## Instructions

1. Default workflow requirement: always use MCP Serena tools whenever possible
2. Load `blinko-knowledge-capture`
3. If the user did not provide a hashtag, ask for it before saving
4. Default flow: search existing note by hashtag, then update it
5. Only create a new note when no relevant note exists or the user explicitly asked for a new one
6. Use `blinko` only for short ideas, `todo` only for explicit action items, otherwise default to `note`
7. Summarize the current session clearly and save it in a compact, retrieval-friendly format
8. Report what was updated or created, which hashtag was used, and which type was used
9. After finishing the Blinko save, run `/compact` if that command is available in the current environment

## Output format

```markdown
## Capture Result
- Action: [created / updated]
- Type: [blinko / note / todo]
- Hashtag: [#tag]
- Summary: [what was saved]

## Notes
- [search/update decision if relevant]
- [whether `/compact` was triggered]
```
