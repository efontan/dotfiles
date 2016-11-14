#!/bin/bash
# Author: Emmanuel Fontan - GitHub/efontan
# Usage: ./updateResolvConf.sh {scala_version}
#

VERSION="2.12.0"
SCALA_VERSION="$1"

if [ -z "${SCALA_VERSION}" ];
then
        echo "Version not specified. Using default: ${VERSION}"
else
		VERSION=$SCALA_VERSION
        echo "Version specified: ${VERSION}"
fi

echo "Removing old versions..."
sudo apt-get remove scala-library scala

echo "Downloading version $VERSION..."
wget www.scala-lang.org/files/archive/scala-"$VERSION".deb

echo "Installing..."
sudo dpkg -i scala-"$VERSION".deb
sudo apt-get update; sudo apt-get install scala

echo "Installation successful!"
