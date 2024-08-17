$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition

New-Item -ItemType SymbolicLink -Path (Join-Path $env:APPDATA "helix") -Target (Join-Path $scriptDirectory "editor" "helix")
