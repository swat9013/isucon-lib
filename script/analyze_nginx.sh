#!/bin/sh -eux

cd "$(dirname "$0")"/../

export TZ=Asia/Tokyo
filename=$(date +"%Y%m%d_%H%M%S")
mkdir -p logs/nginx
alp json --sort sum -r -m "/posts/[0-9]+,/@\w+,/image/\d+" -o count,method,uri,min,avg,max,sum < /var/log/nginx/access.log > logs/nginx/$filename
cat logs/nginx/$filename

sudo rm /var/log/nginx/access.log
sudo nginx -s reload
