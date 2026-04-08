---
allowed-tools: Read, Grep
description: Lint Claude Code plugin files for official style compliance
---

## Context

- Plugin directory: !`find . -name "commands" -type d | head -5`
- Plugin files count: !`find . -path "*/commands/*.md" | wc -l`

## Parameters

`/plugin-lint [path]`

Defaults: scan all plugins/*/commands/*.md files

## Your task

Lint plugin files for compliance with official Claude Code plugin style. Check:

### 1. YAML Front Matter
- [ ] `allowed-tools` must use specific patterns (e.g., `Bash(git add:*)`) not generic `Bash`
- [ ] `description` must be present and concise

### 2. Structure
- [ ] Must have `## Context` section with `!`  syntax for dynamic values
- [ ] Must have `## Your task` section

### 3. Your task section
- [ ] Should NOT contain hardcoded bash scripts (code blocks with specific commands)
- [ ] Should describe WHAT to do, not HOW
- [ ] Must have single-message instruction: "You MUST do all... in a single message"

### 4. Common issues to flag
- Generic `allowed-tools: Bash` (too permissive)
- Hardcoded scripts in task section
- Missing single-message instruction
- Excessive detail that should be left to Claude's reasoning

## Output format

```
📋 Plugin Lint Report

**plugin-name/command.md**
| Check | Status | Issue |
|-------|--------|-------|
| allowed-tools | ✅/❌ | ... |
| Context section | ✅/❌ | ... |
| No hardcoded scripts | ✅/❌ | ... |
| Single-message | ✅/❌ | ... |

Summary: X passed, Y issues found
```

## Reference

Official style example from anthropics/claude-plugins-official:
```yaml
---
allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*)
description: Brief description
---
## Context
- Current git status: !`git status`

## Your task
1. Task one
2. Task two
You MUST do all of the above in a single message. Do not send any other text or messages besides the tool calls.
```
