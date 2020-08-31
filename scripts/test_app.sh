#! /bin/bash

sudo apt-get install -y python3-venv
export TEST_DB="$TEST_DB"

git clone https://github.com/K1610174/QA-SFIA2.git

cd QA-SFIA2
#test service1
cd service1
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service2
cd service2
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service3
cd service3
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service4
cd service4
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

cd ..
rm -rf QA-SFIA2