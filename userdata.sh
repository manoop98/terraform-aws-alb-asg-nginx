#!/bin/bash
yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker

docker run -d -p 8000:80 nginx
