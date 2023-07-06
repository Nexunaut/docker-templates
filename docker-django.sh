#!/bin/bash

# Update package lists
apt-get update

# Install Python 3 and pip
apt-get install -y python3 python3-pip python3-venv nano python3-dev libpq-dev postgresql postgresql-contrib

# Verify the installation
python3 --version
pip3 --version

project_dir="dannylint"
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

# Check if the project directory exists
if [ ! -d "$webpath/$project_dir" ]; then
    # Execute the command
    django-admin startproject "$project_dir"
    echo "Project created."
else
    echo "Project directory already exists. Skipping command."
fi

python3 -m venv $webpath/venv

source $webpath/venv/bin/activate

python3 -m pip install django

django-admin startproject dannylint
python3 $webpath/$project_dir/manage.py migrate
