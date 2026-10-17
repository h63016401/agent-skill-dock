# Agent Skill Dock

一鍵安裝常用 AI coding-agent skills，集中管理 Claude Code、Codex 會用到的前端設計、動畫（GSAP）、程式碼品質與極簡實作、技能探索與建立、可編輯 PPTX 簡報、中文寫作去 AI 味、React/Next.js、React Native/Expo 與網站重建工作流。

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
| `find-skills` | 搜尋、評估並安裝 open agent skills 生態中的技能 | https://github.com/vercel-labs/skills |
| `code-simplifier` | 在保留行為的前提下簡化近期修改的程式碼 | https://github.com/getsentry/skills |
| `skill-creator` | 建立、改善、測試、評估與封裝 agent skills | https://github.com/anthropics/skills |
| `ponytail` | 極簡實作模式：最小變更解決問題、YAGNI、優先標準庫、不亂加依賴 | https://github.com/DietrichGebert/ponytail |
| `gsap-core` | GSAP 核心 API：tween、easing、stagger、matchMedia（含 reduced-motion） | https://github.com/greensock/gsap-skills |
| `gsap-timeline` | GSAP timeline 排程、position parameter、巢狀與播放控制 | https://github.com/greensock/gsap-skills |
| `gsap-scrolltrigger` | GSAP ScrollTrigger：捲動連動、pin、scrub、視差 | https://github.com/greensock/gsap-skills |
| `gsap-react` | React / Next.js 使用 GSAP：`useGSAP`、refs、cleanup | https://github.com/greensock/gsap-skills |
| `gsap-performance` | GSAP 動畫效能：優先 transform、避免 layout thrashing | https://github.com/greensock/gsap-skills |
| `gsap-plugins` | GSAP 外掛：Flip、Draggable、SplitText、Observer 等 | https://github.com/greensock/gsap-skills |
| `gsap-utils` | `gsap.utils` 工具函式：clamp、mapRange、snap、wrap 等 | https://github.com/greensock/gsap-skills |
| `gsap-frameworks` | Vue / Nuxt / Svelte / SvelteKit 使用 GSAP：生命週期與 cleanup | https://github.com/greensock/gsap-skills |
| `ppt-master` | 生成、重建、套版與強化可編輯 PPTX 簡報（資料夾約 38 MB，需另裝 Python 依賴） | https://github.com/hugohe3/ppt-master |
| `humanizer-zh-tw` | 去除中文文字的 AI 寫作痕跡（附帶 `text-watermark-cleaner-zh-tw`） | https://github.com/kevintsai1202/Humanizer-zh-TW |

`Motion AI Kit` 需要 Motion token / Motion+，目前不列入預設一鍵安裝；之後會做成選配 external installer。

`graphify`（把程式碼、文件、PDF 轉成可查詢的知識圖譜）不列入預設安裝，但可用選配旗標安裝：它跟隨 PyPI 套件 `graphifyy` 發佈，旗標會呼叫其官方 CLI（`uv tool install graphifyy`，沒有 uv 時改用 pipx / pip，再執行 `graphify install`）。先用 dry-run 預覽會執行的指令，dry-run 不會執行任何外部指令：

```bash
curl -fsSL https://raw.githubusercontent.com/h63016401/agent-skill-dock/main/install.sh | bash -s -- --dry-run --with graphify
```

```powershell
.\install.ps1 -DryRun -With graphify
```

旗標行為與注意事項請看 [SKILL_CATALOG.md](./SKILL_CATALOG.md#尚未預設安裝graphify)。

`cell_su7`（把科研圖重建成可編輯的 PPTX 或 Illustrator 檔，含必要依賴 `cell_no_ai`）也不列入預設安裝，目前沒有安裝旗標，只有文件說明。原因是它要付費的第三方 API key（小描）、圖片會上傳到第三方，且上游流程會在每個任務前自動同步遠端 `main` 分支的程式碼，沒有釘版本。想用請照 [SKILL_CATALOG.md](./SKILL_CATALOG.md#尚未預設安裝cell_su7) 的官方安裝方式，自己審過上游腳本再執行。來源：https://github.com/yrui-cmd/cell_su7 、https://github.com/yrui-cmd/cell_no_ai 。

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
bash install.sh --with graphify
```

Windows PowerShell:

```powershell
.\install.ps1 -DryRun
.\install.ps1 -Agent claude
.\install.ps1 -Agent codex
.\install.ps1 -Scope project
.\install.ps1 -Force
.\install.ps1 -CodexCompat
.\install.ps1 -With graphify
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
- `find-skills` 可能推薦其他第三方 skill；安裝前仍應檢查來源、內容、授權與維護狀態。
- `skill-creator` 的基本撰寫流程可直接使用，但進階 eval、benchmark 與 viewer 可能需要 Python、對應 agent CLI 或 subagent 支援。
- `ponytail` 啟用後會在整個 session 持續影響回應風格（偏向最小變更、結尾附上略過項目與風險）；說「stop ponytail」或「normal mode」即可關閉。
- `gsap-*` 為 GSAP 官方技能組，彼此會互相引用（例如 `gsap-core` 會指向 `gsap-timeline`、`gsap-react`），因此一起安裝。
- `ppt-master` 每個安裝目標約 38 MB、約 13,000 個檔案（Claude、`~/.agents/skills`、`~/.codex/skills` 各一份），首次安裝會比較久。它的 SKILL.md 第一步會執行 `python3 scripts/attribution_guard.py` 檢查 `LICENSE`、`SPONSORS*.md` 與 metadata，所以資料夾必須整個保留，不能刪署名檔。
- `ppt-master` 的 Python 依賴不會被自動安裝，需自行執行 `pip install -r requirements.txt`（在技能資料夾內）；其中 `PyMuPDF` 是 AGPL-3.0，只有 PDF 轉 Markdown 會用到。AI 生圖功能另需 `.env` 的圖片後端 API key，請勿貼在聊天裡。
- Windows 上 `python3` 常是 Microsoft Store 別名（執行會失敗），`ppt-master` 的完整性檢查會因此讓技能整個停住。請安裝真正的 Python 3，或在「應用程式執行別名」關閉 `python3.exe`。
- `ppt-master` 與 Codex 內建的 `presentations`、以及 `pptx-generator` 等簡報技能的觸發範圍重疊；想用它時請在需求裡直接寫出 `ppt-master`。
- `humanizer-zh-tw` 的上游是整個 repo（skill 在 repo 根目錄），安裝器會整個複製後移除 `.git`。它讓文字更自然，但不代表內容不是 AI 產出的，也不保證通過 AI 偵測器。
- `cell_su7` / `cell_no_ai` 不在預設安裝內：需要付費 API key、圖片會上傳到第三方（去水印每張 1 額度、保留 15 分鐘），且會自動同步未釘版本的遠端程式碼。上游鼓勵把 key 貼進聊天，請改用 `set-xiaomiao-key.ps1`（Windows DPAPI）或 macOS Keychain。`cell_no_ai` 移除的是 AI 圖片水印，請勿用它規避論文或平台的 AI 生成揭露規定。
- `--with graphify` / `-With graphify` 會真的執行外部指令（從 PyPI 安裝 `graphifyy`、執行 `graphify install`），不加 `--dry-run` / `-DryRun` 才會執行。Claude Code 的安裝還會在 `~/.claude/CLAUDE.md`（`--scope project` 時為 `.claude/CLAUDE.md`）加入 `## graphify` 區塊；Codex 則寫入 `~/.codex/skills/graphify`。已存在的 graphify 技能預設跳過，加 `--force` 會先備份再重裝。

## 專案規劃

完整規劃請看 [PROJECT_PLAN.md](./PROJECT_PLAN.md)。

給 AI coding agent 接手用的專案說明請看 [AGENTS.md](./AGENTS.md)。

完整技能介紹與用法請看 [SKILL_CATALOG.md](./SKILL_CATALOG.md)。

之後要納入的一鍵安裝候選技能請看 [CANDIDATE_SKILLS.md](./CANDIDATE_SKILLS.md)。

## License

MIT
