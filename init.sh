#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

python /home/site/wwwroot/runserver.py
