#!/bin/bash

yum update -y &&\
amazon-linux-extras install docker -y &&\
service docker start &&\
usermod -a -G docker ec2-user

yum install -y https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install -y mysql-community-client

mkdir -p /home/ec2-user/redis_cache &&\
cd /home/ec2-user/redis_cache &&\
yum install gcc -y &&\
curl http://download.redis.io/redis-stable.tar.gz -o redis-stable.tar.gz &&\
tar xvzf redis-stable.tar.gz &&\
cd redis-stable &&\
make