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

User may specify: `/branch-switch [keyword|number]`
- No argument: Show recent branches to select
- Keyword: Fuzzy match branch names (e.g., "login" → feat-user-login-v3)
- Number: Switch to branch #N from recent list

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
✅ 已切换到分支: <branch_name>
📊 分支状态: <ahead/behind info>
```
