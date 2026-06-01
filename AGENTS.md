# Agent Skill Dock - AI Handoff Notes

這份檔案是給之後接手本專案的 AI coding agent 看的。請先讀完本檔，再讀 `README.md`、`skills.json`、`PROJECT_PLAN.md`。

## 專案目標

Agent Skill Dock 是一個跨平台的一鍵安裝器，用來集中安裝常用 AI coding-agent skills。

目前目標支援：

- Claude Code
- Codex
- macOS
- Linux
- Windows PowerShell

核心用途：

- 讓使用者用一條指令安裝常用技能。
- 用 `skills.json` 管理技能來源與 metadata。
- 把標準 skill 從上游 GitHub repo 拉下來安裝。
- 對非標準 skill/template，用 `adapters/` 包成 agent 可以讀的 workflow skill。
- 後續逐步升級成 npm CLI，例如 `npx agent-skill-dock install --all`。

## 目前狀態

這是 bootstrap version。

已完成：

- `README.md`：使用者說明與一鍵安裝指令。
- `install.sh`：macOS/Linux 安裝器。
- `install.ps1`：Windows PowerShell 安裝器。
- `skills.json`：初始技能 manifest。
- `adapters/website-cloner-template/SKILL.md`：AI Website Cloner Template adapter skill。
- `PROJECT_PLAN.md`：完整規劃、架構與未來 roadmap。

尚未完成：

- npm package。
- TypeScript CLI。
- `list`、`doctor`、`update`、`remove` 等正式指令。
- lockfile/version pinning。
- GitHub Action 自動檢查上游技能更新。

## 初始技能

目前安裝器會安裝四個項目：

- `frontend-design`
  - 來源：`anthropics/skills`, path `skills/frontend-design`
  - 用途：高品質、非模板感的 frontend UI design/build skill。

- `vercel-react-best-practices`
  - 來源：`vercel-labs/agent-skills`, path `skills/react-best-practices`
  - 用途：React / Next.js performance best practices。

- `vercel-react-native-skills`
  - 來源：`vercel-labs/agent-skills`, path `skills/react-native-skills`
  - 用途：React Native / Expo performance and mobile best practices。

- `website-cloner-template`
  - 來源 adapter：`adapters/website-cloner-template/SKILL.md`
  - 上游 template：`JCodesMore/ai-website-cloner-template`
  - 用途：引導 agent 使用授權網站重建 template。

## 重要檔案

- `README.md`
  - 面向使用者。
  - 放一鍵安裝、支援平台、會安裝什麼、安全提醒。

- `PROJECT_PLAN.md`
  - 面向專案規劃。
  - 放完整架構、manifest 草案、CLI roadmap、後續 phase。

- `skills.json`
  - 技能來源清單。
  - 新增 skill 時，優先更新這裡。

- `install.sh`
  - macOS/Linux bootstrap installer。
  - 目前直接 clone 上游 repo，再複製 skill folder 到目標 agent 目錄。

- `install.ps1`
  - Windows PowerShell bootstrap installer。
  - 功能應盡量與 `install.sh` 保持一致。

- `adapters/`
  - 放不是標準 skill 的工具/template 包裝。
  - 每個 adapter 至少要有 `SKILL.md`。

## 安裝目標

Claude Code user scope:

```text
~/.claude/skills/<skill-name>/SKILL.md
```

Codex user scope:

```text
~/.agents/skills/<skill-name>/SKILL.md
```

Codex compatibility path:

```text
~/.codex/skills/<skill-name>/SKILL.md
```

Project scope:

```text
.claude/skills/<skill-name>/SKILL.md
.agents/skills/<skill-name>/SKILL.md
```

## 新增技能流程

新增標準 skill：

1. 確認上游 repo、branch/ref、skill folder path。
2. 確認 `SKILL.md` 的 `name` 與資料夾名是否一致。
3. 更新 `skills.json`。
4. 更新 `README.md` 的技能表格。
5. 更新 `install.sh` 與 `install.ps1` 的安裝清單。
6. 跑 dry-run 驗證。
7. 若 skill 名稱與上游資料夾不同，保留 alias 並在 `PROJECT_PLAN.md` 記錄。

新增 adapter skill：

1. 在 `adapters/<adapter-id>/SKILL.md` 建立 adapter。
2. 在 `skills.json` 加入 `type: "adapter-skill"`。
3. 更新 `README.md`。
4. 更新兩個安裝器。
5. 確認 adapter 的安全邊界與合法用途。

## 驗證指令

macOS/Linux:

```bash
bash -n install.sh
node -e "JSON.parse(require('fs').readFileSync('skills.json','utf8')); console.log('skills.json ok')"
AGENT_SKILL_DOCK_LOCAL_DIR="$PWD" bash install.sh --dry-run --agent claude
AGENT_SKILL_DOCK_LOCAL_DIR="$PWD" bash install.sh --dry-run --agent codex
```

如果有 PowerShell:

```powershell
.\install.ps1 -DryRun -Agent claude
.\install.ps1 -DryRun -Agent codex
```

## 實作守則

- 預設不要覆蓋使用者既有 skill。
- 覆蓋時要備份。
- 新增任何遠端下載行為，都要能 dry-run。
- README 裡的安裝指令必須和實際 repo URL 一致。
- macOS/Linux 與 Windows 的功能要盡量同步。
- adapter skill 要明確寫出安全邊界。
- 如果新增 npm CLI，不要移除 bootstrap scripts；保留給不想裝 npm package 的使用者。

## 下一步建議

最適合的下一個開發階段：

1. 建立 `package.json` 與 `packages/cli`。
2. 把 `skills.json` 變成唯一來源。
3. 讓 install scripts 呼叫 CLI，或讓 CLI 重用同一套 manifest parser。
4. 加入 `doctor` 指令檢查 Claude/Codex 路徑與既有技能。
5. 加入 `update` 與 lockfile，避免上游 `main` 變動不可控。
