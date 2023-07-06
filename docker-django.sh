#!/bin/bash

# Update package lists
apt-get update

# Install Python 3 and pip
apt-get install -y python3 python3-pip python3-venv

# Verify the installation
python3 --version
pip3 --version

mkdir /home/web

webpath = "/home/web"
cd $webpath

#
python3 -m venv $webpath/venv
