#! /bin/bash

#install ansible and run playbook
#sudo apt-get update
#sudo apt-get install python3 python3-pip -y
#mkdir -p ~/.local/bin
#echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
#sudo chown -R $(whoami):$(whoami) ~/*
#source ~/.bashrc
#pip3 install --user ansible
#~/.local/bin/ansible --version
#/var/lib/jenkins/.local/bin/ansible --version
#/var/lib/jenkins/.local/bin/ansible-playbook -v -i /var/lib/jenkins/workspace/sfia2/inventory.cfg playbook.yaml
/home/jenkins/.local/bin/ansible --version
/home/jenkins/.local/bin/ansible-playbook -i inventory.cfg playbook.yaml
docker --version
docker-compose --version

#~/.local/bin/ansible-playbook -i /var/lib/jenkins/workspace/sfia2/inventory.cfg playbook.yaml

#build images using docker
#docker-compose build
#docker-compose up -d
#docker login
