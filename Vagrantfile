# using Vagrant v2
Vagrant.configure("2") do |config|

  # using ubuntu/focal64 image
  config.vm.box = "debian/bullseye64"

  # set hostname of vm
  config.vm.hostname = "asmr.dev.local"

  # define vagrant machine name
  config.vm.define "asmr.dev"

  # use virtualbox
  config.vm.provider "virtualbox" do |v|

    # set name
    v.name = "asmr-dev"

    # run headless
    v.gui = false

    # set mem (MB)
    v.memory = "2048"

    # set cpus
    v.cpus = 2

    # set usb device capturing on
    # use `VBoxManage list usbhost` to list host usb devices
    v.customize ["modifyvm", :id, "--usb", "on"]
    v.customize ["modifyvm", :id, "--usbehci", "on"]

    # enumerate usb devices to capture
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'SEGGER J-Link PLUS', '--vendorid', '0x1366', '--productid', '0x0101']

  end

  # provision vm
  config.vm.provision :shell, path: "scripts/provision/0-install-dependencies.sh"
  #config.vm.provision :shell, path: "1_clone-code.sh", args: "#{ENV['USER_GITHUB_URL']}", privileged: false
end
