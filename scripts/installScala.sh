#!/bin/bash
# Author: Emmanuel Fontan - GitHub/efontan

# java 8 install (Optional)
# sudo apt-get install python-software-properties
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java8-installer
# java -version

# scala install
SCALA_VERSION="2.12.0"
sudo apt-get remove scala-library scala
wget www.scala-lang.org/files/archive/scala-"$SCALA_VERSION".deb
sudo dpkg -i scala-"$SCALA_VERSION".deb
sudo apt-get update; sudo apt-get install scala
scala -version

# sbt installation
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update; sudo apt-get install sbt
sbt sbtVersion