#! /bin/bash

#install ansible and run playbook
sudo apt-get update
sudo apt-get install python -y
pwd
whoami
#mkdir -p ~/.local/bin
#echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
#sudo chown -R $(whoami):$(whoami) ~/*
#source ~/.bashrc
#pip3 install --user ansible
#~/.local/bin/ansible --version
ls
/home/jenkins/.local/bin/ansible --version
/home/jenkins/.local/bin/ansible-playbook -i inventory.cfg playbook.yaml
docker --version
docker-compose --version

#~/.local/bin/ansible-playbook -i inventory.cfg playbook.yaml

#build images using docker
docker-compose build
#docker-compose up -d
#docker login
