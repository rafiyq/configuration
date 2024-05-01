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
