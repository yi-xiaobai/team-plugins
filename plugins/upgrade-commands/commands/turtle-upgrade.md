---
allowed-tools: Bash(git fetch:*), Bash(git branch:*), Bash(git checkout:*), Bash(git pull:*), Bash(git add:*), Bash(git commit:*), Bash(git push:*), Bash(pnpm update:*), Bash(glab mr create:*)
description: 升级 @master/turtle 包版本
---

## Context

- Current git status: !`git status`
- Current branch: !`git branch --show-current`
- Current turtle version: !`grep '"@master/turtle"' package.json | head -1`

## Parameters

User may specify: `/turtle-upgrade [version] [--from dev|master] [--to dev|master]`
- `version`: Target version to upgrade to (default: `latest`)
- `--from`: Source branch to base off (default: `dev`)
- `--to`: MR target branch (default: `dev`)

## Your task

1. Fetch latest and checkout source branch: `git fetch && git checkout <from> && git pull`
2. Create upgrade branch: `git checkout -b chore_upgrade_turtle_<version>`
3. Run upgrade: `pnpm update @master/turtle@<version|latest>`
4. Stage and commit: `git add package.json pnpm-lock.yaml && git commit -m "chore: upgrade @master/turtle to <version>"`
5. Push to remote: `git push origin <branch_name>`
6. Create MR: `glab mr create --target-branch <to> --fill --assignee @me --remove-source-branch --yes`
7. Report the MR URL

You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.

## Error Handling

- NEVER use `--no-verify` or `--force`
- Stop immediately on failure and report the reason
