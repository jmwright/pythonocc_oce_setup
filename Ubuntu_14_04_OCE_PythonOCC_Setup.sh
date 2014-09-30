#!/bin/sh
#This script needs to be run with superuser priveleges

#Set up our variables
TAG="OCE-0.12"

apt-get update
apt-get upgrade

#Install the pre-requisites
apt-get install -y git cmake libx11-dev mesa-common-dev freeglut3-dev libfreetype6-dev libc6-dev libstdc++ libgcc build-essential gcc g++

#Clone OCE and try to compile it
git clone --branch $TAG git://github.com/tpaviot/oce.git

#Move into the oce directory and prepare to run cmake
cd oce; mkdir build; cd build
cmake .. -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++
