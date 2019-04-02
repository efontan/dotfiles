#!/bin/bash -e
# Download and install the latest AppImage of Rambox.
# Usage: sudo ./update-rambox.sh

INSTALL_DIR=/opt/rambox

if [ "$(whoami)" != "root" ]
then
    echo "Sorry, you are not root. Use sudo!"
    exit 1
fi

echo "Downloading the latest version of Rambox to /tmp"

cd /tmp
wget "https://rambox.pro/api/downloadCE?os=linux&filetype=AppImage&arch=x86_64" -O rambox.AppImage

echo "Removing old version..."
rm -rf $INSTALL_DIR/*
mkdir -p $INSTALL_DIR

echo "Copying new version..."
chmod +x /tmp/rambox.AppImage
mv /tmp/rambox.AppImage $INSTALL_DIR/
ln -sf $INSTALL_DIR/rambox.AppImage /usr/bin/rambox

echo "Rambox updated successfully. Run 'rambox' command to generate desktop files and icons."