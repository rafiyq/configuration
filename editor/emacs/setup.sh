#!/bin/sh
spacemacs_url="https://github.com/syl20bnr/spacemacs"
spacemacs_path="$HOME/.config/spacemacs"

# clone spacemacs
[ ! -d $spacemacs_path/master ] && git clone -b master $spacemacs_url $spacemacs_path/master
[ ! -d $spacemacs_path/develop ] && git clone -b develop $spacemacs_url $spacemacs_path/develop
