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

Lint plugin files for compliance with official style. Check:

### 1. YAML Front Matter
- [ ] `allowed-tools` must use specific patterns (e.g., `Bash(git add:*)`) not generic `Bash`
- [ ] `description` must be present, concise, and in **English**

### 2. Language
- [ ] All content must be in **English** (no Chinese characters in command files)

### 3. Parameters Section
- [ ] Must follow simplified format:
  ```
  ## Parameters
  
  `/command [args]`
  
  Defaults: key=value, key2=value2
  ```
- [ ] NO bullet list explanations for each parameter
- [ ] NO "User may specify:" prefix

### 4. Structure
- [ ] Must have `## Context` section with `!` syntax for dynamic values
- [ ] Must have `## Your task` or `## Task` section
- [ ] Must end with: "You MUST do all of the above in a single message."

### 5. Task Section
- [ ] Describe WHAT to do, not HOW (no hardcoded bash scripts)
- [ ] Keep it concise, let Claude reason about implementation

## Output format

```
📋 Plugin Lint Report

**plugin-name/command.md**
| Check | Status | Issue |
|-------|--------|-------|
| English only | ✅/❌ | ... |
| Parameters format | ✅/❌ | ... |
| allowed-tools | ✅/❌ | ... |
| Context section | ✅/❌ | ... |
| Single-message | ✅/❌ | ... |

Summary: X passed, Y issues found
```

## Reference

```markdown
---
allowed-tools: Bash(git:*), Bash(pnpm:*), Edit
description: Brief English description
---

## Context

- Current branch: !`git branch --show-current`

## Parameters

`/command [arg1] [--flag]`

Defaults: arg1=default, flag=false

## Task

1. Step one
2. Step two
3. Report result

You MUST do all of the above in a single message.
```
