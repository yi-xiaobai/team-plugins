---
allowed-tools: Bash(git fetch:*), Bash(git branch:*), Bash(git branch -d:*), Bash(git branch -D:*), Bash(git push origin --delete:*)
description: Clean up merged or stale Git branches
---

## Context

- Current branch: !`git branch --show-current`
- Default branch: !`git remote show origin | grep 'HEAD branch' | cut -d: -f2`
- Local branches with last commit date: !`git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) | %(committerdate:relative)'`
- Merged branches: !`git branch --merged origin/main 2>/dev/null || git branch --merged origin/master 2>/dev/null || git branch --merged origin/dev`
- Remote branches: !`git branch -r`

## Parameters

`/branch-delete [keyword|merged]`

No argument shows cleanup options

## Your task

1. Categorize branches:
   - Safe to delete (merged into main/master/dev)
   - Stale (>30 days without activity)
   - Protected (main, master, dev, develop - never delete)
2. Present cleanup options to user
3. Ask for confirmation before deletion
4. Delete selected branches (local and optionally remote)
5. Report results

## Safety rules

- NEVER delete: main, master, dev, develop
- NEVER delete current branch
- ALWAYS confirm before deleting remote branches
- ALWAYS confirm before force delete (-D)

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.
