---
allowed-tools: Bash(git log:*), Bash(git branch:*), Bash(git merge-base:*)
description: Generate MR title and description based on git commits
---

## Parameters

User may specify: `/mr-title [target-branch]`
- Default: `dev`

## Context

- Current branch: !`git branch --show-current`
- Commits to merge: !`git log origin/dev..HEAD --oneline --no-merges 2>/dev/null || git log dev..HEAD --oneline --no-merges`

## Your task

Based on the above commits, generate MR title and description.

1. Analyze commits to determine primary change type (feat > fix > refactor > chore)
2. Generate title: `{type}: {中文概述}`
3. Generate description: 每个 commit 提炼为一条简洁的中文变更点

## Output format

```
📝 **MR Title**

{type}: {中文概述}

📄 **MR Description**

- {变更点1}
- {变更点2}
- {变更点3}
```

## Error Handling

- **No commits**: 当前分支相对目标分支没有新提交
- **Branch not found**: 建议检查分支名或 `git fetch`

You MUST do all of the above in a single message.
