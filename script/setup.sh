#!/bin/sh

#
# isuconユーザーで実行する
# curl -L raw.github.com/swat9013/isucon-lib/main/script/setup.sh | sh
#

set -x

echo "start setup"
work_dir="$HOME/webapp"

# install
sudo apt-get install -y dstat unzip graphviz

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
config_dir="${work_dir}"/config
mkdir "${config_dir}"

## nginx
cp /etc/nginx/nginx.conf "${config_dir}"/nginx.conf
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

## mysql
cp /etc/mysql/mysql.conf.d/mysqld.cnf "${config_dir}"/mysqld.cnf
sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.bak

# script
script_dir="${work_dir}"/script
mkdir "${script_dir}"
curl -L raw.github.com/swat9013/isucon-lib/main/script/deploy.sh >"${script_dir}"/deploy.sh
chmod +x "${script_dir}"/deploy.sh
curl -L raw.github.com/swat9013/isucon-lib/main/script/analyze_nginx.sh >"${script_dir}"/analyze_nginx.sh
chmod +x "${script_dir}"/analyze_nginx.sh
curl -L raw.github.com/swat9013/isucon-lib/main/script/analyze_mysql.sh >"${script_dir}"/analyze_mysql.sh
chmod +x "${script_dir}"/analyze_mysql.sh

# git
rm .gitignore
curl -L raw.github.com/swat9013/isucon-lib/main/dot/.gitignore >"${work_dir}"/.gitignore

# ruby
sudo systemctl disable --now isupipe-go.service
sudo systemctl enable --now isupipe-ruby.service

sh "${script_dir}"/deploy.sh

# ssh
sudo cp /home/ubuntu/.ssh/authorized_keys /home/isucon/.ssh/authorized_keys
sudo chmod 600 /home/isucon/.ssh/authorized_keys
sudo chown isucon:isucon /home/isucon/.ssh/authorized_keys

echo "finish setup"
