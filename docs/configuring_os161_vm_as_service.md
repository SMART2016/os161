## 1️⃣ Create a systemd service file

Create a file, e.g.:

```bash
sudo nano /etc/systemd/system/qemu-os161.service
```

Paste the following:

```ini
[Install]
WantedBy=multi-user.target

[Unit]
Description=QEMU Ubuntu16.04 OS161 VM
After=network.target
StartLimitBurst=0
StartLimitIntervalSec=0

[Service]
Type=simple
User=dipanjan
ExecStart=/usr/bin/qemu-system-x86_64 \
  -m 2048 \
  -hda /mnt/code/disks/ubuntu16.qcow2 \
  -enable-kvm \
  -vga qxl \
  -display default \
  -net nic \
  -net user,hostfwd=tcp::2222-:22 \
  -spice port=5930,disable-ticketing=on
Restart=on-failure
LimitMEMLOCK=infinity
```

* Replace `<your_host_user>` with your Linux username.
* Adjust paths if `qemu-system-x86_64` isn’t in `/usr/bin`, or use `which qemu-system-x86_64`.
* The `Restart=on-failure` line ensures the VM will restart if it crashes.

---


## 3️⃣ Enable and start the service

Run:

```bash
sudo systemctl daemon-reload
sudo systemctl enable qemu-os161.service
sudo systemctl start qemu-os161.service
```

To check its status:

```bash
systemctl status qemu-os161.service
```

---

## To go to vm GUI
- Run `remote-viewer spice://127.0.0.1:5930`