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
docker images
docker rmi kkeki/service1:latest
docker rmi kkeki/service2:latest
docker rmi kkeki/service3:latest
docker rmi kkeki/service4:latest

git clone https://github.com/K1610174/QA-SFIA2.git
cd QA-SFIA2
docker pull kkeki/service1:latest
docker pull kkeki/service2:latest
docker pull kkeki/service3:latest
docker pull kkeki/service4:latest

docker stack deploy --compose-file docker-compose.yaml appstack
docker container ls -a
docker stack services appstack
cd ..

docker service scale appstack_service1=2
docker service scale appstack_service2=2
docker service scale appstack_service3=2
docker service scale appstack_service4=2
docker stack services appstack
ls
EOF
#rm -rf QA-SFIA2
