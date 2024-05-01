# Nodejs
set VERSION v18.17.1
set DISTRO linux-x64
fish_add_path /usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin

# Android SDK
set -x ANDROID_HOME $HOME/Android/Sdk
fish_add_path --append $ANDROID_HOME/emulator
fish_add_path --append $ANDROID_HOME/platform-tools

# Java
# corretto-19.0.2
set -x JAVA_HOME $HOME/.jdks/corretto-19.0.2

# Rust
source $HOME/.cargo/env.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
function conda-init
    if test -f /home/rafiyq/.miniconda3/bin/conda
        eval /home/rafiyq/.miniconda3/bin/conda "shell.fish" hook $argv | source
    end
end
# <<< conda initialize <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
function mamba-init
    set -gx MAMBA_EXE /opt/micromamba/bin/micromamba
    set -gx MAMBA_ROOT_PREFIX "$HOME/.micromamba"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
end
# <<< mamba initialize <<<
