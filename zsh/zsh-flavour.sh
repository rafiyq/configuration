#!/bin/bash

if [ ! -f $HOME/.zenv ] 
then
    ln -sf $HOME/.config/zsh/zenv $HOME/.zenv
    source $HOME/.zenv
fi

zshrc=$ZDOTDIR/.zshrc
prefix=$(dirname $(readlink -f $0))
[ ! -z "$1" ] && prefix=$1 

echo "Select version of zsh."
while true; do
    echo -n "(z)sh; (o)h-my-zsh; (g)rml: "
    read z
    case $z in
        "z"|"Z")
            echo "zsh selected."
            ln -sf $ZDOTDIR/only-zsh/myzshrc $zshrc
            break
            ;;
        "o"|"O")
            echo "oh-my-zsh selected."
            ln -sf $ZDOTDIR/ohmyzsh/ohmyzrc $zshrc
            break
            ;;
        "g"|"G")
            echo "grml selected."
            ln -sf $ZDOTDIR/grml/zshrc $zshrc
            break
            ;;
        *)
            echo "Invalid option $z"
            continue
            ;;
    esac
done
