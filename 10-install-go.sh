#!/bin/sh

set -e

if [ -z "$1" ]; then
  echo "usage: $0 <version>"
  exit 1
fi

GO_VERSION=$1

if [ "$(uname)" == "Darwin" ]; then
  filename=go${GO_VERSION}.darwin-amd64
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  filename=go${GO_VERSION}.linux-amd64
fi

cd /tmp
wget https://storage.googleapis.com/golang/${filename}.tar.gz
tar xvzf ${filename}.tar.gz
sudo mv go /usr/local/go

cd $HOME/.vim/bundle
git clone https://github.com/fatih/vim-go.git
