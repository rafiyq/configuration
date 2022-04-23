#!/bin/sh

## Clone oh-my-zsh
ohmyz_url="https://github.com/ohmyzsh/ohmyzsh.git"
ohmyz_dir=$HOME/.config/oh-my-zsh
[ ! -d $ohmyz_dir ] && git clone $ohmyz_url $ohmyz_dir 

## plugins
git clone https://github.com/esc/conda-zsh-completion $ohmyz_dir/plugins/conda-zsh-completion
