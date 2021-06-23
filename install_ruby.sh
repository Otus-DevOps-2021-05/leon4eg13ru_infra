#!/bin/bash
echo "обновляем APT"
apt update
echo "установка ruby и bundler"
apt install -y ruby-full ruby-bundler build-essential
