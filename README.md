# Agent Skill Dock

一鍵安裝常用 AI coding-agent skills，集中管理 Claude Code、Codex 會用到的前端設計、React/Next.js、React Native/Expo 與網站重建工作流。

> Status: bootstrap version. 目前先提供 GitHub raw script 一鍵安裝；之後會補上 npm CLI：`npx agent-skill-dock install --all`。

## 一鍵安裝

### macOS / Linux

安裝到 Claude Code 與 Codex 的個人技能目錄：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash
```

先預覽會寫入哪些位置：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash -s -- --dry-run
```

只安裝到 Claude Code：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash -s -- --agent claude
```

只安裝到 Codex：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash -s -- --agent codex
```

### Windows PowerShell

安裝到 Claude Code 與 Codex 的個人技能目錄：

```powershell
irm https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.ps1 | iex
```

如果要帶參數，建議先下載再執行：

```powershell
irm https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.ps1 -OutFile install.ps1
.\install.ps1 -DryRun
.\install.ps1 -Agent claude
.\install.ps1 -Agent codex
```

## 會安裝什麼

| Skill | 用途 | 來源 |
| --- | --- | --- |
| `frontend-design` | 建立有明確美學方向、可上線的 web UI | https://github.com/anthropics/skills |
| `vercel-react-best-practices` | React / Next.js 效能與架構最佳實踐 | https://github.com/vercel-labs/agent-skills |
| `vercel-react-native-skills` | React Native / Expo 效能、動畫、列表與平台最佳實踐 | https://github.com/vercel-labs/agent-skills |
| `website-cloner-template` | 使用 AI Website Cloner Template 的 adapter workflow | https://github.com/JCodesMore/ai-website-cloner-template |

## 預設安裝位置

Claude Code:

```text
~/.claude/skills/<skill-name>/SKILL.md
```

Codex:

```text
~/.agents/skills/<skill-name>/SKILL.md
```

如果你需要相容舊的 Codex 本機資料夾，也可以在 macOS/Linux 加上：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash -s -- --codex-compat
```

這會額外寫入：

```text
~/.codex/skills/<skill-name>/SKILL.md
```

## 常用參數

macOS/Linux:

```bash
bash install.sh --dry-run
bash install.sh --agent claude
bash install.sh --agent codex
bash install.sh --scope project
bash install.sh --force
bash install.sh --codex-compat
```

Windows PowerShell:

```powershell
.\install.ps1 -DryRun
.\install.ps1 -Agent claude
.\install.ps1 -Agent codex
.\install.ps1 -Scope project
.\install.ps1 -Force
.\install.ps1 -CodexCompat
```

## 之後的 npm CLI 規劃

正式發布 npm package 後，會支援：

```bash
npx agent-skill-dock list
npx agent-skill-dock install --all
npx agent-skill-dock install frontend-design
npx agent-skill-dock install vercel-react-best-practices --agent codex
npx agent-skill-dock doctor
```

## 安全提醒

- 預設不覆蓋既有 skill；如果要覆蓋，請加 `--force` 或 `-Force`。
- 使用 `--dry-run` / `-DryRun` 可以先看會寫入哪些位置。
- `website-cloner-template` 只應用於你擁有、被授權、或合法學習研究的網站，不應用於 phishing、冒充品牌、侵犯版權或違反網站服務條款的用途。

## 專案規劃

完整規劃請看 [PROJECT_PLAN.md](./PROJECT_PLAN.md)。

給 AI coding agent 接手用的專案說明請看 [AGENTS.md](./AGENTS.md)。

## License

MIT
