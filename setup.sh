#!/bin/bash
############################
# .setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/Projects/dotfiles
############################

########## Variables

# dotfiles directory
dir=$(dirname $(readlink -f $0))

# old dotfiles backup directory
olddir=$(dirname $(readlink -f $0))/backups

# list of files/folders to symlink in homedir
files=(
    ".bash_profile"
    ".profile"
    ".bashrc"
    ".bash_aliases"
    ".gitconfig"
)

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ... "
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to backup directory, then create symlinks
# from the homedir to any files in the dotfiles directory specified in $files
for dot_file in ${files[@]}; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$dot_file $olddir/$dot_file
    echo "Creating symlink to $dot_file in home directory."
    ln -s $dir/$dot_file ~/$dot_file
done
