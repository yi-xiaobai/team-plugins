---
allowed-tools: Bash(git log:*), Bash(git branch:*), Bash(glab mr update:*), Bash(glab api:*)
description: Generate MR title and description based on git commits, then update remote MR
---

## Parameters

User may specify: `/mr-beautify [target-branch]`
- Default: `dev`

## Context

- Current branch: !`git branch --show-current`
- Commits to merge: !`git log origin/dev..HEAD --oneline --no-merges 2>/dev/null || git log dev..HEAD --oneline --no-merges`

## Your task

Based on the above commits, generate MR title and description, then update remote MR.

1. Analyze commits to determine primary change type (feat > fix > refactor > chore)
2. Generate title: `{type}: {中文概述}`
3. Generate description: 每个 commit 提炼为一条简洁的中文变更点
   - **忽略**: revert commit 以及被 revert 的原 commit（成对剔除，不计入变更点）
4. Find MR for current branch:
   ```bash
   glab api "projects/:id/merge_requests?state=opened&source_branch={current-branch}" | jq '.[0].iid'
   ```
5. Update MR:
   ```bash
   glab mr update {mr-iid} --title "{title}" --description "{description}"
   ```

## Output format

```
📝 **MR Title**

{type}: {中文概述}

📄 **MR Description**

- {变更点1}
- {变更点2}
- {变更点3}

✅ MR !{mr-iid} 已更新
```

## Error Handling

- **No commits**: 当前分支相对目标分支没有新提交
- **No MR found**: 当前分支没有关联的 MR，建议先创建 MR

You MUST do all of the above in a single message.
