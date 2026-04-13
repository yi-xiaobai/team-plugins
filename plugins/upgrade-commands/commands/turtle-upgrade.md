---
allowed-tools: Bash(git:*), Bash(pnpm:*), Bash(glab:*), Edit
description: Upgrade @master/turtle package version
---

## Context

- Current branch: !`git branch --show-current`
- Current turtle version: !`grep '"@master/turtle"' package.json | head -1`

## Parameters

`/turtle-upgrade [version] [--branch dev|master]`

Defaults: version=latest, branch=dev

## Task

1. Create branch `chore_upgrade_turtle_<version>` from `<branch>`
2. Update `@master/turtle` version in package.json, run `pnpm i`
3. Commit, push, create MR to `<branch>` with:
   - Assignee: current user (`--assignee @me`)
   - Delete source branch after merge (`--remove-source-branch`)
   - Squash commits (`--squash-before-merge`)
4. Report MR URL

You MUST do all of the above in a single message.
