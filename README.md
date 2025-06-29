# os161
OS Understanding

## Install GDB
- `sudo apt-get install gdb`

## GCC
- The GNU Compiler Collection, commonly known as GCC, is a set of compilers and development tools available for Linux, Windows, various BSDs, and a wide assortment of other operating systems. It includes support primarily for C and C++ and includes Objective-C, Ada, Go, Fortran, and D.


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

## Running Remote code in local vscode
```bash
  sudo apt install sshfs
  mkdir ~/vm-code
  sshfs -p 2222 os161@localhost:/home/os161 ~/vm-code
  code ~/vm-code
```


## Installing the Toolchain

```bash
    sudo add-apt-repository ppa:ops-class/os161-toolchain
    sudo apt-get update
    sudo apt-get install os161-toolchain
```

## Os161 Build and Run
- [Os 161 Build and Run](docs/running_building_os161.md)