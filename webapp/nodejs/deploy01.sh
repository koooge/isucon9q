#!/bin/bash -ex

cd /home/isucon/isucari/webapp/nodejs
git pull origin master

sudo cp ../../conf/nginx.conf /etc/nginx
sudo systemctl restart nginx.service

sudo cp ../../conf/my.cnf /etc/mysql
sudo systemctl restart mysql.service
/home/isucon/isucari/webapp/sql/init.sh

sudo systemctl daemon-reload

sudo bash -c 'echo > /var/log/nginx/access.log; echo > /var/log/mysql/slow.log;'
