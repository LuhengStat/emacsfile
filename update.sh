#!/bin/sh
source ~/.bash_profile
cp -R ~/.emacs.d/myini/* ~/Documents/GitHub/emacsfile/myini/
cp -R ~/.emacs.d/snippets/* ~/Documents/GitHub/emacsfile/snippets/
cp -R ~/.emacs ~/Documents/GitHub/emacsfile/
currentPath=`pwd`
cd ~/Documents/GitHub/emacsfile
gitadd .
gitcommit "$1" 
gitpush
cd $currentPath
