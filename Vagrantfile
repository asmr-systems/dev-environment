# using Vagrant v2
Vagrant.configure("2") do |config|
  
  # using ubuntu/focal64 image
  config.vm.box = "ubuntu/focal64"

  config.vm.hostname = "asmr-dev.local"
  
  # use virtualbox
  config.vm.provider "virtualbox" do |v|
    
    # run headless
    v.gui = false
    
    # set mem (MB)
    v.memory = "2048"

    # set cpus
    v.cpus = 2

    
  end
end
