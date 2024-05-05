#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: This script must be run with sudo"
    exit 1
fi

apt -y install dnsmasq network-manager bridge-utils debian-keyring debian-archive-keyring apt-transport-https umtp-responder

brctl addbr br0
cp ./etc/dnsmasq.d/usb0 /etc/dnsmasq.d/usb0

cp ./etc/network/interfaces.d/usb0 /etc/network/interfaces.d/usb0

cp ./usr/local/sbin/multigadget /usr/local/sbin/multigadget
chmod +x /usr/local/sbin/multigadget

cp ./lib/systemd/system/multigadget.service /lib/systemd/system/multigadget.service
systemctl enable multigadget.service

cp ./etc/umtprd/umtprd.conf-template /etc/umtprd/umtprd.conf-template

echo dtoverlay=dwc2 >> /boot/firmware/config.txt

echo dwc2 >> /etc/modules
echo libcomposite >> /etc/modules
