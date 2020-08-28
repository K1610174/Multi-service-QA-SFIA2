#! /bin/bash

#install ansible and run playbook
sudo apt-get update
sudo apt-get install python -y
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip3 install --user ansible
ansible --version

#clone git repo
if ![-d chaperootodo_client]; then
    git clone https://github.com/K1610174/QA-SFIA2.git
fi

ansible-playbook -i inventory.cfg playbook.yaml

#build images using docker
source ~/.bashrc
#docker-compose build
docker-compose up -d
#docker login
