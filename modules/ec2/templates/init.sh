#!/bin/bash

yum update -y &&\
amazon-linux-extras install docker -y &&\
service docker start &&\
usermod -a -G docker ec2-user

yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum install -y mysql-community-client

mkdir -p /home/ec2-user/redis_cache &&\
cd /home/ec2-user/redis_cache &&\
yum install gcc -y &&\
curl http://download.redis.io/redis-stable.tar.gz -o redis-stable.tar.gz &&\
tar xvzf redis-stable.tar.gz &&\
cd redis-stable &&\
make

yum -y update
cat << 'EOF' > /etc/yum.repos.d/pgdg.repo
[pgdg12]
name=PostgreSQL 12 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/12/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
EOF
yum makecache
yum install -y postgresql12