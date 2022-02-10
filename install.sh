#!/bin/bash
# Author:   Jhat
# Date:     2016-06-18
# Email:    cpf624@126.com
# Home:     http://jhat.pw

VIM_SRC="${BASH_SOURCE[0]}"
while [ -h "${VIM_SRC}" ]; do
    VIM_DIR="$(cd -P "$(dirname "${VIM_SRC}")" && pwd)"
    VIM_SRC="$(readlink "${VIM_SRC}")"
    [[ ${VIM_SRC} != /* ]] && VIM_SRC="${VIM_DIR}/${VIM_SRC}"
done
VIM_SRC="$(cd -P "$(dirname "${VIM_SRC}")" && pwd)"

# get os name
VIM_OS_NAME=$(uname -s | awk '{print tolower($1)}') 
case "${VIM_OS_NAME}" in
linux)
    if [ -f /etc/os-release ]; then
        VIM_OS_NAME=$(cat /etc/os-release | grep '^NAME="' | cut -d '"' -f 2 | awk '{print tolower($1)}')
    fi
;;
darwin)
    VIM_OS_NAME=macosx
;;
esac

# install vim
case "${VIM_OS_NAME}" in
ubuntu)
    sudo apt-get install git exuberant-ctags ack-grep vim
;;
centos)
    curl http://beyondgrep.com/ack-2.14-single-file > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
    yum install git ctags vim
;;
macosx)
    # brew install ctags
    brew install git ack vim
;;
esac

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp "${VIM_SRC}/vimrc" ~/.vimrc
vim +PluginInstall +qall
