#! /bin/bash


git clone https://github.com/K1610174/QA-SFIA2.git


cd QA-SFIA2
#test service1
cd service1
python3 -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service2
cd service2
python3 -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service3
cd service3
python3 -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service4
cd service4
python3 -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

cd ..
rm -r QA-SFIA2