#!/bin/sh

set -e

symlink() {
  for arg in "$@"; do
    path=$HOME/$(basename $arg)
    rm -f $path
  done
  ln -s $@ $HOME
}

# Symlink dotfiles into home dir.
symlink \
  $PWD/.gitconfig \
  $PWD/.vimrc \
  $PWD/.tmux.conf

mkdir -p $HOME/.zsh
cp $PWD/.zsh/*.zsh $HOME/.zsh

# Set up vim.
rm -rf $HOME/.vim
mkdir -p \
  $HOME/.vim/autoload \
  $HOME/.vim/backups \
  $HOME/.vim/bundle \
  $HOME/.vim/swaps \
  $HOME/.vim/undo
ln -s \
  $PWD/.vim/after \
  $PWD/.vim/skel \
  $PWD/.vim/snippets \
  $HOME/.vim
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Copy scripts to $HOME/bin.
mkdir -p $HOME/bin
cp $PWD/bin/* $HOME/bin

# Install vim pathogen plugins.
cd $HOME/.vim/bundle
git clone https://github.com/ctrlpvim/ctrlp.vim.git
