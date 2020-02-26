#!/bin/sh

set -e

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
  $cwd/.gitconfig \
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
  $cwd/.vim/after \
  $cwd/.vim/skel \
  $cwd/.vim/snippets \
  $HOME/.vim
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Copy scripts to $HOME/bin.
mkdir -p $HOME/bin/.grow-versions
ln -s \
  bin/install-grow.sh \
  $HOME/bin

# Install vim pathogen plugins.
cd $HOME/.vim/bundle
git clone https://github.com/ctrlpvim/ctrlp.vim.git
