#!/bin/bash

# For good luck...
apt-get update
apt-get upgrade -y


# Installing dependencies...
## Installing dependencies of dependencies...
apt-get install -y curl git

## Adding note10.0 source.
curl -sL https://deb.nodesource.com/setup_10.x | bash -

## Actually installing depedencies...
apt-get install -y supervisor rdiff-backup screen build-essential default-jre-headless nodejs


# Installing MineOS scripts
mkdir -p /usr/games
cd /usr/games
git clone https://github.com/hexparrot/mineos-node.git minecraft
cd minecraft
git config core.filemode false
chmod +x service.js mineos_console.js generate-sslcert.sh webui.js
npm install --unsafe-perm
ln -s /usr/games/minecraft/mineos_console.js /usr/local/bin/mineos
cp mineos.conf /etc/mineos.conf


# Running the MineOS Web Service
## Secure HTTPS operation
cd /usr/games/minecraft
./generate-sslcert.sh

## Starting the web-ui at boot
cp init/supervisor_conf /etc/supervisor/conf.d/mineos.conf
supervisorctl reload


# Sarting/Stopping the webui
## Remember, you won't need to do this on subsequent restarts, as the initscript will take care of it.
### As root: 	
#### supervisorctl start mineos
#### supervisorctl stop mineos
