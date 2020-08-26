from flask import redirect, url_for, Response, request
from application import app
import requests
import random

@app.route('/')
@app.route('/starsign', methods=['GET'])
def starsign():
    starsign_list=["Aries","Taurus","Gemini","Cancer","Leo", "Virgo",
    "Libra","Scorpio","Sagittarius","Capricorn","Aquarius"]
    starsign = random.choice(starsign_list)
    return Response(starsign, mimetype='text/plain')