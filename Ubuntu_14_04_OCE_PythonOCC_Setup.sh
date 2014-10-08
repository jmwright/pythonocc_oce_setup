#!/bin/sh
#This script needs to be run with superuser priveleges

#Set up our variables
#TAG="OCE-0.12"
#OCETAG="OCE-0.16"
#PYTHONOCCTAG="0.16-pre-1"
POCCMAKEPATH="pythonocc-core/cmake-build"

#Attempt to install all the pre-requisites
apt-get install -fy git cmake libx11-dev mesa-common-dev freeglut3-dev libfreetype6-dev libc6-dev libstdc++6 libstdc++-4.8-dev build-essential gcc g++ libftgl-dev xorg-dev tcl-dev tk-dev

apt-get install -y swig
add-apt-repository "deb http://ppa.launchpad.net/freecad-maintainers/oce-release/ubuntu precise main" -y
apt-get update -q
apt-get install -y liboce-ocaf-dev oce-draw
apt-get install -y python-wxgtk2.8
python -c "import wx"
apt-get install -y python-qt4 python-qt4-gl
python -c "from PyQt4 import QtGui, QtCore, QtOpenGL"
apt-get install -y python-pyside
python -c "from PySide import QtGui, QtCore, QtOpenGL"

#Install PythonOCC requirements
apt-get install -y swig python-sympy

#Clone PythonOCC so we can start building the components we need
#TODO: Use the line immediately below this one when a release version can be tagged
#git clone --branch $PYTHONOCCTAG https://github.com/tpaviot/pythonocc-core.git
git clone https://github.com/tpaviot/pythonocc-core.git

mkdir $POCCMAKEPATH && cd $POCCMAKEPATH

#Guild the geom extension
cmake -DOCE_INCLUDE_PATH=/usr/include/oce -DOCE_LIB_PATH=/usr/lib ..
make && make install
