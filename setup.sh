#!/bin/sh

# config
ln -sfvi $PWD/bin $HOME/.local/
ln -sfvi $PWD/tmux/tmux.conf $HOME/.tmux.conf
ln -sfvi $PWD/git $HOME/.config/
ln -sfvi $PWD/editor/nvim $HOME/.config/
ln -sfvi $PWD/editor/helix $HOME/.config/
#ln -sfvi $PWD/editor/vim/vimrc $HOME/.vimrc
ln -sfvi $PWD/editor/sublime-text/* $HOME/.config/sublime-text/Packages/User/

# Applications
# ln -sfv $PWD/apps/firefox-private.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/emacs.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/emacs-term.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/spacemacs.desktop $HOME/.local/share/applications/
#ln -sfv $PWD/apps/spacemacs-term.desktop $HOME/.local/share/applications/

# zsh
ln -sfvi $PWD/zsh $HOME/.config/

#$PWD/zsh/grml-zsh.sh
#$PWD/zsh/oh-my-zsh.sh
#$PWD/editor/emacs/setup.sh
