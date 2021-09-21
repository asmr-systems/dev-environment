#!/usr/bin/env bash


# start ntp service
# Thanks fred727! see https://superuser.com/a/1011519
sudo service ntp restart

# add local bin to PATH
echo 'export PATH=$PATH:/home/vagrant/.local/bin' >> ~/.bashrc

# make project directories
sudo mkdir -p /asmr/projects
