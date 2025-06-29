# ✅ Step-by-Step: Fully Unload KVM

### 🔹 1. **Stop Services Using KVM**

Stop `libvirtd`, `qemu`, or anything that could be holding KVM:

```bash
sudo systemctl stop libvirtd
sudo systemctl stop virtlogd
sudo systemctl stop qemu-kvm
```

> These services usually autoload `kvm_amd`.

---

### 🔹 2. **Check for Active KVM Processes**

Run this:

```bash
ps aux | grep -E 'qemu|kvm'
```

Kill any remaining VMs or qemu processes:

```bash
sudo killall qemu-system-x86_64
```

---

### 🔹 3. **Unload KVM Modules Again**

Now retry:

```bash
sudo rmmod kvm_amd
sudo rmmod kvm
```

---

## For Permanently Disabling KVM
### 🔹 4. **Blacklist to Prevent Future Auto-Loading**

To permanently disable KVM:

```bash
echo "blacklist kvm_amd" | sudo tee /etc/modprobe.d/blacklist-kvm.conf
echo "blacklist kvm" | sudo tee -a /etc/modprobe.d/blacklist-kvm.conf
sudo update-initramfs -u
```

Then reboot:

```bash
sudo reboot
```

---

### ✅ After Reboot

Verify KVM is gone:

```bash
lsmod | grep kvm
```

Now you can run your VirtualBox VM:

```bash
virtualbox
```

---

Let me know if you're using **Intel** instead — the module names will differ (`kvm_intel` instead of `kvm_amd`).
