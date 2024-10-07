#!/bin/sh -eux

cd "$(dirname "$0")"/../

export TZ=Asia/Tokyo
filename=$(date +"%Y%m%d_%H%M%S")
mkdir -p logs/mysql
sudo pt-query-digest /var/log/mysql/mysql-slow.log > logs/mysql/$filename
cat logs/mysql/$filename