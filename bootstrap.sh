#!/bin/bash

curl -O https://raw.githubusercontent.com/FreedomBen/canvas-development-tools/master/CODES.sh
chmod +x CODES.sh

# Install Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get -y install nodejs

# Install the ruby dependencies
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.1 ruby2.1-dev

# This image has some locale settings missing and causes the postgresql cluster to fail at initialization.
sudo su
echo -e "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" >> /etc/environment
# logout and then login again

# The following will install postgresql-9.3 (initialization of the cluster is taken care of by the canvas installation script
sudo apt-get install postgresql postgresql-contrib

# NOW, run CODES.sh
./CODES.sh --full
