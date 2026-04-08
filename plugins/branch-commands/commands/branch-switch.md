---
allowed-tools: Bash(git fetch:*), Bash(git branch:*), Bash(git checkout:*), Bash(git switch:*), Bash(git stash:*), Bash(git stash pop:*)
description: Smart switch between Git branches with fuzzy search
---

## Context

- Current branch: !`git branch --show-current`
- Recent branches: !`git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) %(committerdate:relative)' | head -15`
- All local branches: !`git branch`
- Remote branches: !`git branch -r | head -20`
- Uncommitted changes: !`git status --short`

## Parameters

`/branch-switch [keyword|number]`

No argument shows recent branches to select

## Your task

1. If uncommitted changes exist, ask user whether to stash before switching
2. Match user input to branch:
   - Exact match with local branch
   - Fuzzy match with local branch
   - Match with remote branch (create local tracking)
3. Switch to the matched branch
4. Restore stashed changes if any
5. Report result with branch status

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.

## Output format

```
✅ Switched to branch: <branch_name>
📊 Branch status: <ahead/behind info>
```
