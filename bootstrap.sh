#!/bin/bash

set -ex

curl -O https://raw.githubusercontent.com/FreedomBen/canvas-development-tools/master/CODES.sh
chmod +x CODES.sh

# Install Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get -y install nodejs

# Install the ruby dependencies
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.4 ruby2.4-dev libxmlsec1-dev

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get -y install yarn=0.27.5-1

# This image has some locale settings missing and causes the postgresql cluster to fail at initialization.
echo -e "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" >> /etc/environment

# The following will install postgresql-9.3 (initialization of the cluster is taken care of by the canvas installation script
sudo apt-get -y install postgresql postgresql-contrib

# NOW, run CODES.sh
# ./CODES.sh --full
