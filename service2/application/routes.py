from flask import redirect, url_for, Response, request
from application import app
import requests
import random

@app.route('/')
@app.route('/color', methods=['GET'])
def color():
    color_list=["red","orange","yellow","green","blue","indigo","violet"]
    color = random.choice(color_list)
    return Response(color, mimetype='text/plain')