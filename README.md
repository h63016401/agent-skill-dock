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
| `impeccable` | 增強版 frontend design、UI audit、polish、anti-generic 介面設計 | https://github.com/pbakaus/impeccable |
| `design-taste-frontend` | Taste Skill 主技能，提升前端審美、版面、字體、動效判斷 | https://github.com/Leonxlnx/taste-skill |
| `gpt-taste` | 給 GPT/Codex 更嚴格的前端 taste 與 motion/layout 規則 | https://github.com/Leonxlnx/taste-skill |
| `redesign-existing-projects` | 針對既有網站/APP 做 UI audit 與改版 | https://github.com/Leonxlnx/taste-skill |
| `high-end-visual-design` | 高級感視覺設計：字體、留白、卡片、陰影與動效 | https://github.com/Leonxlnx/taste-skill |
| `baseline-ui` | UI 工程 baseline：排版比例、動效時長、可及性與 layout 檢查 | https://github.com/ibelick/ui-skills |
| `fixing-accessibility` | 修正 ARIA、鍵盤導覽、focus、contrast、表單等 accessibility 問題 | https://github.com/ibelick/ui-skills |
| `fixing-metadata` | 修正 SEO metadata、社群分享卡片與頁面資訊 | https://github.com/ibelick/ui-skills |
| `fixing-motion-performance` | 修正動畫 jank、layout thrashing、scroll-linked motion、blur 效能問題 | https://github.com/ibelick/ui-skills |
| `better-icons` | 圖標搜尋、選型與 SVG/icon family 一致性工作流 | https://github.com/jscraik/Agent-Skills |
| `design-md` | 產生/維護 DESIGN.md 設計系統文件 | https://github.com/google-labs-code/stitch-skills |

`Motion AI Kit` 需要 Motion token / Motion+，目前不列入預設一鍵安裝；之後會做成選配 external installer。

每個 skill 的原始來源、特色、適合場景與提示範例請看 [SKILL_CATALOG.md](./SKILL_CATALOG.md)。

## 預設安裝位置

Claude Code:

```text
~/.claude/skills/<skill-name>/SKILL.md
```

Codex:

```text
~/.agents/skills/<skill-name>/SKILL.md
```

如果安裝器偵測到既有 `~/.codex/skills`，會自動同步安裝到相容目錄。你也可以手動指定：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash -s -- --codex-compat
```

這會寫入或確認下列相容目錄：

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
- `better-icons` 目前只安裝 skill，不會自動修改 MCP 設定；MCP/CLI 可之後用 `npx better-icons setup` 選配。
- `design-md` 可安裝但實際使用時通常需要 Stitch 專案或 Stitch MCP context。

## 專案規劃

完整規劃請看 [PROJECT_PLAN.md](./PROJECT_PLAN.md)。

給 AI coding agent 接手用的專案說明請看 [AGENTS.md](./AGENTS.md)。

完整技能介紹與用法請看 [SKILL_CATALOG.md](./SKILL_CATALOG.md)。

之後要納入的一鍵安裝候選技能請看 [CANDIDATE_SKILLS.md](./CANDIDATE_SKILLS.md)。

## License

MIT
