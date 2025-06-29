# Build Kernel

- clone the repo in your favourite director in the ubuntu vm
    - `git clone https://github.com/SMART2016/os161.git`
- Install packages 
    - `sudo apt install iotop`
- Kernel Compilation
    - create a directory called root in the Home 
        - `mkdir $HOME/root`
    - `cd os161`
    - Configure Kernel
        - `./configure --ostree=$HOME/root
    - `cd kern/conf/`
    - `./config DUMBVM`
    - `cd ../compile/DUMBVM/`
    - Build kernel
        - `bmake depend`
        - `bmake`
        - `bmake install`
    - Configure sys161 
        - Get the sys161 conf from [here](https://ops-class.org/files/sys161.conf)
        - Move it to `$HOME/root` in the vm
    - Run kernel on sys161
        - `sys161 kernel`


# Making Changed to kernel
- After change code we just need to run below command to compile the kerrnel and install it to sysy161
    - `cs kern/conf`
    - `bmake`
    - `bmake install`
- If we change the header file , we will need to reconfigure kernel and start from `bmake depend`
- If we add a new file we need to configure the same in below conf file
    - `kern/conf/conf.kern` file


# Build user tools
- `cd os161`
- `bmake -j8`
- `bmake -j8 install`