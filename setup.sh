#!/bin/bash

# Dotfile/bin setup script
# Backs up all original dot files before replacing them with symlinks to the
# undotted files in this folder.  This script should be run after each pull from
# the git repo. 

dotfile_backup=$HOME/.dotfile_backup

[[ ! -d $dotfile_backup ]] && mkdir $dotfile_backup

# Add any new dotfiles to this string array or they won't be recognized
dotfiles="bash_aliases
          bash_login
          bash_logout
          bashrc
          dircolors
          dircolors-256
          gitconfig
          gitignore
          profile
          sqliterc
          vimrc
          vim
         "

echo "Setting up home directory..."
echo -e "\nHooking up dotfiles:"
for f in $dotfiles; do
    original=$HOME/.$f
    #if [[ -h $original ]]; then
        #echo "$original: symlink already exists, skipping..."
        #continue
    #fi

    [[ -e $original ]] && mv $original $dotfile_backup/
    ln -sf $(pwd)/$f $HOME/.$f
    echo "Creating symlink for .$f"
done

echo -e "\nHooking up bin folder:"
# Copy the bin folder over to the home dir
[[ -d bin ]] && for f in bin/*; do
    original=$HOME/$f

    if [[ -e $original ]]; then
        echo "$original already exists; skipping..."
        continue
    fi

    ln -s $(pwd)/$f $original
    echo "Creating symlink for $f"
done

git submodule init
git submodule update

echo -e "\nInstalling vim bundles..."
vim '+read !echo Installing VIM bundles, please wait...' +BundleInstall +qall\!

echo -e "\nDone\n"



