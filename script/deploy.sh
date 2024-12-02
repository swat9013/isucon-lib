#!/bin/sh

cd "$(dirname "$0")"/../ || exit

echo "start deploy"

set -x

# clean log
./script/clean_log.sh

# mysql
sudo cp ./config/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# ruby
sudo systemctl stop isupipe-ruby.service
sudo systemctl start isupipe-ruby.service

# nginx
sudo cp ./config/nginx.conf /etc/nginx/nginx.conf
sudo nginx -s reload

set +x

echo "finish deploy"
