if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
end

# Environment variable
set -gx EDITOR nvim
set -gx BROWSER none

# Prompt
#oh-my-posh init fish | source
starship init fish | source
