#!/bin/env bash

# Backup the vim configuration file in the $HOME directory.
mv -v ~/.vimrc ~/.vimrc.bak
# Copy the configuration files in this directory to the $HOME directory.
cp -rfpv vim ~/.vimrc
# Confirm whether the name is correct, if not correct file name.
#mv -v ~/vim ~/.vimrc
#mv -v ~/vimrc ~/.vimrc

# Backup vim configuration files in the $HOME/.vim directory.
mv -v ~/.vim/vimrc ~/.vim/vimrc.bak
# Copy the configuration files in this directory to the $HOME/.vim directory.
#cp -rfpv .vim ~/
