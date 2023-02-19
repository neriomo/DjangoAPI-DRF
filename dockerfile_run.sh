#!/bin/bash

# Application Dockerfile main run script

echo "Dockerfile project requirements installation"
echo "DEV: $DEV"
python -m venv /py 
/py/bin/pip install --upgrade pip 
/py/bin/pip install -r /tmp/requirements.txt 

if [ $DEV = "true" ]; then 
    echo "INSIDE THE DEVELOPMENT INSTALLATION REQUIREMENTS"; 
    /py/bin/pip install -r /tmp/requirements.dev.txt 
fi 

rm -rf /tmp/

adduser --disabled-password --no-create-home django-user

