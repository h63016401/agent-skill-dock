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

function Invoke-GitCloneSparse {
  param(
    [string]$Repo,
    [string]$Destination,
    [string[]]$Paths
  )

  git clone --depth 1 --filter=blob:none --sparse $Repo $Destination | Out-Null
  if ($LASTEXITCODE -ne 0) {
    throw "git clone failed: $Repo"
  }

  Push-Location $Destination
  try {
    git sparse-checkout set @Paths | Out-Null
    if ($LASTEXITCODE -ne 0) {
      throw "git sparse-checkout failed: $Repo"
    }
  } finally {
    Pop-Location
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
  param(
    [string]$TargetRoot,
    [string]$TargetAgent = "generic"
  )

  $ImpeccableSource = Join-Path $ImpeccableDir "plugin/skills/impeccable"
  $ImpeccableSourcePath = "plugin/skills/impeccable"

  $ClaudeImpeccable = Join-Path $ImpeccableDir ".claude/skills/impeccable"
  $CodexImpeccable = Join-Path $ImpeccableDir ".agents/skills/impeccable"

  if ($TargetAgent -eq "claude" -and (Test-Path $ClaudeImpeccable -PathType Container)) {
    $ImpeccableSource = $ClaudeImpeccable
    $ImpeccableSourcePath = ".claude/skills/impeccable"
  } elseif ($TargetAgent -eq "codex" -and (Test-Path $CodexImpeccable -PathType Container)) {
    $ImpeccableSource = $CodexImpeccable
    $ImpeccableSourcePath = ".agents/skills/impeccable"
  }

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

  Copy-AgentSkill `
    -SkillId "impeccable" `
    -SourceDir $ImpeccableSource `
    -TargetRoot $TargetRoot `
    -SourceRepo "pbakaus/impeccable" `
    -SourcePath $ImpeccableSourcePath

  Copy-AgentSkill `
    -SkillId "design-taste-frontend" `
    -SourceDir (Join-Path $TasteDir "skills/taste-skill") `
    -TargetRoot $TargetRoot `
    -SourceRepo "Leonxlnx/taste-skill" `
    -SourcePath "skills/taste-skill"

  Copy-AgentSkill `
    -SkillId "gpt-taste" `
    -SourceDir (Join-Path $TasteDir "skills/gpt-tasteskill") `
    -TargetRoot $TargetRoot `
    -SourceRepo "Leonxlnx/taste-skill" `
    -SourcePath "skills/gpt-tasteskill"

  Copy-AgentSkill `
    -SkillId "redesign-existing-projects" `
    -SourceDir (Join-Path $TasteDir "skills/redesign-skill") `
    -TargetRoot $TargetRoot `
    -SourceRepo "Leonxlnx/taste-skill" `
    -SourcePath "skills/redesign-skill"

  Copy-AgentSkill `
    -SkillId "high-end-visual-design" `
    -SourceDir (Join-Path $TasteDir "skills/soft-skill") `
    -TargetRoot $TargetRoot `
    -SourceRepo "Leonxlnx/taste-skill" `
    -SourcePath "skills/soft-skill"

  Copy-AgentSkill `
    -SkillId "baseline-ui" `
    -SourceDir (Join-Path $UiSkillsDir "skills/baseline-ui") `
    -TargetRoot $TargetRoot `
    -SourceRepo "ibelick/ui-skills" `
    -SourcePath "skills/baseline-ui"

  Copy-AgentSkill `
    -SkillId "fixing-accessibility" `
    -SourceDir (Join-Path $UiSkillsDir "skills/fixing-accessibility") `
    -TargetRoot $TargetRoot `
    -SourceRepo "ibelick/ui-skills" `
    -SourcePath "skills/fixing-accessibility"

  Copy-AgentSkill `
    -SkillId "fixing-metadata" `
    -SourceDir (Join-Path $UiSkillsDir "skills/fixing-metadata") `
    -TargetRoot $TargetRoot `
    -SourceRepo "ibelick/ui-skills" `
    -SourcePath "skills/fixing-metadata"

  Copy-AgentSkill `
    -SkillId "fixing-motion-performance" `
    -SourceDir (Join-Path $UiSkillsDir "skills/fixing-motion-performance") `
    -TargetRoot $TargetRoot `
    -SourceRepo "ibelick/ui-skills" `
    -SourcePath "skills/fixing-motion-performance"

  Copy-AgentSkill `
    -SkillId "better-icons" `
    -SourceDir (Join-Path $JscraikDir "Skills/frontend-ui/better-icons") `
    -TargetRoot $TargetRoot `
    -SourceRepo "jscraik/Agent-Skills" `
    -SourcePath "Skills/frontend-ui/better-icons"

  Copy-AgentSkill `
    -SkillId "design-md" `
    -SourceDir (Join-Path $StitchDir "plugins/stitch-utilities/skills/design-md") `
    -TargetRoot $TargetRoot `
    -SourceRepo "google-labs-code/stitch-skills" `
    -SourcePath "plugins/stitch-utilities/skills/design-md"
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
  $ImpeccableDir = Join-Path $TmpDir "impeccable"
  $TasteDir = Join-Path $TmpDir "taste-skill"
  $UiSkillsDir = Join-Path $TmpDir "ui-skills"
  $JscraikDir = Join-Path $TmpDir "jscraik-agent-skills"
  $StitchDir = Join-Path $TmpDir "stitch-skills"

  Invoke-GitClone -Repo "https://github.com/anthropics/skills.git" -Destination $AnthropicDir
  Invoke-GitClone -Repo "https://github.com/vercel-labs/agent-skills.git" -Destination $VercelDir
  Invoke-GitCloneSparse -Repo "https://github.com/pbakaus/impeccable.git" -Destination $ImpeccableDir -Paths @(
    ".agents/skills/impeccable",
    ".claude/skills/impeccable",
    "plugin/skills/impeccable"
  )
  Invoke-GitCloneSparse -Repo "https://github.com/Leonxlnx/taste-skill.git" -Destination $TasteDir -Paths @(
    "skills/taste-skill",
    "skills/gpt-tasteskill",
    "skills/redesign-skill",
    "skills/soft-skill"
  )
  Invoke-GitCloneSparse -Repo "https://github.com/ibelick/ui-skills.git" -Destination $UiSkillsDir -Paths @(
    "skills/baseline-ui",
    "skills/fixing-accessibility",
    "skills/fixing-metadata",
    "skills/fixing-motion-performance"
  )
  Invoke-GitCloneSparse -Repo "https://github.com/jscraik/Agent-Skills.git" -Destination $JscraikDir -Paths @(
    "Skills/frontend-ui/better-icons"
  )
  Invoke-GitCloneSparse -Repo "https://github.com/google-labs-code/stitch-skills.git" -Destination $StitchDir -Paths @(
    "plugins/stitch-utilities/skills/design-md"
  )

  if ($Scope -eq "user") {
    $ClaudeRoot = Join-Path $HOME ".claude/skills"
    $CodexRoot = Join-Path $HOME ".agents/skills"
    $CodexCompatRoot = Join-Path $HOME ".codex/skills"
  } else {
    $ClaudeRoot = Join-Path (Get-Location) ".claude/skills"
    $CodexRoot = Join-Path (Get-Location) ".agents/skills"
    $CodexCompatRoot = Join-Path (Get-Location) ".codex/skills"
  }

  $AutoCodexCompat = $false
  if ($Scope -eq "user" -and (Test-Path $CodexCompatRoot -PathType Container)) {
    $AutoCodexCompat = $true
  }

  if ($Agent -eq "claude" -or $Agent -eq "both") {
    Install-ToRoot -TargetRoot $ClaudeRoot -TargetAgent "claude"
  }

  if ($Agent -eq "codex" -or $Agent -eq "both") {
    Install-ToRoot -TargetRoot $CodexRoot -TargetAgent "codex"
  }

  if ($CodexCompat -or ($AutoCodexCompat -and ($Agent -eq "codex" -or $Agent -eq "both"))) {
    if (-not $CodexCompat) {
      Write-Host "Detected existing Codex compatibility path: $CodexCompatRoot"
    }
    Install-ToRoot -TargetRoot $CodexCompatRoot -TargetAgent "codex"
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
