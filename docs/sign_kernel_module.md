# ✅ Goal: Sign VirtualBox kernel modules using `sign-file` correctly

### 🔐 You need 3 things:

1. A **private key** (e.g., `MOK.priv`)
2. A **public X.509 certificate** (e.g., `MOK.der`)
3. The **VirtualBox `.ko` kernel modules** to be signed

---

## ✅ Step-by-Step: Sign VirtualBox Kernel Modules for Secure Boot

---

### 🔹 1. **Generate the signing key + certificate**

```bash
cd /root
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox Module Signing/"
```

---

### 🔹 2. **Enroll the key with MOK (Machine Owner Key)**

```bash
sudo mokutil --import /root/MOK.der
```

You will be prompted to **create a password**. Remember it.
On reboot, you'll see a blue MOK enrollment screen. Follow it to **Enroll key** → type the password → confirm.

---

### 🔹 3. **Find the VirtualBox kernel modules**

They are usually in `/lib/modules/$(uname -r)/misc/` or `/updates/dkms/`:

```bash
find /lib/modules/$(uname -r)/ -name 'vbox*.ko'
```

---

### 🔹 4. **Sign the modules correctly**

```bash
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 \
    /root/MOK.priv /root/MOK.der \
    /lib/modules/$(uname -r)/misc/vboxdrv.ko
```

Repeat for all other modules:

```bash
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 /root/MOK.priv /root/MOK.der /lib/modules/$(uname -r)/misc/vboxnetflt.ko
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 /root/MOK.priv /root/MOK.der /lib/modules/$(uname -r)/misc/vboxnetadp.ko
```

---

### 🔹 5. **Reboot and enroll the MOK key**

During reboot, you will be prompted to **enroll the MOK key** in the blue-screen interface.

---

### 🔹 6. **Load the modules**

```bash
sudo modprobe vboxdrv
sudo modprobe vboxnetflt
sudo modprobe vboxnetadp
```

---

### ✅ Confirm modules are loaded

```bash
lsmod | grep vbox
```

You should see `vboxdrv`, `vboxnetflt`, etc.

---

Would you like a single script to automate all of this for you?
