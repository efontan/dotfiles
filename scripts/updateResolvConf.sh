#!/bin/sh
#sudo dpkg-reconfigure resolvconf
sudo rm /etc/resolv.conf
sudo ln -s /run/resolvconf/resolv.conf /etc/resolv.conf
sudo resolvconf -u
cat /etc/resolv.conf

