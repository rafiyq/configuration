Write-Host 'Powershell' $PsVersionTable.PSVersion '-' (Get-date)

$profileDir = Split-Path -Path $PROFILE -Parent

Invoke-Expression -Command (Get-Content $profileDir\aliases.ps1 -Raw)
Invoke-Expression -Command (Get-Content $profileDir\functions.ps1 -Raw)

