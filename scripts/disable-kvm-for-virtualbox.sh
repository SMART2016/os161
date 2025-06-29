#!/bin/bash
set -e

echo "📛 Stopping KVM-related services..."
sudo systemctl stop libvirtd || true
sudo systemctl stop virtlogd || true
sudo systemctl stop qemu-kvm || true

echo "🛑 Killing any running QEMU processes..."
sudo killall qemu-system-x86_64 2>/dev/null || true

echo "🔎 Checking if kvm_amd module is loaded..."
if lsmod | grep -q kvm_amd; then
    echo "🔻 Unloading kvm_amd..."
    sudo rmmod kvm_amd || {
        echo "❌ Failed to unload kvm_amd. Ensure no VMs are running and try again."
        exit 1
    }
fi

echo "🔻 Unloading kvm..."
sudo rmmod kvm || {
    echo "❌ Failed to unload kvm. Is it still in use?"
    exit 1
}

# echo "🛡️ Blacklisting KVM modules to prevent auto-loading on boot..."
# echo "blacklist kvm_amd" | sudo tee /etc/modprobe.d/blacklist-kvm.conf
# echo "blacklist kvm" | sudo tee -a /etc/modprobe.d/blacklist-kvm.conf

# echo "🔁 Updating initramfs..."
# sudo update-initramfs -u

# echo ""
# echo "✅ KVM modules unloaded and blacklisted."
# echo "🌀 Please reboot your system for the changes to take effect:"
# echo "   sudo reboot"
