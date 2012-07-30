Vagrant::Config.run do |config|

  config.vm.define :oraxe do |db1_config|
    db1_config.vm.box = "ubuntu-1110-server-amd64"
    db1_config.vm.box_url = "http://timhuegdon.com/vagrant-boxes/ubuntu-11.10.box"
    db1_config.vm.host_name = "oraxe"
    db1_config.vm.forward_port 22, 41022, :adapter => 1
    db1_config.vm.network :hostonly, "33.33.33.10", :adapter => 2
    db1_config.vm.provision :puppet, :module_path => "modules", :options => "--verbose --trace" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
    end
    db1_config.vm.customize [ "modifyvm", :id, "--name", "dev_env_oraxe" ,"--memory", "2048"]
    db1_config.vm.boot_mode = :gui
  end

end
