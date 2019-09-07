#!/bin/bash -ex

cd /home/isucon/isucari/webapp/nodejs
git pull origin master

/home/isucon/local/node/bin/npm i

/home/isucon/isucari/webapp/nodejs/node_modules/.bin/tsc

sudo cp ../../conf/isucari.nodejs.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl restart isucari.nodejs.service
