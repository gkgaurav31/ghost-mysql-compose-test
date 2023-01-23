#!/bin/sh
set -e

#test
#apt install net-tools -y
#ifconfig
#nslookup db

service ssh start

sleep 30 #wait for db to start

echo "trying after 100 seconds"
nc -zv db 3306

/usr/local/bin/docker-entrypoint.sh node current/index.js