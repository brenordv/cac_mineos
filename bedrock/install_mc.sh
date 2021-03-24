#!/bin/bash

# Bringing stuff up to date...
sudo apt-get update
sudo apt-get upgrade -y

# Creating non-root user...
useradd -m mine
passwd mine
usermod -aG sudo mine

# Changing to that user...
su mine
cd ~
wget https://raw.githubusercontent.com/TheRemote/MinecraftBedrockServer/master/SetupMinecraft.sh
chmod +x SetupMinecraft.sh
./SetupMinecraft.sh 
