---
allowed-tools: Bash(git status:*), Bash(git log:*), Bash(git reset:*), Bash(git restore:*)
description: Undo the last commit while keeping changes
---

## Context

- Current branch: !`git branch --show-current`
- Last 5 commits: !`git log --oneline -5`
- Current status: !`git status --short`

## Parameters

User may specify: `/commit-undo [mode]`
- `soft` (default): Undo commit, keep changes staged
- `mixed`: Undo commit, unstage changes
- `hard`: Undo commit AND discard changes (requires confirmation)

## Your task

1. Show what will be undone (commit hash, message, author, files)
2. Execute the appropriate reset mode:
   - Soft: `git reset --soft HEAD~1`
   - Mixed: `git reset --mixed HEAD~1`
   - Hard: Require explicit "YES" confirmation first
3. Warn if commit was already pushed (requires force push)
4. Report result and next steps

## Safety rules

- NEVER execute --hard without explicit confirmation
- ALWAYS warn if commit was pushed
- ALWAYS show what will be undone first

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.
