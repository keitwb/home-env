#!/bin/bash

truecrypt --dismount /mnt/usbstick
sudo -u benkeith -g users truecrypt /dev/disk/by-id/usb-ADATA_USB_Flash_Drive_1380603031590031-0\:0-part2 /mnt/usbstick && \
rsync -rltgoD --delete --exclude "downloads/" /share /mnt/usbstick && \
truecrypt --dismount /mnt/usbstick
