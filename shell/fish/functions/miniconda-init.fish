# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
function miniconda-init
    set -gx CONDA_EXE "$HOME/.miniconda3/bin/conda"
    if test -f $CONDA_EXE
        eval $CONDA_EXE "shell.fish" hook $argv | source
    end
end
# <<< conda initialize <<<
