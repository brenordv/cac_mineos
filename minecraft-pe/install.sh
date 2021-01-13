#!/bin/bash
ufw allow 19132/tcp
apt-get install build-essential libtool-bin autoconf bison screen -y
useradd -d /home/minecraft -m minecraft
passwd minecraft
su minecraft
cd ~
wget -q -O - https://get.pmmp.io | bash -s -
script /dev/null
screen ./start.sh
su root
line="@reboot /home/minecraft/start.sh"
(crontab -u root -l; echo "$line" ) | crontab -u root -
