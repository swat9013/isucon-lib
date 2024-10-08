#!/bin/sh

echo "start deploy"

set -x

sudo systemctl stop isupipe-ruby.service

sudo rm /var/log/nginx/access.log
sudo nginx -s reload

sudo systemctl restart mysql

sudo systemctl start isupipe-ruby.service

set +x

echo "finish deploy"
