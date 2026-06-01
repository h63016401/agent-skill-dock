---
name: website-cloner-template
description: Use the AI Website Cloner Template workflow for authorized website reconstruction, migration, learning, and source recovery tasks. Trigger when the user wants to clone or rebuild a website they own or are allowed to analyze into a modern Next.js codebase.
---

# Website Cloner Template

Use this skill when the user wants to create a new project from `JCodesMore/ai-website-cloner-template`.

## Safety boundary

Only proceed when the target website is owned by the user, explicitly authorized, or being used for lawful learning and analysis. Do not help with phishing, impersonation, credential collection, brand abuse, or violating a site's terms of service.

## Workflow

1. Ask for the target URL and desired local project folder if missing.
2. Clone the template:

```bash
git clone https://github.com/JCodesMore/ai-website-cloner-template.git <project-folder>
cd <project-folder>
npm install
```

3. Start the user's preferred agent from inside the new project. Claude Code is the upstream recommendation, but Codex and other agents can use the included `AGENTS.md`.
4. Follow the template's instructions for `/clone-website`.
5. After generation, run the project's verification commands from its README before presenting the result.

## Notes

- Keep extracted assets and generated code inside the new project folder.
- Preserve attribution and legal boundaries for third-party logos, copy, images, and brand assets.
- If the user is migrating their own live website, focus on reconstructing layout, design tokens, components, and content they are authorized to reuse.
