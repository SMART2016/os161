VAGRANT_COMMAND = ARGV[0]

Vagrant.configure(2) do |config|

  if ENV['BOX_VERSION'] != nil
    config.vm.box = "ubuntu-16.04-" + ENV['BOX_VERSION']
  else
    config.vm.box = "ops-class/ubuntu-16.04"
    config.vm.box_version = ">= 0.0.2"
  end
  config.ssh.username = "trinity"
  config.vm.synced_folder "shared", "/home/trinity/shared", create: true, owner: "trinity", group: "trinity"

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = :host
  end

  config.vm.provider "virtualbox" do |v|
    # 24 Dec 2015 : GWA : This is a fairly lightweight configuration. Feel
    # free to beef it up to improve performance if needed.
    v.name = "ops-class.org"
    v.cpus = "1"
    v.memory = "512"
    # 24 Dec 2015 : GWA : Uncomment this if you want a GUI environment.
    # v.gui = true
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    v.customize ["modifyvm", :id, "--usb", "off"]
    v.customize ["modifyvm", :id, "--usbehci", "off"]
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  $script = <<-SHELL
# Use old-releases mirror since Xenial is EOL
sed -i 's|http://.*.ubuntu.com/ubuntu|http://old-releases.ubuntu.com/ubuntu|g' /etc/apt/sources.list

# Update apt and install matching headers for the running kernel
apt-get -qq update
apt-get -qq upgrade -y

# Get the current kernel version
KERNEL_VERSION=$(uname -r)

# Install build tools and kernel headers
apt-get install -y build-essential dkms linux-headers-$KERNEL_VERSION

echo "✅ Provisioning completed successfully"
echo "ℹ️ Now run: vagrant ssh"
  SHELL

  config.vm.provision "shell", "inline": $script
end

# vim: ts=2:sw=2:et:ft=ruby
