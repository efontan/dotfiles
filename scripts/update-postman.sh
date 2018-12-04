#!/bin/bash -e
# 
# Download and install the latest version of Postman for Ubuntu. Create .desktop file. 
# Usage: sudo ./update-postman.sh
# Based on https://gist.github.com/Jekis/722e286251eab7fc4e9b2caf732cf16d
# 
INSTALL_DIR=/opt/postman

if [ "$(whoami)" != "root" ]
then
    echo "Sorry, you are not root. Use sudo!"
    exit 1
fi

echo "Downloading the latest Postman to /tmp"
cd /tmp
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -xzf /tmp/postman.tar.gz
rm /tmp/postman.tar.gz

echo "Removing old Postman..."
rm -rf $INSTALL_DIR

echo "Copying new Postman..."
mv /tmp/Postman* $INSTALL_DIR
ln -sf $INSTALL_DIR/Postman /usr/bin/postman

echo "Creating postman.desktop file..."
cat > /usr/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=$INSTALL_DIR/app/resources/app/assets/icon.png
Type=Application
StartupNotify=false
OnlyShowIn=Unity;
Categories=Development;
EOL

echo "New Postman has been installed!"