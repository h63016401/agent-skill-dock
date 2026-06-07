# Candidate Skills Research

Research date: 2026-06-02, Asia/Taipei.

This file tracks online skill candidates that should be considered for future one-click installation. Candidates are active only when they are also listed in `skills.json` and wired into `install.sh` / `install.ps1`.

Current promotion status:

- Promoted to default install: `impeccable`, Taste curated set, UI Skills repo set, `better-icons`, `design-md`, `find-skills`, `code-simplifier`, `skill-creator`.
- Still optional/external: Motion AI Kit, because it requires a Motion token / Motion+ access.

## Summary

| User label | Found? | Canonical name | Source | Install readiness |
| --- | --- | --- | --- | --- |
| `lmpeccable` | Yes, likely typo | `impeccable` | https://github.com/pbakaus/impeccable | Promoted |
| Taste Skill | Yes | `design-taste-frontend` and related skills | https://github.com/Leonxlnx/taste-skill | Curated set promoted |
| UI Skills | Yes | `baseline-ui`, `fixing-accessibility`, `fixing-metadata`, `fixing-motion-performance` | https://github.com/ibelick/ui-skills | Promoted |
| Motion AI Kit | Yes | Motion AI Kit / `motion-ai` | https://motion.dev/docs/ai-kit-install | Conditional: needs Motion token |
| Better Icons | Yes | `better-icons` | https://github.com/jscraik/Agent-Skills and https://www.npmjs.com/package/better-icons | Skill promoted, MCP optional |
| `DESIGN.md` | Yes | `design-md` and DESIGN.md format | https://github.com/google-labs-code/stitch-skills | Promoted, Stitch-dependent |

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

## Suggested Next Integration Order

1. `impeccable`
2. Taste Skill curated set
3. UI Skills four-skill set
4. `better-icons` skill only
5. `design-md`
6. Motion AI Kit external installer

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
