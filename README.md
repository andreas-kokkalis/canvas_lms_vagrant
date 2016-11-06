# Canvas LMS, Ubuntu 14.04 LTS, vagrant
For this setup, I followed the instructions from the Quick start guide of Instructure Canvas LMS https://github.com/instructure/canvas-lms/wiki/Quick-Start

## Prerequisites
Download and Install [Vagrant](https://www.vagrantup.com/docs/installation/)

Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Install virtualbox plugin for vagrant.
```vagrant plugin install vagrant-vbguest```

Clone this repo 
```git clone git@github.com:andreas-kokkalis/canvas_lms_vagrant.git```

Provision a new machine according the the configuration of Vagrantfile
```
vagrant up
```
After the machine is up, ssh
```
vagrant ssh
```

You can begin the installation process by executing the commands in the order specified below:

```
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
```
This image has some locale settings missing and causes the postgresql cluster to fail at initialization.
```
sudo su
echo -e "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" >> /etc/environment
```
Logout and then login again
```
exit
vagrant ssh
```

The following will install postgresql-9.3 (initialization of the cluster is taken care of by the canvas installation script
```
sudo apt-get install postgresql postgresql-contrib
```
Install canvas. The script in theory is idempotent, so if something fails, you can run it 
again. (Note that it will re-initialize the database cluster everytime you run the installation script, so saved data will be lost.
```
./CODES.sh --full
```

After finishing the installation succesfully, run canvas, and start experimenting:
```
bundle exec rails server -b 0.0.0.0
```
Visit `http://192.168.39.39:3000/` on your browser.
You will have to login with the Admin user you specified during the last steps of the CODES.sh script. You can start configuring canvas.

