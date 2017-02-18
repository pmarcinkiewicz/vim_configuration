#!/bin/sh
apt-get update && apt-get install -y vim cscope ctags myspell-en-gb myspell-pl
cp -r .vim ~/
cp -r .vimrc ~/
