#!/bin/bash -e
#https://medium.com/@firebitsbr/how-to-uninstall-from-the-apt-manager-uninstall-just-golang-go-from-universe-debian-ubuntu-82d6a3692cbd

GO_VERSION=1.12.5
INSTALL_DIR=/usr/local

if [ "$(whoami)" != "root" ]
then
    echo "Sorry, you are not root. Use sudo!"
    exit 1
fi

echo "Removing old version of Go"
sudo apt-get -qq remove golang-go -y 
sudo apt-get -qq remove --auto-remove golang-go -y 
sudo apt-get -qq purge golang-go && sudo apt-get -qq purge --auto-remove golang-go

echo "Downloading Go $GO_VERSION to /tmp"
cd /tmp
wget "https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz" -O golang.tar.gz

echo "Installing Go in $INSTALL_DIR"
sudo tar -xzvf golang.tar.gz -C $INSTALL_DIR

echo "Setting environment variables"
echo ""
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc 
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

echo "Cleaning temporary files"
rm -rf /tmo/golang.tar.gz

echo "Golang $GO_VERSION successfully installed"
echo "Use 'go get golang.org/dl/go1.10.7' to install additional versions."