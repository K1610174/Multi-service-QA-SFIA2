#! /bin/bash

#install ansible and run playbook
sudo apt-get update
sudo apt-get install python3 python3-pip -y
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
sudo chown -R $(whoami):$(whoami) ~/*
source ~/.bashrc
pip3 install --user ansible
~/.local/bin/ansible --version
~/.local/bin/ansible-playbook -i inventory.cfg playbook.yaml
export MYSQL_DB="${MYSQL_DB}"
echo "${MYSQL_DB}"
export MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}"
export TEST_DB="${TEST_DB}"
docker-compose build