---
allowed-tools: Bash(git fetch:*), Bash(git branch:*), Bash(git push:*), Bash(git checkout:*), Bash(open:*), Bash(code:*), Bash(windsurf:*)
description: Create a new Git branch with auto-versioning
---

## Context

- Current git status: !`git status`
- Current branch: !`git branch --show-current`
- Remote branches: !`git branch -r | head -20`
- Existing feature branches: !`git branch -a | grep -E 'feat-|fix-|hotfix-' | tail -10`

## Parameters

User may specify: `/branch-create <type> <description> [base_branch] [--ide=code|windsurf]`
- `type`: `feat` (feature), `fix` (bugfix), or `hotfix` (urgent fix)
- `description`: Branch description (Chinese or English)
- `base_branch`: Default `dev`
- `--ide`: Open in IDE after creation (default: windsurf)

## Your task

1. Parse user input for branch type, description, and base branch
2. Generate branch name with auto-versioning: `{type}-{description}-v{N}`
   - Check existing branches of same type for max version number
   - Increment version by 1
   - Translate Chinese description to English kebab-case
3. Create remote branch from base branch
4. Checkout local branch tracking remote
5. Optionally open in IDE
6. Report the created branch name

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.
