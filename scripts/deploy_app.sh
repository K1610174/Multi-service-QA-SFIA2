#! /bin/bash

ssh worker-vm-1 << EOF
git clone https://github.com/K1610174/QA-SFIA2.git
EOF
ssh worker-vm-2 << EOF
git clone https://github.com/K1610174/QA-SFIA2.git
EOF

ssh manager-vm-1 << EOF
export MYSQL_DB="$MYSQL_DB"
export MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD"
export TEST_DB="$TEST_DB"

git clone https://github.com/K1610174/QA-SFIA2.git
cd QA-SFIA2

# docker pull kkeki/service1:latest
# docker pull kkeki/service2:latest
# docker pull kkeki/service3:latest
# docker pull kkeki/service4:latest

docker stack deploy --compose-file docker-compose.yaml appstack
docker service scale appstack_service1=2
docker service scale appstack_service2=2
docker service scale appstack_service3=2
docker service scale appstack_service4=2
docker stack services appstack

docker container ls -a

cd ..
rm -rf QA-SFIA2
EOF
