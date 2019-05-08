#!/bin/bash -e
# Updates shellcheck to the lastest version for Ubuntu
# Usage: sudo ./update-shellcheck.sh

if [ "$(whoami)" != "root" ]
then
    echo "Sorry, you are not root. Use sudo!" 
    exit 1
fi

echo "Downloading the latest version to /tmp"
cd /tmp
wget https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz
tar xvf shellcheck-stable.linux.x86_64.tar.xz

echo "Removing old version..."
rm -rf /usr/bin/shellcheck

echo "Installing new shellcheck version..."
cp shellcheck-stable/shellcheck /usr/bin/shellcheck

echo "Shellcheck updated successfully."
