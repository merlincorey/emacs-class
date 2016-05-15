#!/bin/sh
###
### Install the dotemacs files and folders to the local user
###

install_dotemacs () {
  cat .emacs | sed -e "s/NAMENAMENAME/$USER/" -e "s|HOMEHOMEHOME|$HOME|" > ~/.emacs
  cp .emacs-custom ~/
  cp -R .emacs.d ~/
}

echo "This program will install the dotemacs files into your home directory."
echo "WARNING: If they already exist, they will be overwritten!"
read -p "Continue (y/N)? " choice
case "$choice" in
    y|Y ) install_dotemacs;;
    n|N|'' ) echo "Maybe next time.";;
    * ) echo "Are you okay?";;
    esac

