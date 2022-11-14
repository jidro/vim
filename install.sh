#!/bin/env bash

mv -v ~/.vimrc ~/.vimrc.bak
cp -rfpv vimrc ~/
mv -v ~/vimrc ~/.vimrc

mv -v ~/.vim/vimrc ~/.vim/vimrc.bak
cp -rfpv .vim ~/
