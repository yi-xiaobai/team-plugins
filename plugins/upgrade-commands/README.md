# Upgrade Commands

依赖升级相关命令，自动化升级流程并创建 MR。

## 命令列表

| 命令 | 描述 |
|------|------|
| `/turtle-upgrade` | 升级 @master/turtle 包版本 |

## 使用示例

### 升级 turtle 到指定版本

```
/turtle-upgrade 2.1.0
```

从 dev 分支创建 `chore_upgrade_turtle_2.1.0` 分支，升级包，提交并创建 MR 到 dev。

### 从 master 分支升级

```
/turtle-upgrade 2.1.0 --from master
```

### 升级并 MR 到 master

```
/turtle-upgrade 2.1.0 --from master --to master
```

## 前置条件

- `glab` CLI 已安装并认证
- `pnpm` 包管理器
