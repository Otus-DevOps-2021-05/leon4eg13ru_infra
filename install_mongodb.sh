#!/bin/bash
# добаление ключей репозитория
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
# добаление репозитория
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
# обновление индекса доступных пакетов
apt-get update
# установка mongodb
apt-get install -y mongodb-org
# запуск mongodb
systemctl start mongod
# добавление mongodb в автозапуск
systemctl enable mongod
