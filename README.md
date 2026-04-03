# Team Claude Code Plugins

团队 Git 工作流插件集合。

## 插件列表

| 插件 | 命令 | 说明 |
|------|------|------|
| **branch-commands** | `/branch-create`, `/branch-switch`, `/branch-delete` | Git 分支工作流 |
| **commit-commands** | `/commit`, `/commit-push`, `/commit-push-mr`, `/commit-undo` | Git 提交工作流 |
| **mr-commands** | `/mr-beautify`, `/mr-list` | GitLab MR 工作流 |
| **deploy-commands** | `/build`, `/publish`, `/release` | 通用构建发布 |
| **plugin-linter** | `/plugin-lint` | 插件规范检查 |

> **个人效率工具**：`/log` (work-log) · `/trending` (github-trending)

## 快速开始

```bash
# 1. 安装 glab CLI（MR 功能需要）
brew install glab && glab auth login

# 2. 添加 Marketplace 并安装
/plugin marketplace add ./team-plugins
/plugin install branch-commands commit-commands mr-commands deploy-commands plugin-linter@team-plugins
```

## 常用命令

```bash
/branch-create feat              # 创建功能分支
/commit-push-mr                  # 提交、推送并创建 MR
/mr-beautify                     # 生成并更新 MR title/description
/mr-list                         # 查看 MR 列表
```

更多命令说明见各插件的 README.md。
