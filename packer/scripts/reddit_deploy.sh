#!/bin/sh
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
sleep 10
apt-get install -y ruby-full ruby-bundler build-essential mongodb-org git
systemctl daemon-reload
systemctl start mongod
systemctl enable mongod
systemctl enable reddit-app
mkdir /app
cd /app
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
