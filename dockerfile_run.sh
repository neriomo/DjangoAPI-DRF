#!/bin/bash

# Application Dockerfile main run script

echo "Dockerfile project requirements installation"
echo "DEV: $DEV"

# Dedendencies installation
python -m venv /py 
/py/bin/pip install --upgrade pip 

apk add --update --no-cache postgresql-client
apk add --update --no-cache --virtual .tmp-build-dev build-base postgresql-dev musl-dev

/py/bin/pip install -r /tmp/requirements.txt 

if [ $DEV = "true" ]; then 
    echo "INSIDE THE DEVELOPMENT INSTALLATION REQUIREMENTS"; 
    /py/bin/pip install -r /tmp/requirements.dev.txt 
fi 

rm -rf /tmp/
apk del .tmp-build-deps 

adduser --disabled-password --no-create-home django-user

