#!/bin/bash

function cpmd {
    if [ ! -d "$2" ]; then
        mkdir -p "$2"
    fi
    cp -R "$1" "$2"
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dfiles=( ".xinitrc" ".Xdefaults" ".vimrc" ".vimrc-keymaps" ".sbclrc" ".emacs"
".xmobarrc" ".zshrc" )

ddfiles=( ".xmonad/xmonad.hs" ".vim/colors/sweyla327140.vim" )

echo "[-] FILES"

for i in ${dfiles[@]}
do
    cp -r "$HOME/$i" "$DIR/$i" 
    echo -e "\t+ Copied $HOME/$i to $DIR/$i"
    git add $i
done

for j in "${ddfiles[@]}"
do
    cpmd "$HOME/$j" "$DIR/$j"
    echo -e "\t+ Copied $HOME/$j to $DIR/$j"
    git add $j
done

