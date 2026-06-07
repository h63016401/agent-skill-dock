# Agent Skill Dock - AI Handoff Notes

這份檔案是給之後接手本專案的 AI coding agent 看的。請先讀完本檔，再讀 `README.md`、`skills.json`、`SKILL_CATALOG.md`、`PROJECT_PLAN.md`、`CANDIDATE_SKILLS.md`。

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
- `skills.json`：正式一鍵安裝技能 manifest。
- `SKILL_CATALOG.md`：面向使用者的技能來源、特色、適合場景與提示範例。
- `adapters/website-cloner-template/SKILL.md`：AI Website Cloner Template adapter skill。
- `PROJECT_PLAN.md`：完整規劃、架構與未來 roadmap。
- `CANDIDATE_SKILLS.md`：已查到但尚未納入一鍵安裝的候選技能。

尚未完成：

- npm package。
- TypeScript CLI。
- `list`、`doctor`、`update`、`remove` 等正式指令。
- lockfile/version pinning。
- GitHub Action 自動檢查上游技能更新。

## 初始技能

目前安裝器會安裝以下公開、免 token 的技能：

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

- `impeccable`
  - 來源：`pbakaus/impeccable`
  - 用途：增強版 frontend design、audit、polish、anti-generic UI skill。

- `design-taste-frontend`
  - 來源：`Leonxlnx/taste-skill`, path `skills/taste-skill`
  - 用途：提升前端審美、版面、字體、動效與 visual direction。

- `gpt-taste`
  - 來源：`Leonxlnx/taste-skill`, path `skills/gpt-tasteskill`
  - 用途：給 GPT/Codex 更嚴格的前端 taste 與 motion/layout 規則。

- `redesign-existing-projects`
  - 來源：`Leonxlnx/taste-skill`, path `skills/redesign-skill`
  - 用途：針對既有網站/APP 做 UI audit 與 redesign。

- `high-end-visual-design`
  - 來源：`Leonxlnx/taste-skill`, path `skills/soft-skill`
  - 用途：高級感視覺設計，包含字體、留白、卡片、陰影與動效。

- `baseline-ui`
  - 來源：`ibelick/ui-skills`, path `skills/baseline-ui`
  - 用途：UI 工程 baseline、排版比例、動效時長、可及性與 layout 檢查。

- `fixing-accessibility`
  - 來源：`ibelick/ui-skills`, path `skills/fixing-accessibility`
  - 用途：修正 ARIA、鍵盤導覽、focus、contrast、表單等 accessibility 問題。

- `fixing-metadata`
  - 來源：`ibelick/ui-skills`, path `skills/fixing-metadata`
  - 用途：修正 SEO metadata、社群分享卡片與頁面資訊。

- `fixing-motion-performance`
  - 來源：`ibelick/ui-skills`, path `skills/fixing-motion-performance`
  - 用途：修正動畫 jank、layout thrashing、scroll-linked motion、blur 效能問題。

- `better-icons`
  - 來源：`jscraik/Agent-Skills`, path `Skills/frontend-ui/better-icons`
  - 用途：圖標搜尋、選型與 SVG/icon family 一致性工作流。
  - 注意：目前只安裝 skill，不自動修改 MCP 設定。

- `design-md`
  - 來源：`google-labs-code/stitch-skills`, path `plugins/stitch-utilities/skills/design-md`
  - 用途：產生/維護 DESIGN.md 設計系統文件。
  - 注意：實際使用時通常需要 Stitch 專案或 Stitch MCP context。

- `find-skills`
  - 來源：`vercel-labs/skills`, path `skills/find-skills`
  - 用途：搜尋、評估並安裝 open agent skills 生態中的技能。

- `code-simplifier`
  - 來源：`getsentry/skills`, path `skills/code-simplifier`
  - 用途：在保留功能與行為的前提下，簡化近期修改的程式碼。

- `skill-creator`
  - 來源：`anthropics/skills`, path `skills/skill-creator`
  - 用途：建立、改善、測試、評估、benchmark 與封裝 agent skills。
  - 注意：進階 eval 流程可能需要 Python、對應 agent CLI 或 subagent 支援。

目前不預設安裝：

- `motion-ai-kit`
  - 原因：需要 Motion token / Motion+，之後應做成 optional external installer。

## 重要檔案

- `README.md`
  - 面向使用者。
  - 放一鍵安裝、支援平台、會安裝什麼、安全提醒。

- `PROJECT_PLAN.md`
  - 面向專案規劃。
  - 放完整架構、manifest 草案、CLI roadmap、後續 phase。

- `CANDIDATE_SKILLS.md`
  - 面向下一階段擴充。
  - 放已查證的線上技能來源、安裝方式、風險與建議整合順序。

- `skills.json`
  - 技能來源清單。
  - 新增正式一鍵安裝 skill 時，優先更新這裡，並同步更新兩個安裝器。

- `SKILL_CATALOG.md`
  - 面向使用者和下一位 AI agent。
  - 新增預設安裝技能時，必須補上原始來源網站、安裝來源、特色、適合使用情境與提示範例。

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

In user scope, installers should auto-detect an existing `~/.codex/skills` directory and install there as a compatibility target. Users can still pass `--codex-compat` / `-CodexCompat` explicitly.

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
- 如果改動 Codex install path，記得同時考慮官方 `~/.agents/skills` 與本機相容 `~/.codex/skills`。
- adapter skill 要明確寫出安全邊界。
- 如果新增 npm CLI，不要移除 bootstrap scripts；保留給不想裝 npm package 的使用者。

## 下一步建議

最適合的下一個開發階段：

1. 建立 `package.json` 與 `packages/cli`。
2. 把 `skills.json` 變成唯一來源。
3. 讓 install scripts 呼叫 CLI，或讓 CLI 重用同一套 manifest parser。
4. 加入 `doctor` 指令檢查 Claude/Codex 路徑與既有技能。
5. 加入 `update` 與 lockfile，避免上游 `main` 變動不可控。
