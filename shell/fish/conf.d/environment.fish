# Nodejs
set VERSION v18.16.1
set DISTRO linux-x64
fish_add_path /usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin

# Android SDK
set ANDROID_HOME $HOME/Android/Sdk
fish_add_path --append $ANDROID_HOME/emulator
fish_add_path --append $ANDROID_HOME/platform-tools
