#! /bin/bash

#deploy app using docker stack
#docker-compose build
#docker-compose up -d
#docker stack deploy --compose-file docker-compose.yaml stackapp
#see services on stack
#docker stack services stackapp 
ssh worker-vm-1 << EOF
if ![-d QA-SFIA2]; then
    git clone https://github.com/K1610174/QA-SFIA2.git
fi
EOF
ssh worker-vm-2 << EOF
if ![-d QA-SFIA2]; then
    git clone https://github.com/K1610174/QA-SFIA2.git
fi
EOF

ssh manager-vm-1 << EOF
ls
pwd
whoami

# Clone the repo down so that I can use the docker-compose.yaml
if ![-d QA-SFIA2]; then
    git clone https://github.com/K1610174/QA-SFIA2.git
fi
ls
cd QA-SFIA2
docker stack deploy --compose-file docker-compose.yaml appstack
docker stack services appstack
cd ..
rm -r QA-SFIA2
docker service scale appstack_service1=2
docker service scale appstack_service2=2
docker service scale appstack_service3=2
docker service scale appstack_service4=2
docker stack services appstack
ls
EOF
