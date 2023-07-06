#!/bin/bash

# Update package lists
apt-get update

# Install Python 3 and pip
apt-get install -y python3 python3-pip python3-venv

# Verify the installation
python3 --version
pip3 --version

webpath="/home/web"

# Check if the directory exists
if [ ! -d "$webpath" ]; then
    # Create the directory
    mkdir "$webpath"
    echo "Directory created."
else
    echo "Directory already exists."
fi

cd $webpath

#
python3 -m venv $webpath/venv

source $webpath/venv/bin/activate

python3 -m pip install django

django-admin startproject dannylint
python3 manage.py migrate
