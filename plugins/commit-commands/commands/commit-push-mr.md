---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git push:*), Bash(curl *gitlab*:*), Bash(jq:*)
description: Commit, push, and create GitLab Merge Request
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Remote URL: !`git remote get-url origin`
- Recent commits: !`git log --oneline -5`

## Parameters

User may specify target branch: `/commit-push-mr [target_branch]`
- If not specified, default to `dev`
- Common values: `dev`, `master`, `main`, `release/*`

## Your task

Based on the above changes:

1. Create a single commit with an appropriate message using Conventional Commits format
2. Push the branch to origin
3. Create a GitLab Merge Request via API with:
   - Target branch: user specified or `dev`
   - Title: commit message
   - Options: remove_source_branch=true, squash=true
4. Report the MR URL on success

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.

## Configuration

Requires environment variables:
- `GITLAB_TOKEN`: GitLab Personal Access Token
- `GITLAB_HOST`: GitLab domain (e.g., gitlab.company.com)
