# Candidate Skills Research

Research date: 2026-06-02, Asia/Taipei.

Updated: 2026-10-16, Asia/Taipei (added local-usage-driven review: `ponytail` and the GSAP set promoted; `graphify`, `humanizer-zh-tw`, `canvas-ui-design` kept as candidates).

This file tracks online skill candidates that should be considered for future one-click installation. Candidates are active only when they are also listed in `skills.json` and wired into `install.sh` / `install.ps1`.

Current promotion status:

- Promoted to default install: `impeccable`, Taste curated set, UI Skills repo set, `better-icons`, `design-md`, `find-skills`, `code-simplifier`, `skill-creator`, `ponytail`, GSAP official set (`gsap-*`, 8 skills).
- Still optional/external: Motion AI Kit (requires a Motion token / Motion+ access) and `graphify` (ships through the `graphifyy` PyPI package, not a copyable skill folder).
- Still candidates: `humanizer-zh-tw`, `canvas-ui-design` (see sections 8 and 9).

## Summary

| User label | Found? | Canonical name | Source | Install readiness |
| --- | --- | --- | --- | --- |
| `lmpeccable` | Yes, likely typo | `impeccable` | https://github.com/pbakaus/impeccable | Promoted |
| Taste Skill | Yes | `design-taste-frontend` and related skills | https://github.com/Leonxlnx/taste-skill | Curated set promoted |
| UI Skills | Yes | `baseline-ui`, `fixing-accessibility`, `fixing-metadata`, `fixing-motion-performance` | https://github.com/ibelick/ui-skills | Promoted |
| Motion AI Kit | Yes | Motion AI Kit / `motion-ai` | https://motion.dev/docs/ai-kit-install | Conditional: needs Motion token |
| Better Icons | Yes | `better-icons` | https://github.com/jscraik/Agent-Skills and https://www.npmjs.com/package/better-icons | Skill promoted, MCP optional |
| `DESIGN.md` | Yes | `design-md` and DESIGN.md format | https://github.com/google-labs-code/stitch-skills | Promoted, Stitch-dependent |
| `ponytail` | Yes | `ponytail` | https://github.com/DietrichGebert/ponytail | Promoted |
| GSAP skills | Yes | `gsap-*` (8 skills) | https://github.com/greensock/gsap-skills | Promoted as a set |
| Graphify | Yes | `graphify` | https://github.com/safishamsi/graphify | Conditional: external installer |
| Humanizer-zh-TW | Yes | `humanizer-zh-tw` | https://github.com/kevintsai1202/Humanizer-zh-TW | Candidate: needs repo-root copy handling |
| Canvas UI skill | Yes | `canvas-ui-design` | https://github.com/cskwork/canvas-ui-skill | Candidate: no license declared upstream |

## 1. Impeccable

User label: `lmpeccable`

Status: found. The likely intended spelling is **Impeccable**.

Sources:

- Website: https://impeccable.style/
- GitHub: https://github.com/pbakaus/impeccable

What it is:

- Enhanced frontend design skill.
- Focused on production-grade, anti-generic frontend interfaces.
- The repo includes agent-specific skill builds such as `.agents/skills/impeccable/SKILL.md` and `.claude/skills/impeccable/SKILL.md`.

Upstream install options:

```bash
npx impeccable skills install
npx skills add pbakaus/impeccable
```

Recommended Agent Skill Dock integration:

- Add as `impeccable`.
- Prefer copying the harness-specific build:
  - Codex: `.agents/skills/impeccable`
  - Claude: `.claude/skills/impeccable`
- Fallback to `plugin/skills/impeccable` if a generic skill copy is needed.
- Keep separate from `frontend-design`; treat as an additional stronger design-review/design-build skill, not a replacement until tested.

## 2. Taste Skill

Status: found.

Sources:

- GitHub: https://github.com/Leonxlnx/taste-skill
- Website: https://tasteskill.dev/

What it is:

- Anti-slop frontend framework for AI agents.
- Improves layout, typography, spacing, motion, and visual direction.
- Includes multiple specialized skills.

Relevant upstream skill names found in `skills/*/SKILL.md`:

- `design-taste-frontend`
- `design-taste-frontend-v1`
- `gpt-taste`
- `redesign-existing-projects`
- `high-end-visual-design`
- `full-output-enforcement`
- `minimalist-ui`
- `industrial-brutalist-ui`
- `stitch-design-taste`
- `image-to-code`
- `imagegen-frontend-web`
- `imagegen-frontend-mobile`
- `brandkit`

Upstream install options:

```bash
npx skills add https://github.com/Leonxlnx/taste-skill
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
```

Recommended Agent Skill Dock integration:

- Add a curated default first:
  - `design-taste-frontend`
  - `gpt-taste`
  - `redesign-existing-projects`
  - `high-end-visual-design`
- Add optional groups later:
  - `taste-imagegen`
  - `taste-stitch`
  - `taste-style-variants`
- Do not install every Taste skill by default at first; too many overlapping visual-direction skills may confuse agent selection.

## 3. UI Skills

Status: found.

Sources:

- Website: https://www.ui-skills.com/
- GitHub: https://github.com/ibelick/ui-skills

What it is:

- Curated UI/design-engineering skill set.
- The website is broader and lists many design-engineering skills.
- The GitHub repo currently contains a smaller concrete installable set.

Installable skill files found in the repo:

- `baseline-ui`
- `fixing-accessibility`
- `fixing-metadata`
- `fixing-motion-performance`

Upstream install option:

```bash
npx skills add https://github.com/ibelick/ui-skills
```

Recommended Agent Skill Dock integration:

- Add the four concrete repo skills first.
- Treat the wider `ui-skills.com` catalog as discovery/reference, not a single installable package.
- Consider a category command later:

```bash
agent-skill-dock install --category ui-engineering
```

## 4. Motion AI Kit

Status: found.

Sources:

- Official docs: https://motion.dev/docs/ai-kit-install
- npm package: https://www.npmjs.com/package/motion-ai

What it is:

- Motion-focused AI kit for animation, motion best practices, performance audits, CSS spring generation, Motion docs/examples, and visual transition tooling.
- Includes MCP setup plus skills.

Upstream install options:

```bash
npx motion-ai
```

Token-gated skill installer from official docs:

```bash
curl -sL "https://api.motion.dev/registry/skills/motion-ai-kit?token=YOUR_TOKEN" -o /tmp/ai-kit.sh && bash /tmp/ai-kit.sh
```

Important constraint:

- Motion AI Kit skills require a personal token / Motion+ access for the token-gated registry path.
- Agent Skill Dock should not bundle private/token-gated skill contents.

Recommended Agent Skill Dock integration:

- Add as optional external installer, not as bundled skill.
- Provide a wrapper command later:

```bash
agent-skill-dock install motion-ai-kit --external
```

- Prompt for `MOTION_TOKEN` or read it from env.
- Dry-run must explain that this calls Motion's official installer.

## 5. Better Icons

Status: found.

Sources:

- Skill repo: https://github.com/jscraik/Agent-Skills
- Better Icons package/site references: https://www.npmjs.com/package/better-icons
- Better Icons package repo: https://github.com/better-auth/better-icons

What it is:

- Skill + MCP/CLI workflow for finding and extracting SVG icons from Iconify collections.
- Helps avoid inconsistent AI-generated icons and large pasted SVGs.

Installable skill path found in repo:

```text
Skills/frontend-ui/better-icons/SKILL.md
```

Skill name:

```text
better-icons
```

Related MCP/CLI setup:

```bash
npx better-icons setup
npx better-icons search arrow
npx better-icons get lucide:home
```

Recommended Agent Skill Dock integration:

- Add the `better-icons` skill from `jscraik/Agent-Skills`.
- Later add optional MCP setup:

```bash
agent-skill-dock install better-icons --with-mcp
```

- Keep MCP setup opt-in because it writes agent config files, not just skill directories.

## 6. DESIGN.md

Status: found.

Sources:

- DESIGN.md concept/library: https://designmd.ai/about
- Google Stitch skills repo: https://github.com/google-labs-code/stitch-skills
- Skill listing: https://claudemarketplaces.com/skills/google-labs-code/stitch-skills/design-md

What it is:

- `DESIGN.md` is a markdown-based design-system format that AI coding agents can read.
- `design-md` is also a Google Stitch skill that can synthesize a `DESIGN.md` from Stitch project data.

Installable skill path found in Google Stitch repo:

```text
plugins/stitch-utilities/skills/design-md/SKILL.md
```

Skill name:

```text
design-md
```

Related Stitch skills found:

- `taste-design`
- `stitch::extract-design-md`
- `stitch::manage-design-system`

Upstream install option:

```bash
npx skills add https://github.com/google-labs-code/stitch-skills --skill design-md
```

Recommended Agent Skill Dock integration:

- Add `design-md` as an optional design-system skill.
- Document that it works best with Stitch projects / Stitch MCP access.
- Separately add a repo template file later:

```text
templates/DESIGN.md
```

- Do not confuse the file format (`DESIGN.md`) with the skill (`design-md`).

## 7. Graphify

Status: found. Heavily used locally, but not promoted.

Sources:

- GitHub: https://github.com/safishamsi/graphify (also listed as Graphify-Labs/graphify; default branch `v8`; Apache-2.0)
- PyPI: `graphifyy` (double y; other `graphify*` packages are not affiliated)

What it is:

- `/graphify` skill that turns code, docs, SQL schemas, configs, and PDFs into a queryable knowledge graph (interactive HTML, JSON, `GRAPH_REPORT.md`) with god nodes, community detection, and query/path/explain tools.

Why it is not a normal `remote-skill`:

- The upstream repo has no copyable skill folder. The skill lives inside the Python package (`graphify/skill.md` plus per-platform variants such as `skill-codex.md`, and `graphify/skills/<platform>/references/`).
- `graphify install` detects the assistant and registers the skill with a `references/` sidecar. The installed skill is tied to the CLI version (`.graphify_version`).
- It also has hooks and project-scoped installs that write to project or agent config.

Upstream install options:

```bash
uv tool install graphifyy
graphify install
graphify install --platform codex
graphify install --project
```

Recommended Agent Skill Dock integration:

- Add as `type: "external-installer"`, opt-in only (for example `--with graphify`).
- Dry-run must print the exact `uv tool install graphifyy` / `graphify install --platform <agent>` commands without running them.
- Check that `graphify` is on PATH after installing and report the installed CLI version.
- Do not vendor `graphify/skill.md` into this repo; it would drift from the CLI version.

## 8. Humanizer-zh-TW

Status: found. Light local use so far.

Sources:

- GitHub: https://github.com/kevintsai1202/Humanizer-zh-TW (MIT)
- Derived from `op7418/Humanizer-zh` and `blader/humanizer`.

What it is:

- Traditional Chinese (zh-TW) skill that removes AI-writing traces from text, based on a Wikipedia "signs of AI writing" guide.
- The repo root is the skill (`SKILL.md`). A sibling skill, `text-watermark-cleaner-zh-tw/`, handles invisible Unicode and text watermarks with local Python/PowerShell scripts, and `humanizer-zh-tw` points to it for that job.

Integration blockers:

- The skill path is the repo root (`.`). The current installer copies the whole clone, which would include `.git`; it needs an exclude list (`.git`, `.gitignore`) first, the same issue the `website-cloner-template` adapter avoids by living in `adapters/`.
- Decide whether `text-watermark-cleaner-zh-tw` is installed as a second skill (it bundles scripts and a third-party license file under `scripts/`).

## 9. Canvas UI Design

Status: found. Light local use so far.

Sources:

- Skill repo: https://github.com/cskwork/canvas-ui-skill (landing page https://cskwork.github.io/canvas-ui-skill/)
- Wrapped library: https://github.com/DavidHDev/canvas-ui (33 canvas-drawn WebGL components)

What it is:

- Skill that sends the agent to Canvas UI components and constrains their use: one dominant effect per page, real content underneath, accessible fallbacks. Only for requests that explicitly ask for Canvas UI or a canvas/WebGL interaction.

Integration blockers:

- The GitHub API reports no license for the repo, so do not bundle it until the license is clarified.
- The repo root is the skill and also contains a `docs/` landing page, so a root-path copy would pull in site assets and `.git` unless an exclude list exists.

## Not installable through the Dock

Several frequently used skills are not in public skill repos:

- Codex app bundled skills such as `computer-use`, `presentations`, `pdf`, `documents`, `spreadsheets`, `imagegen`, and `sites` ship inside the Codex app plugin cache (`~/.codex/plugins/cache/openai-*`). The app manages them; the Dock cannot and should not reinstall them.
- Claude Code already receives `docx`, `pdf`, `pptx`, and `xlsx` through account sync (`~/.claude/skills/synced`).

## Suggested Next Integration Order

1. `impeccable`
2. Taste Skill curated set
3. UI Skills four-skill set
4. `better-icons` skill only
5. `design-md`
6. Motion AI Kit external installer
7. `graphify` external installer
8. `humanizer-zh-tw` after repo-root copy handling (exclude `.git`) exists
9. `canvas-ui-design` only after upstream declares a license

Reasoning:

- The first three are normal public skill repos and easiest to install safely.
- Better Icons adds most value when paired with MCP/CLI, so start with skill-only.
- `design-md` is useful but Stitch-dependent.
- Motion AI Kit should remain external/token-gated.

## Implementation Notes

When these are promoted from candidates to active installs:

1. Add entries to `skills.json`.
2. Refactor installers to read `skills.json` instead of hardcoding copy steps.
3. Support source path variants:
   - normal repo path, e.g. `skills/foo`
   - harness-specific path, e.g. `.agents/skills/impeccable`
   - nested plugin path, e.g. `plugins/stitch-utilities/skills/design-md`
4. Add optional groups:
   - `frontend-design`
   - `ui-engineering`
   - `motion`
   - `design-system`
   - `icons`
5. Keep Motion AI Kit as `external-installer` type with token/env support.
