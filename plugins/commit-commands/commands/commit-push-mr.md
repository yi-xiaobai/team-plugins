---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git push:*), Bash(glab mr create:*)
description: Commit, push, and create GitLab Merge Request
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -5`

## Parameters

User may specify target branch: `/commit-push-mr [target_branch]`
- If not specified, default to `dev`
- Common values: `dev`, `master`, `main`, `release/*`

## Your task

Based on the above changes:

1. Create a single commit with an appropriate message using Conventional Commits format
2. Push the branch to origin
3. Create a GitLab Merge Request using `glab mr create` with:
   - Target branch: user specified or `dev`
   - Title: 使用 commit message 第一行作为 title，需用单引号包裹避免特殊字符解析问题
   - Assignee: 使用 `--assignee @me` 将 MR 指派给当前提交人
   - 命令格式: `glab mr create --target-branch <branch> --title '<commit_title>' --assignee @me --remove-source-branch --squash-before-merge --yes`
   - **重要**: title 必须用单引号 `'...'` 包裹，不要用双引号
4. Report the MR URL on success

## Error Handling

- **任何步骤失败都必须立即终止流程，不要继续执行后续步骤**
- **禁止使用 `--no-verify`、`--force` 等绕过检查的参数**
- 向用户报告失败原因，不要尝试自动修复或绕过

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.

## Configuration

Requires:
- `glab` CLI installed
- Run `glab auth login` to authenticate
