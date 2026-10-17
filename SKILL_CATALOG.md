# Skill Catalog

這份文件介紹 Agent Skill Dock 目前預設一鍵安裝的 skills。重點是讓使用者和之後接手的 AI agent 快速知道：每個 skill 的原始來源在哪、特色是什麼、什麼時候該用、可以怎麼提示 AI。

目前預設安裝：29 個公開、免 token 的 skills。

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
請用 ppt-master 把這份報告做成可編輯的 PPTX 簡報。
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
| `ponytail` | Coding style | 極簡實作模式：最小變更、YAGNI、優先標準庫與原生功能 |
| `gsap-core` | Animation / GSAP | GSAP 核心 API、easing、stagger、matchMedia |
| `gsap-timeline` | Animation / GSAP | Timeline 排程與動畫編排 |
| `gsap-scrolltrigger` | Animation / GSAP | 捲動連動、pin、scrub、視差 |
| `gsap-react` | Animation / GSAP | React / Next.js 使用 GSAP（`useGSAP`、cleanup） |
| `gsap-performance` | Animation / GSAP | GSAP 動畫效能最佳化 |
| `gsap-plugins` | Animation / GSAP | Flip、Draggable、SplitText、Observer 等外掛 |
| `gsap-utils` | Animation / GSAP | `gsap.utils` 工具函式 |
| `gsap-frameworks` | Animation / GSAP | Vue / Nuxt / Svelte / SvelteKit 使用 GSAP |
| `ppt-master` | Presentation / PPTX | 生成、重建、套版與強化可編輯 PPTX 簡報 |
| `humanizer-zh-tw` | Writing / zh-TW | 去除中文文字的 AI 寫作痕跡（含附帶的 `text-watermark-cleaner-zh-tw`） |

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

## 19. ponytail

原始來源：

- GitHub: https://github.com/DietrichGebert/ponytail/tree/main/skills/ponytail

安裝來源：

```text
DietrichGebert/ponytail
path: skills/ponytail
```

特色：

- 「懶惰的資深工程師」模式：先問這件事需不需要做，再依序檢查 codebase 是否已有、標準庫或平台原生功能能否解決、已安裝的依賴能否解決，最後才寫最少的程式碼。
- 強度分 `lite`、`full`（預設）、`ultra`，用 `/ponytail lite|full|ultra` 切換。
- 回覆結尾會附上一兩行：略過了什麼、使用者需要知道的風險。
- 啟用後整個 session 持續生效；說「stop ponytail」或「normal mode」關閉。
- 不會省略 trust boundary 驗證、資料遺失防護、安全性與可及性。
- 上游 repo 另有 `ponytail-audit`、`ponytail-debt`、`ponytail-gain`、`ponytail-help`、`ponytail-review` 配套技能，目前未納入預設安裝。

適合使用：

- 想避免 AI 過度設計、多餘抽象、不必要的新依賴。
- 修 bug、小功能、重構時要求最小 diff。
- 選函式庫前先判斷是否真的需要。

提示範例：

```text
請使用 ponytail 幫我加上日期篩選，先看專案裡有沒有現成元件，不要新增依賴。
```

## 20. GSAP 官方技能組

包含 8 個 skills：`gsap-core`、`gsap-timeline`、`gsap-scrolltrigger`、`gsap-react`、`gsap-performance`、`gsap-plugins`、`gsap-utils`、`gsap-frameworks`。

原始來源：

- GitHub: https://github.com/greensock/gsap-skills/tree/main/skills

安裝來源：

```text
greensock/gsap-skills
path: skills/gsap-core, gsap-timeline, gsap-scrolltrigger, gsap-react,
      gsap-performance, gsap-plugins, gsap-utils, gsap-frameworks
```

特色：

- GreenSock 官方維護，教 agent 正確使用 GSAP：核心 API、timeline、ScrollTrigger、React hook、外掛與效能。
- 技能之間會互相引用（`gsap-core` 會指向其他七個），所以整組一起安裝。
- 使用者要求 JavaScript 動畫函式庫但沒指定時，技能會建議 GSAP；若使用者已選其他函式庫則尊重該選擇。
- GSAP 本身授權為免費（含所有外掛）；技能 repo 為 MIT。
- `gsap-core` 內含 `gsap.matchMedia()`，可處理 responsive 與 `prefers-reduced-motion`。

適合使用：

- 做複雜 timeline、捲動連動動畫、pin 區段。
- React / Next.js 中用 `useGSAP` 並正確 cleanup。
- Vue / Nuxt / Svelte 專案整合 GSAP。
- 和 `fixing-motion-performance`、`baseline-ui` 搭配檢查動畫效能與時長。

提示範例：

```text
請使用 gsap-scrolltrigger 和 gsap-react 幫我做首頁 hero 的捲動動畫，並加入 reduced-motion 處理。
```

## 21. ppt-master

原始來源：

- GitHub: https://github.com/hugohe3/ppt-master/tree/main/skills/ppt-master

安裝來源：

```text
hugohe3/ppt-master
path: skills/ppt-master
```

特色：

- 路由式簡報工作流：由 `workflows/routing.md` 先選定一條路線，再讀對應流程。涵蓋生成可編輯 PPTX、圖片轉 PPTX、重建頁面視覺、建立可重用的 Brand / Style / Layout / Deck workspace、填入原生 PPTX 範本、強化既有 PPTX（含旁白與動畫）。
- PPTX 轉換工具把受支援的 SVG 元素轉成可編輯的原生 DrawingML 形狀。
- 資料夾很大：約 13,000 個檔案、約 38 MB，其中絕大多數是 `templates/`。安裝到 Claude、`~/.agents/skills`、`~/.codex/skills` 三個目標就是三份。
- MIT 授權；技能帶有署名保護機制（見下方注意事項）。

使用前注意：

- 完整性檢查：SKILL.md 第一步會執行 `python3 "${SKILL_DIR}/scripts/attribution_guard.py"`，非 0 就整個停止。它會檢查 `LICENSE`、`SPONSORS.md`、`SPONSORS_CN.md` 是否存在、`LICENSE` 的 sha256、SKILL.md frontmatter 的 metadata，以及指定的 gate 檔。所以資料夾必須整個原樣複製，不能刪署名檔或改 metadata。安裝器多寫的 `.agent-skill-dock.json` 不影響這項檢查。
- Windows 的 `python3`：Windows 預設的 `python3` 常是 Microsoft Store 別名，執行會直接失敗（exit code 9009），完整性檢查就會讓技能整個停住。請安裝真正的 Python 3，或到「設定 → 應用程式 → 進階應用程式設定 → 應用程式執行別名」關閉 `python3.exe` 的別名；必要時確認 `python3 --version` 有輸出版本號。
- Python 依賴：安裝器只複製技能，不會 `pip install`。要自己執行 `pip install -r <技能資料夾>/requirements.txt`（多數工具只用標準庫，依賴是依功能選配）。其中 `PyMuPDF` 是 AGPL-3.0，只有 PDF 轉 Markdown 會用到；若不處理 PDF 來源可略過，要再分發前請先看授權。
- 圖片後端 key（選配）：AI 生圖功能讀 `.env`（範本是技能內的 `.env.example`），需要 Gemini、OpenAI 相容等服務的 API key 與額度。key 請放環境變數或 `.env`，不要貼在聊天裡。
- 和內建技能重疊：Codex app 內建的 `presentations`、以及 `pptx-generator` 等技能的觸發範圍與它重疊。想用這個技能時，請在需求裡直接寫出 `ppt-master`。

適合使用：

- 把報告、PDF、網頁或一段大綱做成可編輯簡報。
- 把圖片或截圖形式的簡報重建成可編輯 PPTX。
- 把公司範本或既有 PPTX 套入新內容、美化與強化。

提示範例：

```text
請使用 ppt-master，把這份 PDF 整理成 12 頁、可編輯的 PPTX 簡報。
```

## 22. humanizer-zh-tw

原始來源：

- GitHub: https://github.com/kevintsai1202/Humanizer-zh-TW （MIT）

安裝來源：

```text
kevintsai1202/Humanizer-zh-TW
path: .（repo 根目錄就是技能本體，整個複製後移除 .git）
```

特色：

- 把中文文章、評論、報告裡的公式化表達、空話與重複刪掉，讓文字更自然，同時保留事實、確定程度與作者語氣。
- 技能資料夾內附 `text-watermark-cleaner-zh-tw`（清理不可見 Unicode 與文字型浮水印的本地腳本），以及 `tests/` 結構檢查。

適合使用：

- 把 AI 產出的中文文字改寫得更像人寫的。
- 需要清理文字裡的不可見 Unicode 字元時，用資料夾內的 `text-watermark-cleaner-zh-tw`。

提示範例：

```text
請使用 humanizer-zh-tw 把這段報告摘要改寫得更自然，保留事實與數據。
```

注意：它讓文字更自然，不代表內容不是 AI 產出的，也不保證通過 AI 偵測器。

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

## 尚未預設安裝：graphify

原始來源：

- GitHub: https://github.com/safishamsi/graphify （官方 repo 亦列在 Graphify-Labs/graphify）
- PyPI: `graphifyy`（兩個 y；其他 `graphify*` 套件並非官方）

用途：

- 把程式碼、文件、SQL schema、設定檔與 PDF 轉成可查詢的知識圖譜，產出互動 HTML、JSON 與 `GRAPH_REPORT.md`。
- 在 agent 內用 `/graphify .` 建圖，之後可用 query / path / explain 查詢；授權 Apache-2.0。

狀態：

- 已確認存在且為高頻使用技能，不放入預設一鍵安裝，改為 opt-in：`--with graphify`（PowerShell：`-With graphify`）。
- 上游 repo 沒有可直接複製的 skill 資料夾；技能隨 PyPI 套件發佈，由 `graphify install` 依 agent 平台註冊，並附 `references/` 輔助檔，技能內容與 CLI 版本綁定。
- 需要 Python 工具鏈（uv / pipx / pip），且 graphify 另有 hooks 等會寫入專案或 agent 設定的功能，不符合預設安裝不改設定的原則。

用 Agent Skill Dock 旗標安裝（先 dry-run 預覽，dry-run 只印出指令、不執行任何外部命令）：

```bash
bash install.sh --dry-run --with graphify
bash install.sh --with graphify
bash install.sh --with graphify --agent codex --force
```

```powershell
.\install.ps1 -DryRun -With graphify
.\install.ps1 -With graphify
```

旗標行為：

- 找不到 `graphify` 時依序用 `uv tool install graphifyy` → `pipx install graphifyy` → `pip install graphifyy`；已在 PATH 就直接使用。
- Claude Code：執行 `graphify install`。除了技能檔，它還會在 `~/.claude/CLAUDE.md`（遵循 `CLAUDE_CONFIG_DIR`；`--scope project` 時為 `.claude/CLAUDE.md`）加入 `## graphify` 區塊，安裝器會先印出提醒。
- Codex：執行 `graphify install --platform codex`。技能寫到 `~/.codex/skills/graphify`（不是 `~/.agents/skills`）。
- `--scope project` 會加上 `--project`。
- 已存在的 graphify 技能預設跳過；`--force` 會先備份再重裝。
- 安裝後若 `graphify` 仍不在 PATH，會停止並提示執行 `uv tool update-shell` 後重開終端機。

手動安裝（等同旗標實際執行的指令）：

```bash
uv tool install graphifyy
graphify install                     # 自動偵測目前使用的 assistant
graphify install --platform codex    # 指定 Codex
graphify install --project           # 只安裝到目前專案
```

未來可能用法：

```bash
agent-skill-dock install graphify --external
```

## 尚未預設安裝：cell_su7

原始來源：

- GitHub: https://github.com/yrui-cmd/cell_su7 （MIT，v0.4.8，Codex plugin）
- 必要依賴：https://github.com/yrui-cmd/cell_no_ai

用途：

- 把 PNG / JPEG / WebP 科研圖重建成可編輯的 PowerPoint 或 Adobe Illustrator 檔。流程是先記錄所有文字與位置，用圖像編輯模型只清掉文字，把圖形送去路徑辨識，再依原圖層級由後往前繪製，最後把文字還原成可編輯物件。
- 交付：可編輯 PPTX，或 AI 檔加最終 PNG，以及 `text-manifest.json`（文字內容、位置、來源畫布座標）。
- 一個 plugin 內有兩個 skill：`plugins/cell_su7/skills/cell_su7` 與 `plugins/cell_su7/skills/cell_no_ai`。

狀態：

- 已確認存在，不放入預設一鍵安裝，也沒有接上 `--with` 旗標，只記錄在文件。
- 原因一：路徑辨識與去水印都走第三方付費服務「小描」（https://xiaomiao-ai.com/），需要 API key（`img_live_...`）與額度，依專案規則不進預設。
- 原因二：`cell_su7` 要求 agent 在每個新任務前執行 `sync_cell_no_ai.py`，它會 clone 或下載 `yrui-cmd/cell_no_ai` 的 `main` 分支並覆蓋 `SKILL.md`、`agents`、`references`、`scripts`（舊檔會備份）。這是沒有釘版本的遠端程式碼自動更新，有供應鏈風險；要釘版本才適合納入。
- 原因三：`cell_no_ai` 的功能是去除 AI 生成圖片的水印（主要針對 SynthID）。見下方負責任使用。
- 安裝時兩個 skill 一定會一起裝，但 `cell_no_ai` 只在使用者同意後才會被呼叫。

使用前注意：

- 費用與隱私：圖片會上傳到第三方服務。去水印每張 1 額度、圖片會保留 15 分鐘；路徑辨識約每張 1 元人民幣，實際以官方頁面為準。提交前要先查詢餘額。不要處理未發表、機密或有合約限制的圖。
- API key：上游 SKILL.md 鼓勵直接把 key 貼進聊天讓助手設定。請不要這樣做，改用上游提供的腳本：Windows 用 `set-xiaomiao-key.ps1`（DPAPI 加密儲存），macOS 存 Keychain。貼進聊天的 key 會留在對話紀錄裡。
- 平台需求：Windows PowerPoint 逐路徑播放需要 PowerPoint COM；Illustrator 在 Windows 用 COM、macOS 用 AppleScript（macOS Illustrator 上游只做了模擬測試）。
- 負責任使用：`cell_no_ai` 移除的是 AI 生成標記。用在你自己產生、且期刊或平台政策允許的圖上沒問題；請不要用它讓 AI 生成的圖看起來不是 AI 生成，來規避論文投稿、平台或機構的揭露規定。

官方安裝方式（需要自己審過再執行，不由 Agent Skill Dock 代跑）：

```bash
git clone https://github.com/yrui-cmd/cell_su7.git
cd cell_su7
python install.py --destination ~/.codex/skills        # 加 --force 才會覆蓋既有技能
# 或 Windows：.\setup.ps1    macOS：bash setup.sh
```

上游安裝腳本會複製兩個技能、執行一次 `sync_cell_no_ai.py`，再執行 `configure_runtime.py`。建議先讀過這三支腳本再執行。

若之後要做成選配旗標（`--with cell_su7`），前提是：dry-run 只印出指令、不執行；固定 commit 或 tag；停用或移除每個任務前的自動同步；不替使用者保存 key。

提示範例（安裝完成後）：

```text
用 cell_su7 處理這張原圖，用 PPT 繪製。
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
