#! /bin/bash

# vim
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/_vimrc ~/.vimrc

# bash
rm -f ~/.bashrc
ln -s ~/dotfiles/_bashrc ~/.bashrc
source ~/.bashrc

# neobundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
