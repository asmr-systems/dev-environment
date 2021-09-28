#!/usr/bin/env bash


# make vagrant user part of the following groups
# - dialout : for manipulating serial devices
# - disk    : for accessing disks
sudo usermod -a -G dialout,disk vagrant

# start ntp service
# Thanks fred727! see https://superuser.com/a/1011519
sudo service ntp restart

# add local bin to PATH
echo 'export PATH=$PATH:/home/vagrant/.local/bin' >> ~/.bashrc

# make project directories
sudo mkdir -p /asmr/projects
