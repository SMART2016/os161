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

## Installing the Toolchain

```bash
    sudo add-apt-repository ppa:ops-class/os161-toolchain
    sudo apt-get update
    sudo apt-get install os161-toolchain
```

