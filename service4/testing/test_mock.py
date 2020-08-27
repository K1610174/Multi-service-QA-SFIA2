from unittest.mock import patch
import unittest
import requests

from flask import url_for
from flask_testing import TestCase
from application import app

class TestBase(TestCase):
    def create_app(self):
        return app
    
class TestResponseS4(TestBase):
    def test_fortune_1(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'red','starsign':'Taurus'})
            self.assertEqual(response.status_code, 200)
            self.assertIn(b'A stranger will bring you some news.', response.data)

    def test_fortune_2(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'pink','starsign':'Scorpio'})
            self.assertIn(b'You will travel to many exotic places.', response.data)
    
    def test_fortune_3(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'green','starsign':'Aries'})
            self.assertIn(b'Change is certain, be accepting.', response.data)
    
    def test_fortune_4(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'yellow','starsign':'Gemini'})
            self.assertIn(b'You are free to invent your life.', response.data)
    
    def test_fortune_5(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'violet','starsign':'Cancer'})
            self.assertIn(b'Avert misunderstanding by calm and poise.', response.data)
    
    def test_fortune_6(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'indigo','starsign':'Virgo'})
            self.assertIn(b'Money! Money! Monney!', response.data)
    
    def test_fortune_7(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'orange','starsign':'Leo'})
            self.assertIn(b'A dream you have will come true.', response.data)
    
    def test_fortune_8(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'blue','starsign':'Aquarius'})
            self.assertIn(b'You will get eaten by a dragon!', response.data)
    
    def test_fortune_9(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'gray','starsign':'Sagittarius'})
            self.assertIn(b'Stand firmly by your convictions.', response.data)

    def test_fortune_a(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'ivory','starsign':'Libra'})
            self.assertIn(b'It better to be the hammer than the nail.', response.data)
    
    def test_fortune_b(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'black','starsign':'Capricorn'})
            self.assertIn(b'Be assertive when decisive action is needed.', response.data)
    
    def test_fortune_c(self):
        with patch('requests.get') as g:

            response = self.client.post(url_for('fortune'),json={'color':'paleblue','starsign':'NotSign'})
            self.assertIn(b'You will become great if you believe in yourself.', response.data)
