#!/bin/sh

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:duh/golang
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git-core golang tmux vim

cd "$(dirname "$0")"
cwd=$(pwd -P)

linkhome() {
  rm $@
  ln -s $@ $HOME
}

linkhome \
  $cwd/.bash_aliases \
  $cwd/.bashrc \
  $cwd/.gitconfig \
  $cwd/.inputrc \
  $cwd/.vimrc \
  $cwd/.tmux.conf

# Set up vim.
mkdir -p \
  $HOME/.vim/autoload \
  $HOME/.vim/backup \
  $HOME/.vim/bundle \
  $HOME/.vim/swap \
  $HOME/.vim/undo
ln -s \
  $cwd/.vim/skel \
  $cwd/.vim/snippets \
  $HOME/.vim
curl -Sso ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd $HOME/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jnwhiteh/vim-golang.git

# Set up go.
mkdir -p $HOME/go/src
