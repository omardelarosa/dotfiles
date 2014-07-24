#!/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
 
# dotfiles directory
dir=$(pwd) 

# old dotfiles backup directory
olddir=~/.dotfiles_old			       

# list of files/folders to symlink in homedir
files="vimrc rspec bash_profile tmux.conf herrie gitconfig" 

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
      echo "Moving any existing dotfiles from ~ to $olddir"
          mv ~/.$file $olddir
	      echo "Creating symlink to $file in home directory."
	          cp $dir/$file ~/.$file
		done
