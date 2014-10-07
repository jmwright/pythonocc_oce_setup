#!/bin/sh
#This script needs to be run with superuser priveleges

#Set up our variables
#TAG="OCE-0.12"
TAG="OCE-0.16"
GEOMPATH="pythonocc/src/contrib/geom-6.3.1.8/cmake-build"

apt-get update
# apt-get upgrade

# #Install the pre-requisites
# apt-get install -fy git cmake libx11-dev mesa-common-dev freeglut3-dev libfreetype6-dev libc6-dev libstdc++6 libstdc++-4.8-dev build-essential gcc g++ libftgl-dev xorg-dev tcl-dev tk-dev

# #Clone OCE and try to compile it
# git clone --branch $TAG git://github.com/tpaviot/oce.git

# #Move into the oce directory and prepare to run cmake
# cd oce; mkdir build; cd build
# cmake .. -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -DOCE_DRAW=ON

# #Build and install
# make && make install/strip

#Install PythonOCC requirements
apt-get install swig python-sympy

#Clone PythonOCC so we can start building the components we need
git clone https://github.com/tpaviot/pythonocc.git

mkdir $GEOMPATH && cd $GEOMPATH
