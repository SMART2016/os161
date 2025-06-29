# os161
OS Understanding

## Install GDB
- `sudo apt-get install gdb`

## GCC
- The GNU Compiler Collection, commonly known as GCC, is a set of compilers and development tools available for Linux, Windows, various BSDs, and a wide assortment of other operating systems. It includes support primarily for C and C++ and includes Objective-C, Ada, Go, Fortran, and D.

## Install Virtual Box
- Vagrant Needs a provider like virtual box available
- [Install Vbox](install_vbox_ubuntu24.10.md)
- Recompile and Install Kernel module
  - `sudo /sbin/vboxconfig`
- check vbox correctly installed
  - `VBoxManage --version`
  - If it gives error asking to sign the kernel modules then Sign the kernel module

## Sign Kernel Modules if Secure Boot is Enabled
- In my machine disabling secure wasn't working so had to sign the kernel modules
- [Sign Kernel Modules](sign_kernel_module.md)

## Install Qemu
- ` sudo apt install qemu-kvm libvirt-daemon-system virtinst bridge-utils virt-manager`
- `sudo apt update`
- `sudo apt install qemu-system-x86`
- Create image disk
  - `qemu-img create -f qcow2 ubuntu16.qcow2 20G`
- Run Image
  - `qemu-system   -m 2048   -cdrom ubuntu-16.04.7-desktop-amd64.iso   -boot d   -hda ubuntu16.qcow2   -enable-kvm   -net nic   -net user`
  -  Explanation:
    -m 2048 → 2GB RAM
    -cdrom → path to ISO
    -boot d → boot from CD-ROM
    -hda → disk file
    -enable-kvm → enables hardware acceleration (if supported)
    -net nic -net user → basic NAT networking
- Once Ubuntu is installed, boot like this:
  ```bash
    qemu-system-x86_64 \
    -m 2048 \
    -hda ubuntu16.qcow2 \
    -enable-kvm \
    -vga qxl \
    -display default \
    -net nic \
    -net user,hostfwd=tcp::2222-:22 \
    -spice port=5930,disable-ticketing=on \
    -display spice-app

  ```
- Inside your Ubuntu VM:
  ```bash
      sudo apt update
      sudo apt install spice-vdagent qemu-guest-agent
  ```

## Setup SSH
- Install SSH in VM

- Connect to VM with ssh
  - `ssh os161@localhost -p 2222`

## Install Vagrant

```bash
    $ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    $ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    $ sudo apt-get update && sudo apt-get install vagrant
```

## Running the code

```bash
    git clone https://github.com/ops-class/vagrant
    cd vagrant && vagrant up --provider=virtualbox
```

## VirtualBox + KVM conflict
- [Disable KVM Manually](disable_kvm.md) or run below script
- Run Script
  - `chmod +x disable-kvm-for-virtualbox.sh`
  - `./disable-kvm-for-virtualbox.sh`
- Update your Vagrant box 
  ```bash
      vagrant box add ubuntu/focal64
      vagrant destroy -f
      vagrant up --provision
  ```


## Installing the Toolchain

```bash
    sudo add-apt-repository ppa:ops-class/os161-toolchain
    sudo apt-get update
    sudo apt-get install os161-toolchain
```

