# Canvas LMS, Ubuntu 14.04 LTS, vagrant
For this setup, I followed the instructions from the Quick start guide of Instructure Canvas LMS https://github.com/instructure/canvas-lms/wiki/Quick-Start

## Prerequisites
### Vagrant
Download and Install [Vagrant](https://www.vagrantup.com/docs/installation/)

Vagrant 1.8.1 has a regression when it comes to installing `vagrant-vbguest` plugin. Download the vagrant deb file manually:

```shell
wget https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.deb
```

Install virtualbox plugin for vagrant.
```
vagrant plugin install vagrant-vbguest
```

### Virtualbox
Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Prepare the canvas vagrant image
Clone this repo:
```
git clone git@github.com:andreas-kokkalis/canvas_lms_vagrant.git
```

Provision a new machine according the the configuration of Vagrantfile
```
vagrant up
```
After the machine is up, ssh
```
vagrant ssh
```

You can begin the installation process by executing the commands in the order specified below:

Get the canvas installation script:
```shell
curl -O https://raw.githubusercontent.com/FreedomBen/canvas-development-tools/master/CODES.sh
chmod +x CODES.sh
```


Install Nodejs:
```shell
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get -y install nodejs
```

<!-- Install the ruby dependencies - old - breaks:
```
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.1 ruby2.1-dev
``` -->

Install ruby 2.4:
```shell
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.4 ruby2.4-dev libxmlsec1-dev
```

```shell
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn=0.27.5-1
```

This image has some locale settings missing and causes the postgresql cluster to fail at initialization.
```shell
sudo su
echo -e "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" >> /etc/environment
```
Logout and then login again
```
exit
vagrant ssh
```

The following will install postgresql-9.3 (initialization of the cluster is taken care of by the canvas installation script
```shell
sudo apt-get install postgresql postgresql-contrib
```
Install canvas. The script in theory is idempotent, so if something fails, you can run it
again. (Note that it will re-initialize the database cluster everytime you run the installation script, so saved data will be lost.
```shell
./CODES.sh --full
```

After finishing the installation succesfully, run canvas, and start experimenting:
```
bundle exec rails db:initial_setup
bundle exec rails server -b 0.0.0.0
```
Visit `http://192.168.39.39:3000/` on your browser.
You will have to login with the Admin user you specified during the last steps of the CODES.sh script. You can start configuring canvas.
