#!/bin/sh

#
# webapp下で実行する
#

echo "start setup"

# install
sudo apt-get install -y dstat unzip graphviz

## alp
cd /var/tmp/ && wget https://github.com/tkuchiki/alp/releases/download/v0.4.0/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo mv ./alp /usr/local/bin

## pt-query-digest
cd /var/tmp && wget https://www.percona.com/downloads/percona-toolkit/3.0.13/binary/tarball/percona-toolkit-3.0.13_x86_64.tar.gz
tar -zxvf percona-toolkit-3.0.13_x86_64.tar.gz
sudo mv ./percona-toolkit-3.0.13/bin/pt-query-digest /usr/local/bin


# setup config
work_dir=$(pwd)
config_dir="${work_dir}"/config
mkdir "${config_dir}"

## nginx
cp /etc/nginx/nginx.conf "${config_dir}"/nginx.conf
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
cd /etc/nginx/ || exit
sudo ln -s "${config_dir}"/nginx.conf .

## mysql
cp /etc/mysql/mysql.conf.d/mysqld.cnf "${config_dir}"/mysqld.cnf
sudo mv /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.bak
cd /etc/mysql/mysql.conf.d/ || exit
sudo ln -s "${config_dir}"/mysqld.cnf .


echo "finish setup"