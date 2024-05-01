#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: This script must be run with sudo"
    exit 1
fi

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
apt update
apt -y install dnsmasq network-manager bridge-utils debian-keyring debian-archive-keyring apt-transport-https umtp-responder

brctl addbr br0
cp ./etc/dnsmasq.d/usb0 ./etc/dnsmasq.d/usb0 # COPY FILE

cp ./etc/network/interfaces.d/usb0 /etc/network/interfaces.d/usb0 # COPY FILE

cp ./usr/local/sbin/multigadget /usr/local/sbin/multigadget # COPY FILE
chmod +x /usr/local/sbin/multigadget

cp ./lib/systemd/system/multigadget.service /lib/systemd/system/multigadget.service # COPY FILE
systemctl enable multigadget.service

cp ./etc/umtprd/umtprd.conf-template /etc/umtprd/umtprd.conf-template # COPY FILE

echo dtoverlay=dwc2 >> /boot/firmware/config.txt

echo dwc2 >> /etc/modules
echo libcomposite >> /etc/modules
