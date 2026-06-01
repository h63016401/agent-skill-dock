param(
  [ValidateSet("claude", "codex", "both")]
  [string]$Agent = "both",

  [ValidateSet("user", "project")]
  [string]$Scope = "user",

  [switch]$DryRun,
  [switch]$Force,
  [switch]$CodexCompat
)

$ErrorActionPreference = "Stop"

$RepoUrl = if ($env:AGENT_SKILL_DOCK_REPO) {
  $env:AGENT_SKILL_DOCK_REPO
} else {
  "https://github.com/h63016401/agent-skill-dock.git"
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw "Missing required command: git"
}

$TmpDir = Join-Path ([System.IO.Path]::GetTempPath()) ("agent-skill-dock-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $TmpDir | Out-Null

function Invoke-GitClone {
  param(
    [string]$Repo,
    [string]$Destination
  )

  git clone --depth 1 $Repo $Destination | Out-Null
  if ($LASTEXITCODE -ne 0) {
    throw "git clone failed: $Repo"
  }
}

function Write-SkillMetadata {
  param(
    [string]$Destination,
    [string]$SkillId,
    [string]$SourceRepo,
    [string]$SourcePath
  )

  $metadata = [ordered]@{
    installedBy = "agent-skill-dock"
    skillId = $SkillId
    sourceRepo = $SourceRepo
    sourcePath = $SourcePath
    installedAt = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
  } | ConvertTo-Json

  Set-Content -Path (Join-Path $Destination ".agent-skill-dock.json") -Value $metadata -Encoding UTF8
}

function Copy-AgentSkill {
  param(
    [string]$SkillId,
    [string]$SourceDir,
    [string]$TargetRoot,
    [string]$SourceRepo,
    [string]$SourcePath
  )

  if (-not (Test-Path $SourceDir -PathType Container)) {
    throw "Missing source directory: $SourceDir"
  }

  $dest = Join-Path $TargetRoot $SkillId

  if ($DryRun) {
    Write-Host "[dry-run] $SkillId -> $dest"
    return
  }

  New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null

  if (Test-Path $dest) {
    if (-not $Force) {
      Write-Host "Skip existing skill: $dest (use -Force to replace)"
      return
    }

    $backup = "$dest.backup.$(Get-Date -Format yyyyMMddHHmmss)"
    Move-Item -Path $dest -Destination $backup
    Write-Host "Backed up existing skill: $backup"
  }

  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Copy-Item -Path (Join-Path $SourceDir "*") -Destination $dest -Recurse -Force
  Write-SkillMetadata -Destination $dest -SkillId $SkillId -SourceRepo $SourceRepo -SourcePath $SourcePath
  Write-Host "Installed: $dest"
}

function Install-ToRoot {
  param([string]$TargetRoot)

  Copy-AgentSkill `
    -SkillId "frontend-design" `
    -SourceDir (Join-Path $AnthropicDir "skills/frontend-design") `
    -TargetRoot $TargetRoot `
    -SourceRepo "anthropics/skills" `
    -SourcePath "skills/frontend-design"

  Copy-AgentSkill `
    -SkillId "vercel-react-best-practices" `
    -SourceDir (Join-Path $VercelDir "skills/react-best-practices") `
    -TargetRoot $TargetRoot `
    -SourceRepo "vercel-labs/agent-skills" `
    -SourcePath "skills/react-best-practices"

  Copy-AgentSkill `
    -SkillId "vercel-react-native-skills" `
    -SourceDir (Join-Path $VercelDir "skills/react-native-skills") `
    -TargetRoot $TargetRoot `
    -SourceRepo "vercel-labs/agent-skills" `
    -SourcePath "skills/react-native-skills"

  Copy-AgentSkill `
    -SkillId "website-cloner-template" `
    -SourceDir (Join-Path $DockDir "adapters/website-cloner-template") `
    -TargetRoot $TargetRoot `
    -SourceRepo "JCodesMore/ai-website-cloner-template" `
    -SourcePath "."
}

try {
  Write-Host "Agent Skill Dock"
  Write-Host "Target agent: $Agent"
  Write-Host "Scope: $Scope"

  if ($env:AGENT_SKILL_DOCK_LOCAL_DIR) {
    $DockDir = $env:AGENT_SKILL_DOCK_LOCAL_DIR
  } else {
    $DockDir = Join-Path $TmpDir "agent-skill-dock"
    Invoke-GitClone -Repo $RepoUrl -Destination $DockDir
  }

  $AnthropicDir = Join-Path $TmpDir "anthropics-skills"
  $VercelDir = Join-Path $TmpDir "vercel-agent-skills"

  Invoke-GitClone -Repo "https://github.com/anthropics/skills.git" -Destination $AnthropicDir
  Invoke-GitClone -Repo "https://github.com/vercel-labs/agent-skills.git" -Destination $VercelDir

  if ($Scope -eq "user") {
    $ClaudeRoot = Join-Path $HOME ".claude/skills"
    $CodexRoot = Join-Path $HOME ".agents/skills"
    $CodexCompatRoot = Join-Path $HOME ".codex/skills"
  } else {
    $ClaudeRoot = Join-Path (Get-Location) ".claude/skills"
    $CodexRoot = Join-Path (Get-Location) ".agents/skills"
    $CodexCompatRoot = Join-Path (Get-Location) ".codex/skills"
  }

  if ($Agent -eq "claude" -or $Agent -eq "both") {
    Install-ToRoot -TargetRoot $ClaudeRoot
  }

  if ($Agent -eq "codex" -or $Agent -eq "both") {
    Install-ToRoot -TargetRoot $CodexRoot
  }

  if ($CodexCompat) {
    Install-ToRoot -TargetRoot $CodexCompatRoot
  }

  if ($DryRun) {
    Write-Host "Dry run complete. No files were changed."
  } else {
    Write-Host "Done. Restart your agent if new skills do not appear immediately."
  }
} finally {
  if (Test-Path $TmpDir) {
    Remove-Item -Path $TmpDir -Recurse -Force
  }
}
