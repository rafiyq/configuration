#!/bin/sh
HERE="$( cd "$(dirname "$0")" ; pwd -P )"

# config
ln -sfvi $HERE/tmux $HOME/.config/
ln -sfvi $HERE/git $HOME/.config/
ln -sfvi $HERE/editor/nvim $HOME/.config/
ln -sfvi $HERE/editor/helix $HOME/.config/
#ln -sfvi $HERE/editor/vim/vimrc $HOME/.vimrc
ln -sfvi $HERE/editor/sublime-text/* $HOME/.config/sublime-text/Packages/User/
ln -sfvi $HERE/shell/bash $HOME/.config/
ln -sfvi $HERE/shell/zsh $HOME/.config/
ln -sfvi $HERE/shell/fish $HOME/.config/
ln -sfvi $HERE/shell/starship/starship.toml $HOME/.config/

# Scripts
ln -sfvi $HERE/script/sh $HOME/.local/bin/
ln -sfvi $HERE/script/python $HOME/.local/bin/
ln -sfvi $HERE/script/nautilus $HOME/.local/bin/
ln -sfvi $HERE/script/powershell $HOME/.local/bin/

# Applications
# ln -sfv $HERE/apps/firefox-private.desktop $HOME/.local/share/applications/
#ln -sfv $HERE/apps/emacs.desktop $HOME/.local/share/applications/
#ln -sfv $HERE/apps/emacs-term.desktop $HOME/.local/share/applications/
#ln -sfv $HERE/apps/spacemacs.desktop $HOME/.local/share/applications/
#ln -sfv $HERE/apps/spacemacs-term.desktop $HOME/.local/share/applications/
