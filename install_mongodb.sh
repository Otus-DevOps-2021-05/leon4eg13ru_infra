#!/bin/bash
echo "добаление ключей репозитория"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "добаление репозитория"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "обновление индекса доступных пакетов"
apt-get update
echo "установка mongodb"
apt-get install -y mongodb-org
echo "запуск mongodb"
systemctl start mongod
echo "добавление mongodb в автозапуск"
systemctl enable mongod
