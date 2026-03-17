# plugin-linter

检查 Claude Code 插件是否符合官方规范。

## 命令

| 命令 | 描述 |
|------|------|
| `/plugin-lint` | 检查所有插件文件的规范合规性 |
| `/plugin-lint path/to/file.md` | 检查单个插件文件 |

## 检查项

1. **YAML Front Matter**
   - `allowed-tools` 必须精确指定命令模式
   - `description` 必须存在且简洁

2. **结构**
   - 必须有 `## Context` 部分
   - 必须有 `## Your task` 部分

3. **Your task 部分**
   - 不应包含硬编码脚本
   - 描述"做什么"而非"怎么做"
   - 必须有单次响应指令

## 参考

官方规范：https://github.com/anthropics/claude-plugins-official
