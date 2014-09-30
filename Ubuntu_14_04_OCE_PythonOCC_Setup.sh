#!/bin/sh
#This script needs to be run with superuser priveleges

#Set up our variables
TAG="OCE-0.12"

apt-get update
apt-get upgrade

#Install the pre-requisites
apt-get install -y git cmake libx11-dev mesa-common-dev freeglut3-dev libfreetype6-dev

#Clone OCE and try to compile it
git clone --branch $TAG git://github.com/tpaviot/oce.git

#Move into the oce directory and prepare to compile it
cd oce; mkdir build; cd build
cmake ..
