#!/bin/sh
zshenv=$HOME/.zshenv
[ -z $ZDOTDIR ] && export ZDOTDIR=$HOME/.config/zsh
[ ! -e $zshenv ] && echo "export ZDOTDIR=$HOME/.config/zsh" > $zshenv

## Clone oh-my-zsh
ohmyz_url="https://github.com/ohmyzsh/ohmyzsh.git"
ohmyz_dir=$HOME/.config/oh-my-zsh
[ ! -d $ohmyz_dir ] && git clone $ohmyz_url $ohmyz_dir 

## point to oh-my-zsh directory
[ ! -e $ZDOTDIR/ohmyzrc ] && cp $ohmyz_dir/templates/zshrc.zsh-template $ZDOTDIR/ohmyzrc
sed -i 's,$HOME/.oh-my-zsh,'"\$HOME/.config/oh-my-zsh"',' "$ZDOTDIR/ohmyzrc"
ln -sf $ZDOTDIR/ohmyzrc $ZDOTDIR/.zshrc

## plugins
git clone https://github.com/esc/conda-zsh-completion ~/.config/oh-my-zsh/plugins/conda-zsh-completion

## aliases
[ -f $ZDOTDIR/aliases ] && echo "source $ZDOTDIR/aliases" >> $ZDOTDIR/ohmyzrc
