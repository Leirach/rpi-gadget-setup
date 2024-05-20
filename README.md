# Raspbery Pi USB Gadget Setup Scripts

Scripts to turn your working Raspberry Pi Bookworm install into a usb gadget with Ethernet connection and MTP.

Based on https://github.com/Vaneixus/rpi-gadget-image

(which is itself based on the great work of Ben Hardill - https://github.com/hardillb/rpi-gadget-image-creator)

## Requirements

- Raspberry Pi running Raspberry Pi OS Bookworm
- curl

## Usage

very much WIP

make sure the packages are up to date first:

```sh
sudo apt update
sudo apt upgrade
```

```sh
sudo ./setup-gadget.sh
```

## Windows network configuration for usb gadget

WIP as well

- Share network with Raspberry Pi
- Configure static ip (again)

## Caveats

- Only tested on Raspberry Pi 4B running 64 bit [IMAGE NAME HERE]
- USB power output may not be enough, try using a USB-C port or a USB 3.0 cable
- You can throttling and voltage issues with this script [LINK TO SCRIPT HERE PLS]

## Notes for getting this to work in Armbian/orangepizero
- /boot/config.txt file has a different name armbianEnv.txt ?
- /etc/modules/ only needs to load libcomposite
- had to mkdir /etc/systemd/resolved.conf.d && nano noresolved.conf - to make dnsmasq work
```
[Resolve]
DNSStubListener=no
```
- I'm not sure if I need NetworkManager for brctl but if it is not conflicting I would just keep it running
