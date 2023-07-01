if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
end

# Git shortcut
alias gss='git status --short'
alias gst='git status'

alias ga='git add'
alias gaa='git add --all'

alias gcmsg='git commit --message'
alias gcam='git commit --all --message'

alias gp='git push'
alias gd='git diff'
alias gc='git clone --recurse-submodules'

# Environment variable
set -gx EDITOR nvim
set -gx BROWSER none

# Prompt
#oh-my-posh init fish | source
starship init fish | source
