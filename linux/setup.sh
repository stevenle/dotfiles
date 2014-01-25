#!/bin/sh

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:duh/golang
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git-core golang tmux vim

cd "$(dirname "$0")"
cwd=$(pwd -P)

cp \
  $cwd/.bash_aliases \
  $cwd/.bashrc \
  $cwd/.gitconfig \
  $cwd/.inputrc \
  $cwd/.vimrc \
  $cwd/.tmux.conf \
  $HOME
mkdir -p $HOME/.vim/{backups,swaps,undo}

# Set up go.
mkdir -p $HOME/go/src
