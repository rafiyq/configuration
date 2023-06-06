function prompt {
  param ($profile)

  $myPWD = $(Get-WorkingDirectory 3 2 15 20)
  $host.ui.RawUI.WindowTitle = "Current Folder: $myPWD"

  switch ($PROMPT_PROFILE) {
    "Ubuntu" {
      Write-Host (MakeBold "$([Environment]::UserName)@$([Environment]::MachineName)") -ForegroundColor DarkGreen -NoNewLine 
      Write-Host (MakeBold ":") -ForegroundColor White -NoNewLine 
      Write-Host (MakeBold $myPWD) -ForegroundColor DarkBlue -NoNewLine
      Write-Host (MakeBold $(if ($NestedPromptLevel -ge 1) { ">>" }))  -NoNewLine
      return "$ "
    }
    Default {
      if ($IsWindows) {
        $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = [Security.Principal.WindowsPrincipal] $identity
        $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

        Write-Host $(if (Test-Path variable:/PSDebugContext) { "[DBG]: " }
          elseif($principal.IsInRole($adminRole)) { "[ADMIN]: " }
          else { '' }
        ) -NoNewLine
      }

      Write-Host "PS " -NoNewLine
      Write-Host $myPWD -NoNewLine
      Write-Host $(if ($NestedPromptLevel -ge 1) { ">>" })  -NoNewLine
      return "> "
    }
  }
}

function Get-WorkingDirectory {
  param (
    $TrunAfter,
    $NotTrunc,
    $MaxDirChar,
    $MaxPWDChar
  )

  $DirectoryList = $pwd.Path.Replace($HOME, '~').Split($pwd.Provider.ItemSeparator)
  $NTrunc = 0..($DirectoryList.Length - $NotTrunc - 1)
  
  if (($DirectoryList -join $pwd.Provider.ItemSeparator).Length -gt $MaxPWDChar) {
    foreach ($i in 0..($DirectoryList.Length - 1)) {
      $DirName = $DirectoryList[$i]
      if ($DirName.Length -gt $MaxDirChar) {
        $DirectoryList[$i] = $DirName.Substring(0, $MaxDirChar) + "…"
      }
    }
  }

  if (($DirectoryList -join $pwd.Provider.ItemSeparator).Length -gt $MaxPWDChar) {
    foreach ($i in $NTrunc) {
      $DirName = $DirectoryList[$i]
      if ($DirName.Length -gt 1 -And $DirName -match "^\.") {
        $DirectoryList[$i] = $DirectoryList[$i].Substring(0,2)
      }
      ElseIf ($DirName.Length -gt 1) {
        $DirectoryList[$i] = $DirectoryList[$i][0]
      }
    }
  }
  return ($DirectoryList -join $pwd.Provider.ItemSeparator)
}

function MakeBold {
  param ($String)

  return  ("**$String**" | ConvertFrom-Markdown -AsVT100EncodedString).VT100EncodedString.Trim()
}

function Get-GitStatus($repoDir) {
  $repoDir = git rev-parse --show-toplevel 2>$null

  if (!$repoDir) { return }

  $status = (
    git -C $repoDir --no-optional-locks status -z -b
  ).Split(0, [System.StringSplitOptions]::RemoveEmptyEntries)

  $ahead = $status -match '^##.*\[ahead \d+\]?'
  $behind = $status -match '^##.*\[?behind \d+\]'
  $dirty = $status.length -gt 1
  $branch = $status[0] -match '^## (?<branch>[^\.]*)'

  Write-Output $ahead
  Write-Output $behind
  Write-Output $dirty
  Write-Output $branch

}
