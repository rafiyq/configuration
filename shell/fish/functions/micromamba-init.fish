# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
function micromamba-init
    set -gx MAMBA_EXE /opt/micromamba/bin/micromamba
    set -gx MAMBA_ROOT_PREFIX "$HOME/.micromamba"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
end
# <<< mamba initialize <<<
