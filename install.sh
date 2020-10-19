#!/bin/sh
apt-get update && apt-get install -y vim cscope ctags hunspell-en-gb hunspell-pl git
pip3 install jedi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
cp -r .vim ~/
cp -r .vimrc ~/
