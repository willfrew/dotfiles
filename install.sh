#!/bin/bash

# Inspiration from:
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

DOTFILES=~/dotfiles
DOTFILESBAK=~/dotfiles_bak

echo "Creating $DOTFILESBAK to backup any existing dotfiles in ~"
mkdir -p $DOTFILESBAK
echo "done."

echo "Moving existing dotfiles from ~ to $DOTFILESBAK"
for file in $DOTFILES/*; do
    filename=$(basename $file)

    mv ~/.$filename $DOTFILESBAK/$filename >/dev/null 2>&1
    ln -s $DOTFILES/$filename ~/.$filename
    echo "Symlinked $DOTFILES/$filename to ~/.$filename"
done
