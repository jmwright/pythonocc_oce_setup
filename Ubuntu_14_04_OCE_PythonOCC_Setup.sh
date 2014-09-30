#!/bin/sh
#This script needs to be run with superuser priveleges

apt-get update
apt-get upgrade

#Install the pre-requisites
apt-get install git

#Clone OCE and try to compile it
git clone git://github.com/tpaviot/oce.git
