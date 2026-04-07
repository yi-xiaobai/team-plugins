---
allowed-tools: Bash(git:*), Bash(pnpm:*), Bash(glab mr create:*)
description: 升级 @master/turtle 包版本
---

## Context

- Current branch: !`git branch --show-current`
- Current turtle version: !`grep '"@master/turtle"' package.json | head -1`

## Parameters

`/turtle-upgrade [版本号] [--from dev|master] [--to dev|master]`

默认：版本号=latest，from=dev，to=dev

## Task

1. **切换分支**: `git fetch && git checkout <from> && git pull`
2. **创建分支**: `git checkout -b chore_upgrade_turtle_<版本号>`
3. **升级**: `pnpm update @master/turtle@<版本号|latest>`
4. **提交推送**: `git add package.json pnpm-lock.yaml && git commit -m "chore: upgrade @master/turtle to <版本号>" && git push origin <分支名>`
5. **创建MR**: `glab mr create --target-branch <to> --fill --assignee @me --remove-source-branch --yes`
6. **输出MR URL**

## Error Handling

- 禁止 `--no-verify`、`--force`
- 失败立即终止并报告原因
