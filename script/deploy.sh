#!/bin/sh

echo "start deploy"

set -x

sudo systemctl restart mysql

sudo systemctl stop isupipe-ruby.service
sudo systemctl start isupipe-ruby.service

sudo rm /var/log/nginx/access.log
sudo nginx -s reload

set +x

echo "finish deploy"
