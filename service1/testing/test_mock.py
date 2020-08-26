from unittest.mock import patch
from flask import url_for
from flask_testing import TestCase

from application import app

class TestBase(TestCase):
    def create_app(self):
        return app

class TestResponse(TestBase):

    def test_generate(self):
    # We will mock a response of  and test that we get  returned.
        with patch('requests.get') as g:
            g.return_value.text = "1"

            response = self.client.get(url_for('generate'))
            self.assertIn(b'', response.data)