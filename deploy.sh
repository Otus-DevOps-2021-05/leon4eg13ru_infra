#!/bin/bash
echo 'копирование кода приложения'
git clone -b monolith https://github.com/express42/reddit.git
echo 'установка зависимостей'
cd reddit && bundle install
echo 'запуск приложения'
puma -d
