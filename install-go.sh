#!/bin/sh
#
# Copyright 2015 Steven Le (stevenle08@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

GO_VERSION=1.6.2

cd /tmp
wget https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz
tar xvzf go${GO_VERSION}.linux-amd64.tar.gz
sudo mv go /usr/local/go

cd $HOME/.vim/bundle
git clone https://github.com/fatih/vim-go.git
