#! /bin/bash
cd QA-SFIA2
#test service1
cd service1
python -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service2
cd service2
python -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service3
cd service3
python -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..

#test service4
cd service4
python -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
python3 -m pytest --cov application --cov-report term-missing
cd ..