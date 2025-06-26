1.The usual almost essential packages installation
sudo apt update
sudo apt install dkms menu build-essential libelf-dev make gcc linux-headers-$(uname -r)

1. More packages (I admit I just shot into the blue)  :D 
sudo apt install liblzf1 libqt6help6 libqt6statemachine6 libsdl-ttf2.0-0 libqt6widgets6 libqt6xml6 qt6-wayland libqt6sql6 libqt6opengl6 libqt6printsupport6 libqt6network6 libqt6printsupport6 libqt6gui6 libqt6dbus6 qt6-qpa-plugins qt6-translations-l10n qt6-wayland qt6-qmltooling-plugins libb2-1

1. Create a download folder if not already existing anyway
mkdir -p $HOME/Downloads

1. Get the software and sha256sum and download it into download folder
wget -P $HOME/Downloads https://download.virtualbox.org/virtualbox/7.1.4/VirtualBox-7.1.4-165100-Linux_amd64.run https://download.virtualbox.org/virtualbox/7.1.4/SHA256SUMS

5.Check the binary's integrity with sha256sum
sha256sum -c <(grep "VirtualBox-7.1.4-165100-Linux_amd64.run" "$HOME/Downloads/SHA256SUMS")

6. Change the modus of the binary to make it executable
chmod +x $HOME/Downloads/VirtualBox-7.1.4-165100-Linux_amd64.run

7. Execute the file
cd $HOME/Downloads/
sudo ./VirtualBox-7.1.4-165100-Linux_amd64.run

8. Check the output. Ignore any python3 errors about missing features or functions.They are deprecated anyway ;)
--
Verifying archive integrity...  100%   MD5 checksums are OK. All good.
Uncompressing VirtualBox for Linux installation  100%  
VirtualBox Version 7.1.4 r165100 (2024-10-10T18:28:15Z) installer
Installing VirtualBox to /opt/VirtualBox
Python found: python3.12, installing bindings...
Python 3.12 does not have package 'distutils', checking for 'setuptools'...
Python 3.12 also does not have package 'setuptools'. Skipping installation.

--
VirtualBox has been installed successfully.

You will find useful information about using VirtualBox in the user manual
  /opt/VirtualBox/UserManual.pdf
and in the user FAQ
  http://www.virtualbox.org/wiki/User_FAQ

We hope that you enjoy using VirtualBox.
--

9. If you like you might want to install the VirtualBox extensions as well.
wget -P $HOME/Downloads https://download.virtualbox.org/virtualbox/7.1.4/Oracle_VirtualBox_Extension_Pack-7.1.4.vbox-extpack 
sha256sum -c <(grep "Oracle_VirtualBox_Extension_Pack-7.1.4.vbox-extpack" "$HOME/Downloads/SHA256SUMS")

10. Install Extensions
sudo /usr/bin/vboxmanage extpack install --replace $HOME/Downloads/Oracle_VirtualBox_Extension_Pack-7.1.4.vbox-extpack

11. Agree to the license "Y" and make sure that the extensions and the rest of the VirtualBox software is under /opt/VirtualBox available
ls -l /opt/VirtualBox/ExtensionPacks/Oracle_VirtualBox_Extension_Pack/linux.amd64

12. Add your user to vboxuser group
sudo usermod -aG vboxusers $USER

13. Reboot
sudo reboot

