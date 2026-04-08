---
allowed-tools: Bash(git log:*), Bash(git branch:*), Bash(glab mr update:*), Bash(glab mr view:*)
description: Generate MR title and description based on git commits, then update remote MR
---

## Parameters

`/mr-beautify [target-branch]`

Defaults: target-branch=dev

## Context

- Current branch: !`git branch --show-current`
- Commits to merge: !`git log --oneline --no-merges origin/$1..HEAD 2>/dev/null || git log --oneline --no-merges $1..HEAD`

## Your task

Generate MR title and description based ONLY on the "Commits to merge" shown above, then update remote MR.

**IMPORTANT**: Use ONLY the commits listed in Context section. Do NOT run additional git log commands.

1. Analyze commits to determine primary change type (feat > fix > refactor > chore)
2. Generate title based ONLY on the commit messages: `{type}: {summary}`
3. Generate description based ONLY on the commit messages: extract each commit into a concise change point
   - **Ignore**: revert commits and their original commits (exclude pairs)
4. Find MR for current branch and update it:
   - Use `glab mr view` to check if MR exists
   - Use `glab mr update` to update title and description

## Error Handling

- **No commits**: no new commits relative to target branch
- **No MR found**: suggest creating MR first

You MUST do all of the above in a single message.
