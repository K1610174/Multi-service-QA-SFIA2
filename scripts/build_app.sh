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

echo "Now building ... "
sudo groupadd -f docker
sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock
docker-compose build
docker-compose push
#docker exec -t sfia2project_service1_1 python3 create.py
