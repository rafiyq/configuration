# Git Shortcut
function Git-Status { git status } 
function Git-StatusShort { git status --short } 
New-Alias -Name "gst" -Value Git-Status
New-Alias -Name "gss" -Value Git-StatusShort

function Git-Add { git add } 
function Git-AddAll { git add --all } 
New-Alias -Name "ga" -Value Git-Add
New-Alias -Name "gaa" -Value Git-AddAll

function Git-CommitMessage { git commit --message } 
function Git-CommitMessageAdd { git commit --all --message } 
New-Alias -Name "gcmsg" -Value Git-CommitMessage
New-Alias -Name "gcam" -Value Git-CommitMessageAdd

function Git-Push { git push } 
function Git-Diff { git diff } 
function Git-Clone { git clone --recurse-submodules } 
New-Alias -Name "gp" -Value Git-Push
New-Alias -Name "gd" -Value Git-Diff
New-Alias -Name "gc" -Value Git-Clone
