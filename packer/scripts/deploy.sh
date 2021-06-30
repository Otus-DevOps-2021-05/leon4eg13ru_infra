#!/bin/bash
apt-get install -y git
mkdir /app
cd /app
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
