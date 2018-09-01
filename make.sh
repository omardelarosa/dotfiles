#!/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles directory
dir=~/Dropbox/Code/dotfiles

# old dotfiles backup directory
olddir=~/dotfiles_old
vimolddir=~/.vim/vimfiles_old
oldfishdir=~/.config/fishfiles_old

# list of files/folders to symlink in homedir
files="agignore eslintrc vimrc rspec bash_profile tmux.conf herrie gitconfig"
fishfiles="config.fish env.fish"
vimfiles="ycm_extra_conf.py cpp.vim"
configfiles="powerline-shell.json"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# create vimfiles old dir
echo "Creating $vimolddir for backup of any existing vimfiles in ~/.vim"
mkdir -p $vimolddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir
  echo "creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

for file in $vimfiles; do
  echo "moving any existing dotfiles from ~/.vim to $olddirvim"
  mv ~/.vim/$file $vimolddir
  echo "creating vim symlinks to $file in ~/.vim directory"
  ln -s $dir/vim/$file ~/.vim/$file
done

# Fish files
for fishfile in $fishfiles; do
  echo "moving any fish files from ~ to $fishfilesold"
  mv ~/.config/fish/$fishfile $fishfiles_old
  echo "create fishfile symlink to $fishfile in ~/.config/fish directory"
  ln -s $dir/$fishfile ~/.config/fish/$fishfile
done

# Config files