#!/bin/sh

#
# isuconユーザーで実行する
# curl -L raw.github.com/swat9013/isucon-lib/main/script/setup.sh | sh
#

set -x

echo "start setup"

# install
sudo apt-get install -y dstat unzip graphviz jq
# sudo apt-get install -y memcached libmemcached-tools

## alp
## https://github.com/tkuchiki/alp
cd /var/tmp/ && wget https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo mv ./alp /usr/local/bin

## pt-query-digest
## https://www.percona.com/percona-toolkit
cd /var/tmp && wget https://www.percona.com/downloads/percona-toolkit/3.6.0/binary/tarball/percona-toolkit-3.6.0_x86_64.tar.gz
tar -zxvf percona-toolkit-3.6.0_x86_64.tar.gz
sudo mv ./percona-toolkit-3.6.0/bin/pt-query-digest /usr/local/bin

## slackcat
cd /var/tmp && wget https://github.com/bcicen/slackcat/releases/download/v1.6/slackcat-1.6-linux-amd64
sudo mv slackcat-1.6-linux-amd64 /usr/local/bin/slackcat
sudo chmod +x /usr/local/bin/slackcat

# setup config
mkdir $HOME/webapp/config

## nginx
cp /etc/nginx/nginx.conf $HOME/webapp/config/nginx.conf
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

## mysql
cp /etc/mysql/mysql.conf.d/mysqld.cnf $HOME/webapp/config/mysqld.cnf
sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.bak

# script
script_dir=$HOME/webapp/script
mkdir "${script_dir}"
curl -L raw.github.com/swat9013/isucon-lib/main/script/deploy.sh >"${script_dir}"/deploy.sh
chmod +x "${script_dir}"/deploy.sh
curl -L raw.github.com/swat9013/isucon-lib/main/script/analyze_nginx.sh >"${script_dir}"/analyze_nginx.sh
chmod +x "${script_dir}"/analyze_nginx.sh
curl -L raw.github.com/swat9013/isucon-lib/main/script/analyze_mysql.sh >"${script_dir}"/analyze_mysql.sh
chmod +x "${script_dir}"/analyze_mysql.sh
curl -L raw.github.com/swat9013/isucon-lib/main/script/analyze_ruby.sh >"${script_dir}"/analyze_ruby.sh
chmod +x "${script_dir}"/analyze_ruby.sh
curl -L raw.github.com/swat9013/isucon-lib/main/script/clean_log.sh >"${script_dir}"/clean_log.sh
chmod +x "${script_dir}"/clean_log.sh

# git
rm .gitignore
curl -L raw.github.com/swat9013/isucon-lib/main/dot/.gitignore >$HOME/webapp/.gitignore

# ruby
sudo systemctl disable --now isupipe-go.service
sudo systemctl enable --now isupipe-ruby.service

sh "${script_dir}"/deploy.sh

# ssh
sudo cp /home/ubuntu/.ssh/authorized_keys /home/isucon/.ssh/authorized_keys
sudo chmod 600 /home/isucon/.ssh/authorized_keys
sudo chown isucon:isucon /home/isucon/.ssh/authorized_keys

echo "finish setup"
