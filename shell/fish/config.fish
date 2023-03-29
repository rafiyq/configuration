if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
end

function mamba-init
    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba init' !!
    set -gx MAMBA_EXE "/home/rafiyq/.local/bin/micromamba"
    set -gx MAMBA_ROOT_PREFIX "/home/rafiyq/Development/micromamba"
    $MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
    # <<< mamba initialize <<<
end

# ALIAS
alias yt-best='pwsh ~/.local/bin/powershell/ytdl.ps1 best'
alias yt-sub='pwsh ~/.local/bin/powershell/ytdl.ps1 subtitle'

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

# Starship prompt
starship init fish | source
