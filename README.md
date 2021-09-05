# ASMR SYSTEMS Development Environment

## Getting Started
First, make sure that you have the following prerequisites installed:
* [Vagrant](https://www.vagrantup.com/downloads)
* [VirtualBox 5.X](https://www.virtualbox.org/wiki/Downloads)
* VirtualBox Extension Pack

On Linux,
``` shell
sudo usermod -a -G vboxusers $USER  # grant VM access to USB devices
# log out and log back in for change to take affect
```

Now, you can start it up and log in
``` shell
vagrant up   # could take 10 minutes while VM is built, you can eat a snack or something
vagrant ssh  # log into the VM
```
