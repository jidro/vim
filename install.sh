#!/bin/env bash

sudo mv ~/.vimrc ~/.vimrc.bak
sudo cp vimrc ~/
sudo mv ~/vimrc ~/.vimrc

sudo mv ~/.vim/vimrc ~/.vim/vimrc.bak
sudo cp -r .vim ~/
