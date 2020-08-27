from unittest.mock import patch
from flask import url_for
from flask_testing import TestCase

from application import app

class TestBase(TestCase):
    def create_app(self):
        return app

class TestResponseS2(TestBase):

    def test_color(self):
        with patch('requests.get') as c:
            c.return_value.text = "red"

            response = self.client.get(url_for('color'))
            #self.assertIn(b'red', response.data)
            self.assertEqual(response.status_code, 200)