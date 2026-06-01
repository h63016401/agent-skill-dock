# Agent Skill Dock

> GitHub repo slug: `agent-skill-dock`

Agent Skill Dock 是一個給 AI coding agent 使用的技能集合與一鍵安裝器。目標是把常用的 Claude/Codex 技能、規則與專案模板集中管理，讓 macOS、Linux、Windows 使用者都能用同一套入口安裝到 Claude Code、Codex，之後也能擴充到其他 agent。

資料初查日期：2026-06-02，Asia/Taipei。

## 專案定位

這個專案不是單純的技能清單，而是「可安裝的個人 AI 工作流包」。

核心價值：

- 一條指令安裝常用 AI skills。
- 同時支援 Claude Code 與 Codex 的技能目錄。
- 支援 macOS、Linux、Windows。
- 用 manifest 管理技能來源，之後新增技能不需要重寫安裝器。
- 每個技能都有簡短介紹、使用時機、來源、授權與安裝狀態。
- 對不是標準 skill 的工具或 template，用 adapter 包成可被 agent 使用的技能。

## 專案名稱

主推名稱：**Agent Skill Dock**

命名理由：

- `Agent` 表示目標是 AI coding agents。
- `Skill` 直接對應 Claude/Codex skill。
- `Dock` 有集中停靠、收納、快速啟用的感覺，適合之後持續加入更多工具。

備用名稱：

- `Skillport`
- `Agent Skill Kit`
- `AI Skill Hub`
- `Skill Harbor`

目前建議使用 `Agent Skill Dock`，GitHub repo 使用 `agent-skill-dock`。

## 初始技能清單

2026-06-02 更新：bootstrap 一鍵安裝已從初始 4 個項目擴充到 15 個公開、免 token 技能。新增預設技能包含 `impeccable`、Taste Skill 精選集、UI Skills repo set、`better-icons`、`design-md`。`Motion AI Kit` 因需要 Motion token / Motion+，保留為未來 optional external installer。

### 1. frontend-design

來源：

- Marketplace: https://claudemarketplaces.com/skills/anthropics/skills/frontend-design
- GitHub: https://github.com/anthropics/skills/tree/main/skills/frontend-design
- 上游安裝指令：`npx skills add https://github.com/anthropics/skills --skill frontend-design`

用途：

- 建立有明確美學方向的 production-grade web UI。
- 適合網站、landing page、dashboard、React component、HTML/CSS layout、UI 美化。
- 重點是避免常見 AI 生成感，強調 typography、layout、motion、visual detail。

Agent Skill Dock 包裝策略：

- 直接抓取上游 `skills/frontend-design`。
- 安裝到 Claude 與 Codex 時保留原始 `SKILL.md`。
- 可額外產生本專案的中文摘要與 usage card，但不改寫上游內容。

### 2. vercel-react-best-practices

來源：

- Marketplace: https://claudemarketplaces.com/skills/vercel-labs/agent-skills/vercel-react-best-practices
- GitHub repo: https://github.com/vercel-labs/agent-skills
- 目前上游資料夾：`skills/react-best-practices`
- Skill frontmatter 名稱：`vercel-react-best-practices`
- 上游安裝指令：`npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices`

用途：

- React 與 Next.js performance optimization。
- 適合寫 React component、Next.js page、data fetching、bundle optimization、server-side performance、避免 unnecessary re-render。
- Vercel 上游目前把規則分成多個優先級分類，例如 waterfall、bundle size、server performance、client data fetching、re-render、rendering、JavaScript performance、advanced patterns。

Agent Skill Dock 包裝策略：

- manifest 內同時記錄 `id: vercel-react-best-practices` 與 `sourcePath: skills/react-best-practices`。
- 安裝時用 skill frontmatter 的 name 當主要名稱。
- 保留 alias：`react-best-practices`，避免使用者被 repo 資料夾名與 marketplace 名稱混淆。

### 3. vercel-react-native-skills

來源：

- Marketplace: https://claudemarketplaces.com/skills/vercel-labs/agent-skills/vercel-react-native-skills
- GitHub repo: https://github.com/vercel-labs/agent-skills
- 目前上游資料夾：`skills/react-native-skills`
- Skill frontmatter 名稱：`vercel-react-native-skills`
- 上游安裝指令：`npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-native-skills`

用途：

- React Native 與 Expo best practices。
- 適合 mobile performance、list rendering、animation、navigation、native module、monorepo native dependency、platform-specific UI。
- 初始重點包含 FlashList、大列表效能、Reanimated、native navigator、expo-image、安全區域與字型設定。

Agent Skill Dock 包裝策略：

- manifest 內同時記錄 `id: vercel-react-native-skills` 與 `sourcePath: skills/react-native-skills`。
- 保留 alias：`react-native-skills`。
- 安裝時可選擇只安裝 web 技能、mobile 技能，或全套安裝。

### 4. ai-website-cloner-template

來源：

- GitHub: https://github.com/JCodesMore/ai-website-cloner-template

用途：

- 這不是單一標準 skill，而是一個 Next.js template/workflow。
- 它的 README 描述用途是把網站 URL 交給 AI coding agent，讓 agent 檢查網站、抽取 design tokens 與 assets、產生 component specs，再重建成現代 Next.js codebase。
- 上游 README 提到 Claude Code 是推薦 agent，也列出 Codex CLI 等多種 agent 支援。

Agent Skill Dock 包裝策略：

- 建立本專案 adapter skill：`website-cloner-template`。
- adapter 不直接複製整個 template 到技能目錄，而是教 agent 如何使用該 repo。
- 之後可加入 helper script：
  - `create-clone-project.sh`
  - `create-clone-project.ps1`
  - `create-clone-project.mjs`
- 預期使用方式：
  - `agent-skill-dock template website-cloner my-clone`
  - 或由技能引導 agent 執行 clone、install、啟動與 `/clone-website` workflow。

重要安全提醒：

- 這類網站複製工具只能用於合法授權、學習、遷移自己擁有的網站、找回遺失 source code 等情境。
- README 要明確禁止 phishing、冒充、侵犯品牌或違反網站 ToS 的用途。

## 目標使用方式

### 推薦入口：npx

跨平台最一致，macOS、Linux、Windows 都可用。

```bash
npx agent-skill-dock install
```

常用範例：

```bash
npx agent-skill-dock list
npx agent-skill-dock install --all
npx agent-skill-dock install frontend-design
npx agent-skill-dock install vercel-react-best-practices --agent codex
npx agent-skill-dock install vercel-react-native-skills --agent claude
npx agent-skill-dock doctor
```

### macOS/Linux 快速安裝

```bash
curl -fsSL https://raw.githubusercontent.com/<owner>/agent-skill-dock/main/install.sh | bash
```

### Windows PowerShell 快速安裝

```powershell
irm https://raw.githubusercontent.com/<owner>/agent-skill-dock/main/install.ps1 | iex
```

### 建議提供 dry-run

```bash
npx agent-skill-dock install --all --dry-run
```

dry-run 要列出：

- 會下載哪些來源。
- 會安裝到哪些 agent。
- 會寫入哪些目錄。
- 是否會覆蓋既有 skill。
- 是否需要備份。

## 安裝目標路徑策略

### Claude Code

官方路徑：

- 個人技能：`~/.claude/skills/<skill-name>/SKILL.md`
- 專案技能：`.claude/skills/<skill-name>/SKILL.md`

建議支援：

```bash
--agent claude
--scope user
--scope project
```

### Codex

目前官方文件描述的 Agent Skills 路徑：

- 個人技能：`~/.agents/skills/<skill-name>/SKILL.md`
- repo 技能：`.agents/skills/<skill-name>/SKILL.md`
- admin 技能：`/etc/codex/skills/<skill-name>/SKILL.md`

本機相容偵測：

- 這台機器目前存在 `~/.codex/skills`。
- 實作時建議做 auto-detect，不要只寫死單一路徑。

建議優先順序：

1. 如果使用者指定 `--codex-dir`，使用指定路徑。
2. 如果是 repo scope，使用 `.agents/skills`。
3. 如果是 user scope，優先使用 `~/.agents/skills`。
4. 如果偵測到既有 `~/.codex/skills` 且使用者同意，提供 compatibility install。
5. `doctor` 指令列出 Codex 實際可讀取的技能目錄。

### Multi-agent 模式

預設安裝到已偵測到的 agent：

```bash
npx agent-skill-dock install --all --agents auto
```

明確指定：

```bash
npx agent-skill-dock install --all --agents claude,codex
```

只輸出檔案，不安裝：

```bash
npx agent-skill-dock export --format zip
```

## GitHub repo 建議結構

```text
agent-skill-dock/
  README.md
  LICENSE
  package.json
  skills.json
  install.sh
  install.ps1
  packages/
    cli/
      src/
        index.ts
        commands/
          install.ts
          list.ts
          doctor.ts
          export.ts
        core/
          manifest.ts
          download.ts
          install-targets.ts
          backup.ts
          platform.ts
  adapters/
    website-cloner-template/
      SKILL.md
      README.md
      scripts/
        create-clone-project.mjs
  docs/
    usage.md
    adding-skills.md
    security.md
    compatibility.md
```

## Manifest 設計草案

檔案：`skills.json`

```json
{
  "schemaVersion": 1,
  "skills": [
    {
      "id": "frontend-design",
      "displayName": "Frontend Design",
      "type": "remote-skill",
      "source": {
        "provider": "github",
        "repo": "anthropics/skills",
        "ref": "main",
        "path": "skills/frontend-design"
      },
      "agents": ["claude", "codex"],
      "aliases": [],
      "categories": ["frontend", "design", "ui"],
      "summary": "Create distinctive production-grade frontend interfaces with a strong visual direction.",
      "license": "see-upstream"
    },
    {
      "id": "vercel-react-best-practices",
      "displayName": "Vercel React Best Practices",
      "type": "remote-skill",
      "source": {
        "provider": "github",
        "repo": "vercel-labs/agent-skills",
        "ref": "main",
        "path": "skills/react-best-practices"
      },
      "agents": ["claude", "codex"],
      "aliases": ["react-best-practices"],
      "categories": ["react", "nextjs", "performance"],
      "summary": "React and Next.js performance rules for writing, reviewing, and refactoring apps.",
      "license": "MIT"
    },
    {
      "id": "vercel-react-native-skills",
      "displayName": "Vercel React Native Skills",
      "type": "remote-skill",
      "source": {
        "provider": "github",
        "repo": "vercel-labs/agent-skills",
        "ref": "main",
        "path": "skills/react-native-skills"
      },
      "agents": ["claude", "codex"],
      "aliases": ["react-native-skills"],
      "categories": ["react-native", "expo", "mobile", "performance"],
      "summary": "React Native and Expo best practices for performant mobile apps.",
      "license": "MIT"
    },
    {
      "id": "website-cloner-template",
      "displayName": "AI Website Cloner Template",
      "type": "adapter-skill",
      "source": {
        "provider": "github",
        "repo": "JCodesMore/ai-website-cloner-template",
        "ref": "master",
        "path": "."
      },
      "agents": ["claude", "codex"],
      "aliases": ["ai-website-cloner-template", "clone-website"],
      "categories": ["template", "website", "nextjs", "agent-workflow"],
      "summary": "Adapter skill that guides agents through the AI website cloning template workflow.",
      "license": "MIT"
    }
  ]
}
```

## CLI 指令規劃

### `list`

列出可安裝技能：

```bash
npx agent-skill-dock list
```

輸出欄位：

- ID
- 類型
- 支援 agent
- 簡介
- 安裝狀態

### `install`

安裝技能：

```bash
npx agent-skill-dock install frontend-design
npx agent-skill-dock install --all
npx agent-skill-dock install --category frontend
```

選項：

```bash
--agents claude,codex
--scope user|project
--dry-run
--force
--backup
--ref <git-ref-or-sha>
--install-root <path>
```

### `doctor`

檢查環境：

```bash
npx agent-skill-dock doctor
```

檢查項：

- OS 與 shell。
- Node.js 版本。
- Git 是否存在。
- Claude skill 目錄是否存在。
- Codex skill 目錄是否存在。
- 目前已安裝技能。
- 有沒有重名技能。
- 上游 manifest 是否能下載。

### `update`

更新已安裝技能：

```bash
npx agent-skill-dock update
npx agent-skill-dock update frontend-design
```

行為：

- 比對 local metadata 與 upstream ref。
- 若有本機修改，先提示或建立備份。
- 允許 pin 版本，避免每次都追 `main`。

### `remove`

移除技能：

```bash
npx agent-skill-dock remove frontend-design
```

行為：

- 只刪除由 Agent Skill Dock 安裝的技能。
- 透過 `.agent-skill-dock.json` metadata 判斷 ownership。
- 預設備份到 `~/.agent-skill-dock/backups`。

## 安全與信任設計

安裝器需要預設保守：

- 不靜默覆蓋使用者現有 skill。
- 第一次安裝 remote source 前顯示來源 repo、ref、license。
- 支援 pin commit SHA，避免上游 `main` 變動造成不可預期更新。
- 對 shell/PowerShell 快速安裝提供可讀版本，不只提供 pipe install。
- 提供 `--dry-run` 與 `--yes`。
- 所有寫入都留下 metadata。
- adapter skill 要清楚標註哪些動作會 clone repo、npm install、啟動 browser 或 agent。

建議 metadata 檔：

```json
{
  "installedBy": "agent-skill-dock",
  "skillId": "frontend-design",
  "sourceRepo": "anthropics/skills",
  "sourceRef": "main",
  "sourcePath": "skills/frontend-design",
  "installedAt": "2026-06-02T00:00:00+08:00"
}
```

## README 對外介紹草稿

```md
# Agent Skill Dock

One command to install a curated set of AI coding-agent skills for Claude Code and Codex.

## Quick Start

\`\`\`bash
npx agent-skill-dock install --all
\`\`\`

## Included Skills

- Frontend Design: distinctive production-grade frontend UI generation.
- Vercel React Best Practices: React and Next.js performance guidance.
- Vercel React Native Skills: React Native and Expo performance guidance.
- AI Website Cloner Template: adapter workflow for AI-assisted website reconstruction.

## Supported Agents

- Claude Code
- Codex

## Supported Platforms

- macOS
- Linux
- Windows PowerShell

## Safety

Run a preview first:

\`\`\`bash
npx agent-skill-dock install --all --dry-run
\`\`\`
```

## 實作階段規劃

### Phase 1: Repo skeleton

- 建立 GitHub repo `agent-skill-dock`。
- 加入 `README.md`、`LICENSE`、`skills.json`。
- 先實作 `list` 與 `doctor`。
- 加入初始四個項目的 manifest。

### Phase 2: Local installer

- 實作 Node CLI。
- 支援 macOS/Linux/Windows。
- 支援 Claude user scope 與 Codex user scope。
- 支援 `--dry-run`、`--force`、`--backup`。

### Phase 3: Adapter system

- 加入 `website-cloner-template` adapter。
- 撰寫 adapter `SKILL.md`。
- 實作 create-project helper。
- 把 template workflow 用法寫入 docs。

### Phase 4: GitHub release

- npm package 發佈。
- GitHub Releases 提供 zip/tarball。
- `install.sh` 與 `install.ps1` 只做 bootstrap，到 npm CLI 或 release binary。

### Phase 5: Skill expansion

- 加入更多 skill。
- 加入分類安裝：`frontend`、`react`、`mobile`、`templates`。
- 加入 `skills.lock`，支援版本鎖定。
- 加入 GitHub Action 每週檢查上游是否更新。

## 待確認問題

- GitHub owner 要用個人帳號還是組織帳號。
- npm package 名稱是否能使用 `agent-skill-dock`。
- license 建議用 MIT，但需要逐一尊重上游 skill license。
- 是否要預設安裝到 Claude、Codex 兩邊，還是讓使用者選擇。
- Codex compatibility 是否要支援 `~/.codex/skills`，還是只支援官方 `.agents/skills`。
- `ai-website-cloner-template` 是否要做成 adapter skill，或直接提供 project generator。

## 參考資料

- Claude marketplace frontend-design: https://claudemarketplaces.com/skills/anthropics/skills/frontend-design
- Claude marketplace Vercel React Best Practices: https://claudemarketplaces.com/skills/vercel-labs/agent-skills/vercel-react-best-practices
- Claude marketplace Vercel React Native Skills: https://claudemarketplaces.com/skills/vercel-labs/agent-skills/vercel-react-native-skills
- Anthropic skills repo: https://github.com/anthropics/skills
- Vercel agent-skills repo: https://github.com/vercel-labs/agent-skills
- AI Website Cloner Template: https://github.com/JCodesMore/ai-website-cloner-template
- Claude Code skills docs: https://code.claude.com/docs/en/skills
- Codex Agent Skills docs: https://developers.openai.com/codex/skills
- Open Agent Skills standard: https://agentskills.io/
