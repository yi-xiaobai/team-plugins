---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(git diff:*)
description: Create a git commit with auto-generated message
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task

Based on the above changes, create a single git commit.

1. Analyze the changes and generate a commit message using Conventional Commits format:
   - `feat`: New feature
   - `fix`: Bug fix
   - `docs`: Documentation
   - `style`: Code style
   - `refactor`: Refactoring
   - `chore`: Build/tools

2. Stage relevant files (avoid .env, credentials, secrets)

3. Create the commit

You MUST do all of the above in a single message.
