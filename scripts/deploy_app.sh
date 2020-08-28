#! /bin/bash

#deploy app using docker stack
docker-compose build
docker login
docker push kkeki/service1:latest
docker push kkeki/service2:latest
docker push kkeki/service3:latest
docker push kkeki/service4:latest
docker stack deploy --compose-file docker-compose.yaml stackapp
#see services on stack
#docker stack services stackapp 