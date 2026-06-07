# Skill Catalog

這份文件介紹 Agent Skill Dock 目前預設一鍵安裝的 skills。重點是讓使用者和之後接手的 AI agent 快速知道：每個 skill 的原始來源在哪、特色是什麼、什麼時候該用、可以怎麼提示 AI。

目前預設安裝：18 個公開、免 token 的 skills。

## 快速使用方式

安裝後，重啟 Claude Code / Codex，讓 agent 重新讀取技能目錄。

你可以直接在任務裡點名 skill，例如：

```text
請使用 frontend-design 幫我做一個產品首頁。
請使用 impeccable audit 這個 dashboard。
請用 design-taste-frontend 重設計這個 landing page。
請用 fixing-accessibility 檢查這個表單。
請用 better-icons 幫我挑一組一致的 sidebar icons。
請用 find-skills 幫我找適合做 API 文件的 skill。
請用 code-simplifier 整理我剛修改的程式碼。
請用 skill-creator 幫我建立一個 release notes skill。
```

不同 agent 對 skill invocation 的語法可能不同；最保險的方式是直接在需求文字中寫出 skill 名稱。

## 技能總覽

| Skill ID | 分類 | 主要用途 |
| --- | --- | --- |
| `frontend-design` | Frontend design | 高品質 web UI 生成與美化 |
| `vercel-react-best-practices` | React / Next.js | React 與 Next.js 效能最佳實踐 |
| `vercel-react-native-skills` | React Native / Expo | Mobile app 效能、動畫、列表與平台最佳實踐 |
| `website-cloner-template` | Template workflow | 用 AI Website Cloner Template 重建授權網站 |
| `impeccable` | Design audit / polish | 增強版 frontend design、UI audit、polish、anti-pattern 檢查 |
| `design-taste-frontend` | Frontend taste | 提升前端審美、排版、字體、動效與視覺方向 |
| `gpt-taste` | GPT / Codex taste | 給 GPT/Codex 更嚴格的 UI taste 與 motion/layout 規則 |
| `redesign-existing-projects` | Redesign | 專門改版既有網站或 app |
| `high-end-visual-design` | Premium visual | 高級感視覺設計、留白、卡片、陰影與柔和動效 |
| `baseline-ui` | UI engineering | UI baseline、可及性、排版比例、動效時長檢查 |
| `fixing-accessibility` | Accessibility | ARIA、鍵盤、focus、contrast、表單可及性修正 |
| `fixing-metadata` | SEO / metadata | SEO metadata、Open Graph、社群分享卡片 |
| `fixing-motion-performance` | Motion performance | 動畫 jank、layout thrashing、blur / scroll-linked motion 效能 |
| `better-icons` | Icons | 圖標搜尋、選型、SVG 與 icon family 一致性 |
| `design-md` | Design system | 產生/維護 DESIGN.md 設計系統文件 |
| `find-skills` | Skill discovery | 搜尋、評估與安裝 agent skills |
| `code-simplifier` | Code quality | 保留行為並簡化近期修改的程式碼 |
| `skill-creator` | Skill authoring | 建立、改善、評估與封裝 agent skills |

## 1. frontend-design

原始來源：

- GitHub: https://github.com/anthropics/skills/tree/main/skills/frontend-design
- Marketplace: https://claudemarketplaces.com/skills/anthropics/skills/frontend-design

安裝來源：

```text
anthropics/skills
path: skills/frontend-design
```

特色：

- Anthropic 官方 frontend design skill。
- 適合從零建立 web component、landing page、dashboard、HTML/CSS layout。
- 強調 production-grade UI、視覺細節、避免普通 AI 生成感。

適合使用：

- 建立新頁面或元件。
- 把粗糙 UI 變得更完整。
- 需要有明確視覺方向的前端任務。

提示範例：

```text
請使用 frontend-design 幫我做一個 SaaS pricing page，風格要乾淨、成熟、可直接上線。
```

## 2. vercel-react-best-practices

原始來源：

- GitHub: https://github.com/vercel-labs/agent-skills/tree/main/skills/react-best-practices
- Marketplace: https://claudemarketplaces.com/skills/vercel-labs/agent-skills/vercel-react-best-practices

安裝來源：

```text
vercel-labs/agent-skills
path: skills/react-best-practices
```

特色：

- Vercel Labs 的 React / Next.js performance skill。
- 關注 data fetching、bundle size、server performance、client rendering、unnecessary re-render。
- 很適合搭配 code review 或重構任務。

適合使用：

- Next.js app 變慢。
- React component re-render 太多。
- 想檢查 bundle、waterfall、server/client boundary。

提示範例：

```text
請使用 vercel-react-best-practices review 這個 Next.js route，找出效能問題並修正。
```

## 3. vercel-react-native-skills

原始來源：

- GitHub: https://github.com/vercel-labs/agent-skills/tree/main/skills/react-native-skills
- Marketplace: https://claudemarketplaces.com/skills/vercel-labs/agent-skills/vercel-react-native-skills

安裝來源：

```text
vercel-labs/agent-skills
path: skills/react-native-skills
```

特色：

- Vercel Labs 的 React Native / Expo skill。
- 關注 list rendering、animation、navigation、native module、platform-specific UI。
- 對 FlashList、Reanimated、expo-image、安全區域、字型設定等 mobile 問題很有幫助。

適合使用：

- React Native list 卡頓。
- Expo app 的圖片、字型、safe area、navigation 需要調整。
- Mobile UI 需要平台感與效能兼顧。

提示範例：

```text
請使用 vercel-react-native-skills 優化這個 React Native feed screen，特別注意列表效能和圖片載入。
```

## 4. website-cloner-template

原始來源：

- GitHub: https://github.com/JCodesMore/ai-website-cloner-template

安裝來源：

```text
local adapter
path: adapters/website-cloner-template
```

特色：

- 這不是傳統單一 skill，而是 Agent Skill Dock 包裝的 adapter workflow。
- 引導 AI 使用 `JCodesMore/ai-website-cloner-template` 建立網站重建專案。
- 適合把授權網站、自己的舊網站、設計參考重建成現代 Next.js codebase。

適合使用：

- 你擁有網站，但 source code 遺失。
- 你要遷移自己的舊站。
- 你要合法研究某個網站的 layout/design tokens。

安全邊界：

- 不應用於 phishing、仿冒品牌、侵犯版權、繞過網站 ToS 或未授權複製。

提示範例：

```text
請使用 website-cloner-template，幫我建立一個新專案來重建我擁有的網站：https://example.com
```

## 5. impeccable

原始來源：

- Website: https://impeccable.style/
- GitHub: https://github.com/pbakaus/impeccable

安裝來源：

```text
pbakaus/impeccable
Claude path: .claude/skills/impeccable
Codex path: .agents/skills/impeccable
```

特色：

- 強化版 frontend design skill。
- 內建完整的設計詞彙與多種 UI 工作流，例如 audit、critique、polish、layout、typeset、animate、colorize。
- 比 `frontend-design` 更偏向設計審查、修正 anti-pattern、把 UI 打磨到更成熟。

適合使用：

- 已經有 UI，但看起來普通、模板感重。
- 想做 UX/UI critique。
- 想做上線前的 polish pass。
- 想把某個區塊變得更大膽、更安靜、更清楚或更有設計感。

提示範例：

```text
請使用 impeccable audit 這個 dashboard，找出視覺層級、可及性、排版和互動細節問題。
```

```text
請使用 impeccable polish 這個 settings page，讓它更成熟、更有產品感。
```

## 6. design-taste-frontend

原始來源：

- Website: https://tasteskill.dev/
- GitHub: https://github.com/Leonxlnx/taste-skill

安裝來源：

```text
Leonxlnx/taste-skill
path: skills/taste-skill
```

特色：

- Taste Skill 的主要 frontend taste skill。
- 重點是避免 AI 做出無聊、模板化、毫無個性的 UI。
- 會更積極思考 layout variance、visual density、motion intensity、字體、留白、視覺節奏。

適合使用：

- Landing page、portfolio、品牌頁、產品頁。
- 想要 UI 有更強設計主張。
- 想把「能用」提升到「好看、有記憶點」。

提示範例：

```text
請使用 design-taste-frontend 重新設計這個 landing page，保留文案但提高視覺層級和記憶點。
```

## 7. gpt-taste

原始來源：

- Website: https://tasteskill.dev/
- GitHub: https://github.com/Leonxlnx/taste-skill

安裝來源：

```text
Leonxlnx/taste-skill
path: skills/gpt-tasteskill
```

特色：

- Taste Skill 裡面偏 GPT/Codex 使用情境的嚴格版。
- 更強調 layout variation、motion engineering、完整輸出與避免過度安全的模板排版。
- 適合 Codex 做前端時加上更強的設計約束。

適合使用：

- Codex 生成的 UI 太保守。
- 希望在設計方向已明確時，加強 layout / motion / polish。
- 想避免一眼看出是 AI 生成的 landing page。

提示範例：

```text
請使用 gpt-taste 做這個首頁，版面要更有變化，但仍保持可讀性和 responsive。
```

## 8. redesign-existing-projects

原始來源：

- Website: https://tasteskill.dev/
- GitHub: https://github.com/Leonxlnx/taste-skill

安裝來源：

```text
Leonxlnx/taste-skill
path: skills/redesign-skill
```

特色：

- 專門用來改版既有網站或 app。
- 先 audit 現有 UI，再規劃修正視覺層級、spacing、色彩、字體、元件結構。
- 適合不是從零開始，而是「讓現有東西變更好」。

適合使用：

- 舊 dashboard、landing page、設定頁需要翻新。
- 已有功能正確，但 UI 缺乏質感。
- 想保留資訊架構，但提升視覺呈現。

提示範例：

```text
請使用 redesign-existing-projects 改版這個現有頁面，先指出問題，再直接修改程式碼。
```

## 9. high-end-visual-design

原始來源：

- Website: https://tasteskill.dev/
- GitHub: https://github.com/Leonxlnx/taste-skill

安裝來源：

```text
Leonxlnx/taste-skill
path: skills/soft-skill
```

特色：

- Taste Skill 裡偏「高級感、柔和、成熟」的視覺風格。
- 著重字體、留白、陰影、卡片結構、低對比配色、細膩動效。
- 適合品牌、精品感產品、顧問服務、創作者網站。

適合使用：

- 你想要 calming、premium、editorial 的產品感。
- UI 太硬、太工程、太雜，需要變得精緻。
- 想做高級感 portfolio 或 agency landing page。

提示範例：

```text
請使用 high-end-visual-design 設計這個顧問服務首頁，要有高級感、留白充足、字體層級漂亮。
```

## 10. baseline-ui

原始來源：

- Website: https://www.ui-skills.com/
- GitHub: https://github.com/ibelick/ui-skills

安裝來源：

```text
ibelick/ui-skills
path: skills/baseline-ui
```

特色：

- UI Skills 的基礎 UI 工程檢查 skill。
- 著重 typography scale、animation duration、component accessibility、layout anti-pattern。
- 適合 Tailwind / React UI 的日常品質檢查。

適合使用：

- 寫完 UI 後做 baseline review。
- 檢查 spacing、字級、互動狀態、動效是否一致。
- 防止 UI 工程細節越堆越亂。

提示範例：

```text
請使用 baseline-ui 檢查這個 Tailwind component，修正排版比例、動效時長和 accessibility 問題。
```

## 11. fixing-accessibility

原始來源：

- Website: https://www.ui-skills.com/
- GitHub: https://github.com/ibelick/ui-skills

安裝來源：

```text
ibelick/ui-skills
path: skills/fixing-accessibility
```

特色：

- 專注 HTML / UI accessibility 修正。
- 針對 ARIA、keyboard navigation、focus management、color contrast、form errors 等常見問題。
- 適合做可及性 audit 後直接修 code。

適合使用：

- 表單、modal、dropdown、tabs、dialog。
- 需要鍵盤可操作與 focus 狀態。
- 想降低 WCAG 相關問題。

提示範例：

```text
請使用 fixing-accessibility 修正這個 modal，確保鍵盤操作、focus trap、ARIA labels 都正確。
```

## 12. fixing-metadata

原始來源：

- Website: https://www.ui-skills.com/
- GitHub: https://github.com/ibelick/ui-skills

安裝來源：

```text
ibelick/ui-skills
path: skills/fixing-metadata
```

特色：

- 專注 page metadata、SEO、Open Graph、社群分享預覽。
- 對 Next.js metadata API、title/description、canonical、OG image、Twitter card 很有用。
- 適合產品頁、部落格、landing page 上線前檢查。

適合使用：

- 頁面分享到社群時預覽不漂亮。
- SEO title/description 不完整。
- Next.js app 缺 metadata。

提示範例：

```text
請使用 fixing-metadata 檢查這個 Next.js app，補齊 SEO、Open Graph、Twitter card 和 canonical。
```

## 13. fixing-motion-performance

原始來源：

- Website: https://www.ui-skills.com/
- GitHub: https://github.com/ibelick/ui-skills

安裝來源：

```text
ibelick/ui-skills
path: skills/fixing-motion-performance
```

特色：

- 專門處理前端動畫效能。
- 關注 layout thrashing、compositor-friendly properties、scroll-linked motion、blur、transition jank。
- 適合 CSS/JS animation、Framer Motion、scroll animation 等場景。

適合使用：

- 動畫卡頓。
- 滾動時掉幀。
- hover / transition / blur 效果太重。

提示範例：

```text
請使用 fixing-motion-performance 檢查這個 animated hero，降低 jank 並保持視覺效果。
```

## 14. better-icons

原始來源：

- Skill source: https://github.com/jscraik/Agent-Skills/tree/main/Skills/frontend-ui/better-icons
- Better Icons project: https://github.com/better-auth/better-icons

安裝來源：

```text
jscraik/Agent-Skills
path: Skills/frontend-ui/better-icons
```

特色：

- 讓 AI 更穩定地選 icon，不要亂畫 SVG 或混用多種 icon family。
- 引導使用 Better Icons CLI/MCP 搜尋、比較、擷取 Iconify 生態中的 icons。
- 目前 Agent Skill Dock 預設只安裝 skill，不自動改 MCP 設定。

適合使用：

- Sidebar、toolbar、feature list、settings page 需要一致 icon。
- 想找到 Lucide / Heroicons / Material / Tabler 等 icon。
- 不想讓 AI 手刻不可靠的 SVG。

可選 MCP/CLI：

```bash
npx better-icons setup
npx better-icons search arrow --limit 10
npx better-icons get lucide:home > icon.svg
```

提示範例：

```text
請使用 better-icons 幫我為 sidebar 選一組 Lucide icons，保持線條粗細和語意一致。
```

## 15. design-md

原始來源：

- DESIGN.md format: https://designmd.ai/about
- Google Stitch skill: https://github.com/google-labs-code/stitch-skills/tree/main/plugins/stitch-utilities/skills/design-md
- Marketplace: https://claudemarketplaces.com/skills/google-labs-code/stitch-skills/design-md

安裝來源：

```text
google-labs-code/stitch-skills
path: plugins/stitch-utilities/skills/design-md
```

特色：

- `DESIGN.md` 是用 Markdown 描述 design system 的格式，讓 AI coding agent 可以讀懂顏色、字體、間距、元件規則。
- `design-md` skill 偏向從 Stitch project / design context 產生語意化 `DESIGN.md`。
- 適合讓專案長期保持同一套 visual language。

適合使用：

- 想建立專案設計系統文件。
- 想讓之後 AI 生成的 UI 都遵守同一套風格。
- 使用 Google Stitch 或有明確設計稿/畫面可萃取。

提示範例：

```text
請使用 design-md，根據目前專案 UI 建立根目錄 DESIGN.md，包含 colors、typography、spacing、components。
```

## 16. find-skills

原始來源：

- GitHub: https://github.com/vercel-labs/skills/tree/main/skills/find-skills
- Skills directory: https://skills.sh/

安裝來源：

```text
vercel-labs/skills
path: skills/find-skills
```

特色：

- 協助使用者從 open agent skills 生態尋找可安裝技能。
- 會先理解需求，再使用 Skills CLI 搜尋並檢查來源可信度、安裝數與 repo 品質。
- 適合在現有能力不足或使用者明確想擴充 agent 時使用。

適合使用：

- 想知道某個工作是否已有現成 skill。
- 想比較不同來源的同類技能。
- 想取得 `npx skills add` 安裝指令與來源連結。

提示範例：

```text
請使用 find-skills 幫我找適合 Playwright E2E 測試的 skill，先比較來源可信度再推薦。
```

## 17. code-simplifier

原始來源：

- GitHub: https://github.com/getsentry/skills/tree/main/skills/code-simplifier

安裝來源：

```text
getsentry/skills
path: skills/code-simplifier
```

特色：

- 在保留功能、輸出與行為的前提下改善程式碼清晰度。
- 著重降低不必要的巢狀結構、重複抽象、過度緊湊寫法與難懂命名。
- 預設聚焦當前工作階段最近修改的程式碼，避免無限制擴大重構範圍。

適合使用：

- 完成功能後做 readability 與 maintainability pass。
- 清理 nested ternary、過度抽象或難以除錯的 one-liner。
- 希望重構但不能改變既有行為。

提示範例：

```text
請使用 code-simplifier 整理這次修改過的 TypeScript 程式碼，保留所有行為並執行現有測試。
```

## 18. skill-creator

原始來源：

- GitHub: https://github.com/anthropics/skills/tree/main/skills/skill-creator

安裝來源：

```text
anthropics/skills
path: skills/skill-creator
```

特色：

- Anthropic 的完整 skill authoring 與迭代工作流。
- 支援建立或改善 `SKILL.md`、設計測試案例、執行 baseline 比較、benchmark 與人工 review。
- skill 目錄包含 scripts、references、assets、agents 與 eval viewer，安裝器會完整保留。
- 進階 eval、benchmark 與 viewer 流程可能需要 Python、對應 agent CLI 或 subagent 支援。

適合使用：

- 從零建立可重用的 agent skill。
- 改善既有 skill 的觸發描述、流程或輸出品質。
- 用測試案例與評估流程比較 skill 前後版本。

提示範例：

```text
請使用 skill-creator 幫我建立一個自動產生 release notes 的 skill，包含測試案例與評估流程。
```

## 尚未預設安裝：Motion AI Kit

原始來源：

- Docs: https://motion.dev/docs/ai-kit-install
- npm: https://www.npmjs.com/package/motion-ai

狀態：

- 已確認存在，但目前不放入預設一鍵安裝。
- 原因是官方技能安裝需要 Motion token / Motion+ access。
- 未來可做成 external installer，讀取 `MOTION_TOKEN` 後呼叫官方安裝器。

未來可能用法：

```bash
agent-skill-dock install motion-ai-kit --external
```

## 維護規則

新增預設技能時，請同步更新：

- `skills.json`
- `install.sh`
- `install.ps1`
- `README.md`
- `AGENTS.md`
- 本文件 `SKILL_CATALOG.md`

如果來源需要 API key、付費 token、MCP 設定或會修改 agent config，請不要直接放入預設安裝，先做成 optional / external installer。
