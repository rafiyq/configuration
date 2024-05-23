# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
function micromamba-init
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
end
# <<< mamba initialize <<<
