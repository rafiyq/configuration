function mamba-init
    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba init' !!
    set -gx MAMBA_EXE "/home/rafiyq/.local/bin/micromamba"
    set -gx MAMBA_ROOT_PREFIX "/home/rafiyq/Development/micromamba"
    $MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
    # <<< mamba initialize <<<
end
