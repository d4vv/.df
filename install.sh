#!/usr/bin/env bash

set -e
cd $(dirname $0)

setupZSH () {
  echo -e '\nInstalling ZSH...'
  apt install zsh
}

setupOHMYZSH () {
  echo -e '\nInstalling OH-MY-ZSH...'
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

createLink () {
    link_path="$1"
    target="$(pwd)/$2"
    if [ "$(readlink $link_path)" != "$target" ]; then
        if [ -L $link_path ]; then
            rm $link_path
            echo "Removed stale link in ${link_path}"
        elif [ -e $link_path ]; then
            mv $link_path "${link_path}.bak"
            echo "Backed up existing ${link_path}"
        fi
        ln -s $target $link_path
    fi
}


linkDotfiles () {
    echo -e '\nLinking dotfiles...'
    mkdir -p ~/.config
    createLink ~/.zshrc zshrc
    createLink ~/.minttyrc minttyrc
    createLink ~/.tmux.conf tmux.conf
    createLink ~/.vim vim
    createLink ~/.vimrc vimrc
}

setupVim () {
    echo -e '\nSetting up vim...'
    mkdir -p ~/.vim/swap
    mkdir -p ~/.vim/undo

    vim_plug_path=~/.vim/autoload/plug.vim
    if [ ! -e "$vim_plug_path" ]; then
        curl -fLo "$vim_plug_path" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    tput smcup
    vim --cmd 'let installing_dotfiles=1'
    tput rmcup
}

setupZSH
setupOHMYZSH
linkDotfiles
setupVim

echo -e '\nDone!'
