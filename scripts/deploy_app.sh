#! /bin/bash

#deploy app using docker stack
#docker-compose build
#docker-compose up -d
docker stack deploy --compose-file docker-compose.yaml stackapp
#see services on stack
#docker stack services stackapp 
