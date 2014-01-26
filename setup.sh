#!/bin/sh

cd "$(dirname "$0")"
cwd=$(pwd -P)

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tmux vim

forcelink() {
  for arg in "$@"; do
    path=$HOME/$(basename $arg)
    if [ -e "$path" ]; then
      rm $path
    fi
  done
  ln -s $@ $HOME
}

# Symlink dotfiles into home dir.
forcelink \
  $cwd/.bash_aliases \
  $cwd/.bashrc \
  $cwd/.gitconfig \
  $cwd/.inputrc \
  $cwd/.vimrc \
  $cwd/.tmux.conf

exit

# Set up vim.
mkdir -p \
  $HOME/.vim/autoload \
  $HOME/.vim/backups \
  $HOME/.vim/bundle \
  $HOME/.vim/swaps \
  $HOME/.vim/undo
ln -s \
  $cwd/.vim/skel \
  $cwd/.vim/snippets \
  $HOME/.vim
curl -Sso ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Install vim pathogen plugins.
cd $HOME/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jnwhiteh/vim-golang.git

# Set up golang.
# TODO(stevenle): Install from source.
sudo add-apt-repository ppa:duh/golang
sudo apt-get update
sudo apt-get install golang
mkdir -p $HOME/go/src
