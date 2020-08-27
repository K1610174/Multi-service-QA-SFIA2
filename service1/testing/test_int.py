import unittest
import time

from flask import url_for
from urllib.request import urlopen
from os import getenv
from flask_testing import LiveServerTestCase
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from application import app, db
from application.models import Fortunes

test_color="red"
test_starsign="Taurus"
test_fortune="A stranger will bring you some news."

class TestBase(LiveServerTestCase):

    def create_app(self):
        app.config['SQLALCHEMY_DATABASE_URI'] = str(getenv('TEST_DB'))
        return app

    def setUp(self):

        print("--------------------------NEXT-TEST----------------------------------------------")
        chrome_options = Options()
        chrome_options.binary_location = "/usr/bin/chromium-browser"
        chrome_options.add_argument("--headless")
        self.driver = webdriver.Chrome(executable_path="/home/karugaba/chromedriver", chrome_options=chrome_options)
        self.driver.get("http://localhost:5000")
        db.session.commit()
        db.drop_all()
        db.create_all()

    def tearDown(self):
        self.driver.quit()
        print("--------------------------END-OF-TEST----------------------------------------------\n\n\n-------------------------UNIT-AND-SELENIUM-TESTS----------------------------------------------")

    def test_server_is_up_and_running(self):
        response = urlopen("http://localhost:5000")
        self.assertEqual(response.code, 200)

class TestHome(TestBase):
    def test_home(self):
        self.driver.find_element_by_xpath("/html/body/div[1]/a").click()
        time.sleep(1)
        self.driver.find_element_by_xpath("/html/body/div[2]/div/a").click()
        time.sleep(1)

        assert url_for('generate') in self.driver.current_url

class TestGetRandom(TestBase):
    def test_back_to_home(self):
        self.driver.find_element_by_xpath("/html/body/div[1]/a").click()
        time.sleep(1)

        assert url_for('home') in self.driver.current_url