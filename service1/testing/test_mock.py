import requests
import unittest
import requests_mock

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask import url_for
from application import app,db
from unittest.mock import patch
from flask_testing import TestCase
from application.models import Fortunes
from os import getenv


class TestBase(TestCase):
    def create_app(self):
        config_name = 'testing'
        app.config.update(SQLALCHEMY_DATABASE_URI=str(getenv('TEST_DB')) )
        return app

    def setUp(self):
        db.session.commit()
        db.drop_all()
        db.create_all()
        fortunes=Fortunes(color="red",starsign="Taurus",fortune="A stranger will bring you some news.")

        db.session.add(fortunes)
        db.session.commit()

    def tearDown(self):
        db.session.remove()
        db.drop_all()


class TestResponseS1(TestBase):
    def test_generate(self):
        with self.client:
            with requests_mock.Mocker() as r:
                r.get('http://service2:5001/color', text='red')
                r.get('http://service3:5002/starsign', text='Taurus')
                r.post('http://service4:5003/fortune', text='A stranger will bring you some news.')                
                response = self.client.get(url_for('generate'),follow_redirects=True)
                self.assertEqual(response.status_code, 200)
    
    def test_homepage_view(self):
        response = self.client.get(url_for('home'))
        self.assertEqual(response.status_code, 200)
