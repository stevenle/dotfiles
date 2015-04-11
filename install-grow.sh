#!/bin/sh

set -e

# sudo apt-get update
# sudo apt-get install -y curl python python-pip unzip wget
# platform=Linux
platform=Mac

output_dir=$HOME/bin
grow_version=$(curl -silent https://api.github.com/repos/grow/pygrow/releases | grep tag_name | head -n 1 | cut -d '"' -f4)
grow_zip_filename=Grow-SDK-$platform-$grow_version.zip
grow_download_url=https://github.com/grow/pygrow/releases/download/$grow_version/Grow-SDK-$platform-$grow_version.zip

wget -O /tmp/$grow_zip_filename $grow_download_url
unzip /tmp/$grow_zip_filename -d $output_dir
