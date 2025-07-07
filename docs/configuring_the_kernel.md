# Kernel Configuration

- The Global base configuration for the kernel is in `<os161_path>/kern/conf` and the base config file is `conf.kern`
- We add all configs here to customize the kernel to add tests or any other components to the kernel.
- To Enable configurations for a kernel , we basically enable respective options in the respecteive kernel profile
    - eg. there are multiple profiles in the `<os161_path>/kern/conf` path 'DUMBVM` etc..
- Ones we change anything in the kernel configs , we need to rebuild the kernel
    - Build and Configure kernel
        - `./config DUMBVM`
        - `cd ../compile/DUMBVM/`
        - `bmake depend`
        - `bmake`
        - `bmake install`