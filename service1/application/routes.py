from flask import render_template, redirect, url_for
from application import app
import requests

@app.route('/')

@app.route('/home', methods=['GET'])
def home():
    return render_template('home.html', title='Home')

@app.route('/get/random',methods=['GET','POST'])
def generate():
    response1 = requests.get("http://service2:5001/color") 
    response2 = requests.get("http://service3:5002/starsign")    
    data=[response1.text,response2.text]
    response3 = requests.post("http://service4:5003/fortune", data=data[0] ) 

    return render_template('color.html',title='Services', color=response1.text, starsign=response2.text, fortune=response3.text)