New-Alias -Name "Aria2" -Value $env:LOCALAPPDATA\aria2-1.37.0\aria2c.exe -Description "command-line download utility"
New-Alias -Name "FFmpeg" -Value $env:LOCALAPPDATA\ffmpeg-7.1\bin\ffmpeg.exe -Description "audio & video solution"
New-Alias -Name "FFprobe" -Value $env:LOCALAPPDATA\ffmpeg-7.1\bin\ffprobe.exe -Description "audio & video solution"
New-Alias -Name "Git" -Value $env:LOCALAPPDATA\Git-2.48.1\bin\git.exe -Description "distributed version control system"
New-Alias -Name "MicroMamba" -Value $env:LOCALAPPDATA\micromamba-2.0.5\bin\micromamba.exe -Description "cross-platform package manager"
New-Alias -Name "NVim" -Value $env:LOCALAPPDATA\nvim-0.10.4\bin\nvim.exe -Description "text editor"

# Git Shortcut
function Git-Status { git status } 
function Git-StatusShort { git status --short } 
New-Alias -Name "gst" -Value Git-Status
New-Alias -Name "gss" -Value Git-StatusShort

function Git-Add { git add $args } 
function Git-AddAll { git add --all } 
New-Alias -Name "ga" -Value Git-Add
New-Alias -Name "gaa" -Value Git-AddAll

function Git-CommitMessage { git commit --message $args } 
function Git-CommitMessageAdd { git commit --all --message $args } 
New-Alias -Name "gcmsg" -Value Git-CommitMessage
New-Alias -Name "gcam" -Value Git-CommitMessageAdd

function Git-Diff { git diff $args } 
function Git-Clone { git clone --recurse-submodules $args } 
New-Alias -Name "gd" -Value Git-Diff
New-Alias -Name "git clone" -Value Git-Clone
