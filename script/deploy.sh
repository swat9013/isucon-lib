#!/bin/sh

cd "$(dirname "$0")"/../ || exit

echo "start deploy"

set -x

# mysql
sudo cp ./config/mysqld.cnf /etc/mysql/mysqld.cnf
sudo systemctl restart mysql

# ruby
sudo systemctl stop isupipe-ruby.service
sudo systemctl start isupipe-ruby.service

# nginx
sudo cp ./config/nginx.conf /etc/nginx/nginx.conf
sudo nginx -s reload

set +x

echo "finish deploy"
