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
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim pathogen plugins.
cd $HOME/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jnwhiteh/vim-golang.git

# Set up golang.
mkdir -p $HOME/go/src /tmp/golang
cd /tmp/golang
curl -O https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz
tar xvzf go1.2.linux-amd64.tar.gz
sudo mv go /usr/local/go
