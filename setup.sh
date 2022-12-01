#!/bin/sh

# config
ln -sfvi $PWD/tmux/tmux.conf $HOME/.tmux.conf
ln -sfvi $PWD/git $HOME/.config/
ln -sfvi $PWD/editor/nvim $HOME/.config/
ln -sfvi $PWD/editor/helix $HOME/.config/
#ln -sfvi $PWD/editor/vim/vimrc $HOME/.vimrc
ln -sfvi $PWD/editor/sublime-text/* $HOME/.config/sublime-text/Packages/User/
ln -sfvi $PWD/shell/zsh $HOME/.config/
ln -sfvi $PWD/shell/fish $HOME/.config/

# Scripts
#ln -sfvi $PWD/bin $HOME/.local/

# Applications
# ln -sfv $PWD/apps/firefox-private.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/emacs.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/emacs-term.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/spacemacs.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/spacemacs-term.desktop $HOME/.local/share/applications/
