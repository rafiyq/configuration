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
