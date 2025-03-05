Write-Host 'Powershell' $PsVersionTable.PSVersion '-' (Get-date)

New-Alias -Name "NVim" -Value $env:LOCALAPPDATA\nvim-0.10.4\bin\nvim.exe -Description "text editor"
New-Alias -Name "FFmpeg" -Value $env:LOCALAPPDATA\ffmpeg-7.1\bin\ffmpeg.exe -Description "audio & video solution"
New-Alias -Name "FFprobe" -Value $env:LOCALAPPDATA\ffmpeg-7.1\bin\ffprobe.exe -Description "audio & video solution"
New-Alias -Name "Git" -Value $env:LOCALAPPDATA\Git-2.48.1\bin\git.exe -Description "distributed version control system"
New-Alias -Name "Aria2" -Value $env:LOCALAPPDATA\aria2-1.37.0\aria2c.exe -Description "command-line download utility"
