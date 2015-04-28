#!/bin/sh
#This script needs to be run with superuser priveleges

#Set up our variables
OCETAG="OCE-0.16" #This and the PythonOCC version must match
PYTHONOCCTAG="0.16.0"
OCEMAKEPATH="oce/build"
POCCMAKEPATH="pythonocc-core/cmake-build"

#Attempt to install all the pre-requisites
apt-get install -fy git cmake libx11-dev mesa-common-dev freeglut3-dev libfreetype6-dev libc6-dev libstdc++6 libstdc++-4.8-dev build-essential gcc g++ libftgl-dev xorg-dev tcl-dev tk-dev python-dev swig python-wxgtk2.8 python-qt4 python-qt4-gl python-pyside swig python-sympy

git clone --branch $OCETAG https://github.com/tpaviot/oce.git

mkdir $OCEMAKEPATH && cd $OCEMAKEPATH

cmake ..
make
make install/strip

python -c "import wx"
python -c "from PyQt4 import QtGui, QtCore, QtOpenGL"
python -c "from PySide import QtGui, QtCore, QtOpenGL"

cd ../../

#Clone PythonOCC so we can start building the components we need
git clone --branch $PYTHONOCCTAG https://github.com/tpaviot/pythonocc-core.git

mkdir $POCCMAKEPATH && cd $POCCMAKEPATH

#Guild the geom extension
cmake -DOCE_INCLUDE_PATH=/usr/local/include/oce -DOCE_LIB_PATH=/usr/local/lib ..
make && make install
