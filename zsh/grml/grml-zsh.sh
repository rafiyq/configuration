#!/bin/sh

[ -z "$ZDOTDIR" ] && export ZDOTDIR=$HOME/.config/zsh

## Download grml-zsh
grml_url="https://git.grml.org/f/grml-etc-core/etc"
grml_path="$HOME/.config/grml" 
[ ! -d $grml_path ] && mkdir $grml_path
[ ! -e $grml_path/zsh ] && wget -O $grml_path/zsh $grml_url/zsh/zshrc
[ ! -e $grml_path/zsh-local ] && wget -O $grml_path/zsh-local $grml_url/skel/.zshrc
echo "source \$HOME/.config/grml/zsh-local" >> $grml_path/zsh 

## Plugins
git_zsh_url="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh"
plugin=$HOME/.config/grml/plugin
[ ! -d $plugin ] && mkdir $plugin
[ ! -e $plugin/git.zsh ] && wget -O $plugin/git.zsh $git_zsh_url
echo "source \$HOME/.config/grml/plugin/git.zsh" >> $grml_path/zsh-local

## aliases
[ -f $ZDOTDIR/aliases ] && echo "source \$ZDOTDIR/aliases" >> $grml_path/zsh-local
