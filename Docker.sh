#!/bin/bash

# STEP 1
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

#STEP 2 SETUP DOCKER REPOSITORY

sudo yum install -y yum-utils

if  [ $? -ne 0 ]
then
	echo "failed"
	exit 2
fi

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
if [ $? -ne 0 ]
then
	echo "failed"
	exit 4
fi

leep 3s

#STEP 3 INSTALL DOCKER ENGINE

 sudo yum install docker-ce docker-ce-cli containerd.io -y
  if [ $? -ne 0 ]
then
echo "failed"
exit 5
fi

sleep 4

#STEP 4 CHECK THE STATUS

 sudo systemctl status docker

  sleep 5

  sudo systemctl start docker
  sudo systemctl enable docker

  sleep 5

  sudo systemctl status docker
