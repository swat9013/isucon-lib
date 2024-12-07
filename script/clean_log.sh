#!/bin/sh

cd "$(dirname "$0")"/../ || exit

set -x
sudo sh -c "echo > /var/log/mysql/mysql-slow.log"
sudo sh -c "echo > /var/log/nginx/access.log"
sh -c "echo > ~/webapp/ruby/production.log"
set +x

