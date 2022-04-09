#!/bin/bash

zsh_config_path=~/.config/zsh
prefix=$(dirname $(readlink -f $0))
[ ! -z "$1" ] && prefix=$1 

echo "Select version of zsh."
while true; do
    echo -n "(z)sh; (o)h-my-zsh; (g)rml: "
    read z
    case $z in
        "z"|"Z")
            echo "zsh selected."
            rm -ir ~/.config/zsh
            ln -sf $prefix/only-zsh $zsh_config_path
            break
            ;;
        "o"|"O")
            echo "oh-my-zsh selected."
            rm -ir ~/.config/zsh
            ln -sf $prefix/oh-my-zsh $zsh_config_path
            break
            ;;
        "g"|"G")
            echo "grml selected."
            rm -ir ~/.config/zsh
            ln -sf $prefix/grml $zsh_config_path
            break
            ;;
        *)
            echo "Invalid option $z"
            continue
            ;;
    esac
done
