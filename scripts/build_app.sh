#! /bin/bash

#install ansible and run playbook
sudo apt-get update
sudo apt-get install python -y
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip install --user ansible
ansible --version

ansible-playbook -i inventory.cfg playbook.yaml

#build images using docker
source ~/.bashrc
docker-compose build
docker login
docker push kkeki/service1:latest
docker push kkeki/service2:latest
docker push kkeki/service3:latest
docker push kkeki/service4:latest