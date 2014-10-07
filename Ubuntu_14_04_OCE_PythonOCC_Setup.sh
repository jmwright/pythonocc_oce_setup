#!/bin/sh
#This script needs to be run with superuser priveleges

#Set up our variables
#TAG="OCE-0.12"
#OCETAG="OCE-0.16"
PYTHONOCCTAG="0.16-pre-1"
POCCMAKEPATH="pythonocc-core/cmake-build"

sudo apt-get install -y swig
sudo add-apt-repository "deb http://ppa.launchpad.net/freecad-maintainers/oce-release/ubuntu precise main" -y
sudo apt-get update -q
sudo apt-get install -y liboce-ocaf-dev oce-draw
sudo apt-get install -y python-wxgtk2.8
sudo python -c "import wx"
sudo apt-get install -y python-qt4 python-qt4-gl
sudo python -c "from PyQt4 import QtGui, QtCore, QtOpenGL"
sudo apt-get install -y python-pyside
sudo python -c "from PySide import QtGui, QtCore, QtOpenGL"

#Install PythonOCC requirements
apt-get install -y swig python-sympy

#Clone PythonOCC so we can start building the components we need
git clone --branch $PYTHONOCCTAG https://github.com/tpaviot/pythonocc-core.git

mkdir $POCCMAKEPATH && cd $POCCMAKEPATH

#Guild the geom extension
cmake -DOCE_INCLUDE_PATH="/usr/local/include/oce" -DOCE_LIB_PATH="/usr/local/lib/oce-0.16/" ..
make && make install
