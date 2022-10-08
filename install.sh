#!/bin/env bash

mv -v ~/.vimrc ~/.vimrc.bak
cp -pv vimrc ~/
mv -v ~/vimrc ~/.vimrc

mv -v ~/.vim/vimrc ~/.vim/vimrc.bak
cp -rfpv .vim ~/
