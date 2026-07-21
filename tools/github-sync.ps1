param(
    [switch]$Watch,
    [switch]$Install,
    [switch]$Uninstall,
    [ValidateRange(5, 3600)]
    [int]$IntervalSeconds = 10
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$RepoRoot = Split-Path -Parent $PSScriptRoot
$MainBranch = "main"
$RunName = "XjzNovelGitHubAutoSync"
$RunKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$StateDir = Join-Path $env:LOCALAPPDATA "xjz-novel-script"
$LogFile = Join-Path $StateDir "github-sync.log"
$PidFile = Join-Path $StateDir "github-sync.pid"

New-Item -ItemType Directory -Force -Path $StateDir | Out-Null

function Write-Log {
    param([string]$Message)
    $line = "{0} {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message
    Add-Content -LiteralPath $LogFile -Value $line -Encoding UTF8
    if (-not $Watch) {
        Write-Host $line
    }
}

function Invoke-Git {
    param(
        [string[]]$Arguments,
        [switch]$AllowFailure,
        [switch]$Quiet
    )

    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $output = & git -C $RepoRoot @Arguments 2>&1
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousErrorAction
    }
    if ($output -and -not $Quiet) {
        $output | ForEach-Object { Write-Log ($_ | Out-String).Trim() }
    }
    if ($exitCode -ne 0 -and -not $AllowFailure) {
        throw "git $($Arguments -join ' ') failed with exit code $exitCode"
    }
    return [pscustomobject]@{
        ExitCode = $exitCode
        Output = @($output)
    }
}

function Test-GitOperationInProgress {
    $gitDirResult = Invoke-Git -Arguments @("rev-parse", "--git-dir") -Quiet
    $gitDir = ($gitDirResult.Output | Select-Object -Last 1).ToString().Trim()
    if (-not [System.IO.Path]::IsPathRooted($gitDir)) {
        $gitDir = Join-Path $RepoRoot $gitDir
    }

    return (
        (Test-Path -LiteralPath (Join-Path $gitDir "MERGE_HEAD")) -or
        (Test-Path -LiteralPath (Join-Path $gitDir "rebase-merge")) -or
        (Test-Path -LiteralPath (Join-Path $gitDir "rebase-apply"))
    )
}

function Invoke-Sync {
    try {
        if (Test-GitOperationInProgress) {
            Write-Log "Sync paused: a merge or rebase is in progress."
            return $false
        }

        $branchResult = Invoke-Git -Arguments @("branch", "--show-current") -Quiet
        $branch = ($branchResult.Output | Select-Object -Last 1).ToString().Trim()
        if ($branch -ne $MainBranch) {
            Write-Log "Sync paused: current branch is '$branch'; expected '$MainBranch'."
            return $false
        }

        $statusResult = Invoke-Git -Arguments @("status", "--porcelain", "--untracked-files=all") -Quiet
        $hasChanges = @($statusResult.Output).Count -gt 0

        if ($hasChanges) {
            Invoke-Git -Arguments @("add", "-A") | Out-Null
            $diffResult = Invoke-Git -Arguments @("diff", "--cached", "--quiet") -AllowFailure -Quiet
            if ($diffResult.ExitCode -eq 1) {
                $message = "chore: auto-sync {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
                Invoke-Git -Arguments @("commit", "-m", $message) | Out-Null
            } elseif ($diffResult.ExitCode -ne 0) {
                throw "Unable to inspect staged changes."
            }
        }

        $aheadResult = Invoke-Git -Arguments @("rev-list", "--count", "origin/$MainBranch..HEAD") -Quiet
        $ahead = [int](($aheadResult.Output | Select-Object -Last 1).ToString().Trim())
        if ($ahead -gt 0) {
            Invoke-Git -Arguments @("pull", "--rebase", "origin", $MainBranch) | Out-Null
            Invoke-Git -Arguments @("push", "origin", $MainBranch) | Out-Null
            Write-Log "Sync completed successfully."
        }

        return $true
    } catch {
        Write-Log "Sync failed safely: $($_.Exception.Message)"
        return $false
    }
}

function Install-AutoSync {
    $powerShellExe = (Get-Process -Id $PID).Path
    $runCommand = '"{0}" -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File "{1}" -Watch -IntervalSeconds {2}' -f $powerShellExe, $PSCommandPath, $IntervalSeconds
    New-Item -Path $RunKey -Force | Out-Null
    Set-ItemProperty -Path $RunKey -Name $RunName -Value $runCommand

    $existingPid = $null
    if (Test-Path -LiteralPath $PidFile) {
        $existingPid = Get-Content -LiteralPath $PidFile -ErrorAction SilentlyContinue
    }
    if (-not $existingPid -or -not (Get-Process -Id $existingPid -ErrorAction SilentlyContinue)) {
        $arguments = @(
            "-NoProfile",
            "-WindowStyle", "Hidden",
            "-ExecutionPolicy", "Bypass",
            "-File", $PSCommandPath,
            "-Watch",
            "-IntervalSeconds", $IntervalSeconds
        )
        Start-Process -FilePath $powerShellExe -ArgumentList $arguments -WindowStyle Hidden
    }

    Write-Log "Automatic GitHub sync is installed and running."
}

function Uninstall-AutoSync {
    Remove-ItemProperty -Path $RunKey -Name $RunName -ErrorAction SilentlyContinue
    if (Test-Path -LiteralPath $PidFile) {
        $watcherPid = Get-Content -LiteralPath $PidFile -ErrorAction SilentlyContinue
        if ($watcherPid -and ([int]$watcherPid -ne $PID)) {
            $process = Get-Process -Id ([int]$watcherPid) -ErrorAction SilentlyContinue
            if ($process -and $process.ProcessName -in @("powershell", "pwsh")) {
                Stop-Process -Id $process.Id -Force
            }
        }
        Remove-Item -LiteralPath $PidFile -Force -ErrorAction SilentlyContinue
    }
    Write-Log "Automatic GitHub sync is disabled."
}

if ($Install) {
    Install-AutoSync
    exit 0
}

if ($Uninstall) {
    Uninstall-AutoSync
    exit 0
}

if ($Watch) {
    $createdNew = $false
    $mutex = [System.Threading.Mutex]::new($true, "Local\XjzNovelGitHubAutoSync", [ref]$createdNew)
    if (-not $createdNew) {
        exit 0
    }

    Set-Content -LiteralPath $PidFile -Value $PID -Encoding ASCII
    try {
        Write-Log "Automatic GitHub sync watcher started."
        while ($true) {
            Invoke-Sync | Out-Null
            Start-Sleep -Seconds $IntervalSeconds
        }
    } finally {
        Remove-Item -LiteralPath $PidFile -Force -ErrorAction SilentlyContinue
        $mutex.ReleaseMutex()
        $mutex.Dispose()
    }
}

$ok = Invoke-Sync
if (-not $ok) {
    exit 1
}
