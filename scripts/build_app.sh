#! /bin/bash

#install ansible and run playbook
#sudo apt-get update
#sudo apt-get install python3 python3-pip -y
#mkdir -p ~/.local/bin
#echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
#sudo chown -R $(whoami):$(whoami) ~/*
#source ~/.bashrc
#pip3 install --user ansible
~/.local/bin/ansible --version
~/.local/bin/ansible-playbook -i inventory.cfg playbook.yaml
docker --version
docker-compose --version
#build images using docker
export MYSQL_DB=mysql+pymysql://root:1234@database:3306/fortune
export MYSQL_ROOT_PASSWORD=1234
export TEST_DB_URI="mysql+pymysql://root:sqldatabase@34.89.57.102:3306/fortune
docker-compose build
#docker-compose up -d
#docker login
