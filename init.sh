#!/usr/local/bin/bash
rm -r ${HOME}/.bashrc ${HOME}/.vimrc

ln -s ${HOME}/pers/conf/bashrc ${HOME}/.bashrc
ln -s ${HOME}/pers/conf/vimrc ${HOME}/.vimrc

if ! [ -d ${HOME}/.vim ]; then
	mkdir ${HOME}/.vim
	mkdir ${HOME}/.vim/bundle
elif ! [ -d ${HOME}/.vim/bundle ]; then
	mkdir ${HOME}/.vim/bundle
fi

git clone https://github.com/gmarik/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

source ${HOME}/.bashrc
clear
