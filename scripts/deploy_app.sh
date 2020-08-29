#! /bin/bash

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
if ![-d QA-SFIA2]; then
    git clone https://github.com/K1610174/QA-SFIA2.git
fi
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
EOF
