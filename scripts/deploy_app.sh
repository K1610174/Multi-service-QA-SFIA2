#! /bin/bash
ssh manager-vm-1 << EOF
docker stack deploy --compose-file docker-compose.yaml myappstack
EOF