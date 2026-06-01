#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${AGENT_SKILL_DOCK_REPO:-https://github.com/h63016401/agent-skill-dock.git}"
AGENT="both"
SCOPE="user"
DRY_RUN=0
FORCE=0
CODEX_COMPAT=0

usage() {
  cat <<'USAGE'
Agent Skill Dock installer

Usage:
  bash install.sh [options]

Options:
  --agent, --agents claude|codex|both  Target agent. Default: both
  --scope user|project                 Install scope. Default: user
  --dry-run                            Show planned writes without changing files
  --force                              Backup and replace existing installed skills
  --codex-compat                       Also install to ~/.codex/skills
  -h, --help                           Show help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --agent|--agents)
      AGENT="${2:-}"
      shift 2
      ;;
    --scope)
      SCOPE="${2:-}"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --codex-compat)
      CODEX_COMPAT=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ "$AGENT" != "claude" && "$AGENT" != "codex" && "$AGENT" != "both" ]]; then
  echo "Invalid --agent value: $AGENT" >&2
  exit 1
fi

if [[ "$SCOPE" != "user" && "$SCOPE" != "project" ]]; then
  echo "Invalid --scope value: $SCOPE" >&2
  exit 1
fi

for bin in git cp mkdir mktemp date; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Missing required command: $bin" >&2
    exit 1
  fi
done

TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo "Agent Skill Dock"
echo "Target agent: $AGENT"
echo "Scope: $SCOPE"

if [[ -n "${AGENT_SKILL_DOCK_LOCAL_DIR:-}" ]]; then
  DOCK_DIR="$AGENT_SKILL_DOCK_LOCAL_DIR"
else
  DOCK_DIR="$TMP_DIR/agent-skill-dock"
  git clone --depth 1 "$REPO_URL" "$DOCK_DIR" >/dev/null
fi

ANTHROPIC_DIR="$TMP_DIR/anthropics-skills"
VERCEL_DIR="$TMP_DIR/vercel-agent-skills"

git clone --depth 1 https://github.com/anthropics/skills.git "$ANTHROPIC_DIR" >/dev/null
git clone --depth 1 https://github.com/vercel-labs/agent-skills.git "$VERCEL_DIR" >/dev/null

write_metadata() {
  local dest="$1"
  local skill_id="$2"
  local source_repo="$3"
  local source_path="$4"
  local installed_at
  installed_at="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  cat > "$dest/.agent-skill-dock.json" <<META
{
  "installedBy": "agent-skill-dock",
  "skillId": "$skill_id",
  "sourceRepo": "$source_repo",
  "sourcePath": "$source_path",
  "installedAt": "$installed_at"
}
META
}

copy_skill() {
  local skill_id="$1"
  local source_dir="$2"
  local target_root="$3"
  local source_repo="$4"
  local source_path="$5"
  local dest="$target_root/$skill_id"

  if [[ ! -d "$source_dir" ]]; then
    echo "Missing source directory: $source_dir" >&2
    exit 1
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] $skill_id -> $dest"
    return
  fi

  mkdir -p "$target_root"

  if [[ -e "$dest" ]]; then
    if [[ "$FORCE" -ne 1 ]]; then
      echo "Skip existing skill: $dest (use --force to replace)"
      return
    fi
    local backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "Backed up existing skill: $backup"
  fi

  mkdir -p "$dest"
  cp -R "$source_dir"/. "$dest"/
  write_metadata "$dest" "$skill_id" "$source_repo" "$source_path"
  echo "Installed: $dest"
}

install_to_root() {
  local target_root="$1"

  copy_skill "frontend-design" \
    "$ANTHROPIC_DIR/skills/frontend-design" \
    "$target_root" \
    "anthropics/skills" \
    "skills/frontend-design"

  copy_skill "vercel-react-best-practices" \
    "$VERCEL_DIR/skills/react-best-practices" \
    "$target_root" \
    "vercel-labs/agent-skills" \
    "skills/react-best-practices"

  copy_skill "vercel-react-native-skills" \
    "$VERCEL_DIR/skills/react-native-skills" \
    "$target_root" \
    "vercel-labs/agent-skills" \
    "skills/react-native-skills"

  copy_skill "website-cloner-template" \
    "$DOCK_DIR/adapters/website-cloner-template" \
    "$target_root" \
    "JCodesMore/ai-website-cloner-template" \
    "."
}

if [[ "$SCOPE" == "user" ]]; then
  CLAUDE_ROOT="$HOME/.claude/skills"
  CODEX_ROOT="$HOME/.agents/skills"
  CODEX_COMPAT_ROOT="$HOME/.codex/skills"
else
  CLAUDE_ROOT="$PWD/.claude/skills"
  CODEX_ROOT="$PWD/.agents/skills"
  CODEX_COMPAT_ROOT="$PWD/.codex/skills"
fi

if [[ "$AGENT" == "claude" || "$AGENT" == "both" ]]; then
  install_to_root "$CLAUDE_ROOT"
fi

if [[ "$AGENT" == "codex" || "$AGENT" == "both" ]]; then
  install_to_root "$CODEX_ROOT"
fi

if [[ "$CODEX_COMPAT" -eq 1 ]]; then
  install_to_root "$CODEX_COMPAT_ROOT"
fi

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "Dry run complete. No files were changed."
else
  echo "Done. Restart your agent if new skills do not appear immediately."
fi
