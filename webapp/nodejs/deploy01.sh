#!/bin/bash -ex

cd /home/isucon/isucari/webapp/nodejs
git pull origin master

/home/isucon/local/node/bin/npm i

/home/isucon/isucari/webapp/nodejs/node_modules/.bin/tsc

sudo cp ../../conf/nginx.conf /etc/nginx
sudo systemctl restart nginx.service

sudo cp ../../conf/isucari.nodejs.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl restart isucari.nodejs.service

sudo bash -c 'echo > /var/log/nginx/access.log;'
