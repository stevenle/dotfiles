#!/bin/sh

set -e

if [ -z "$1" ]; then
  echo "usage: $0 <version>"
  exit 1
fi

GROW_VERSION=$1

mkdir -p $HOME/bin/.grow-versions
if [ ! -f $HOME/bin/.grow-versions/grow-$GROW_VERSION ]; then
  echo "downloading Grow-SDK-Mac-$GROW_VERSION.zip..."
  cd $HOME/bin/.grow-versions
  wget https://github.com/grow/grow/releases/download/$GROW_VERSION/Grow-SDK-Mac-$GROW_VERSION.zip
  unzip Grow-SDK-Mac-$GROW_VERSION.zip
  mv grow grow-$GROW_VERSION
fi

if [ -f $HOME/bin/grow ]; then
  rm $HOME/bin/grow
fi
ln -s $HOME/bin/.grow-versions/grow-$GROW_VERSION $HOME/bin/grow
echo "updated $HOME/bin/grow to $GROW_VERSION"
