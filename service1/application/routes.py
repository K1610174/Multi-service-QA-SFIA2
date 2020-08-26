from flask import render_template, redirect, url_for
from application import app, db
from application.models import Fortunes
import requests

@app.route('/')

@app.route('/home', methods=['GET'])
def home():
    return render_template('home.html', title='Home')

@app.route('/get/random',methods=['GET','POST'])
def generate():
    response1 = requests.get("http://service2:5001/color") 
    response2 = requests.get("http://service3:5002/starsign")    
    response3 = requests.post("http://service4:5003/fortune", json={'color':response1.text,'starsign':response2.text} ) 

    fortunes=Fortunes(color=response1.text,starsign=response2.text,fortune=response3.text)
    db.session.add(fortunes)
    db.session.commit()
    
    return render_template('color.html',title='Services',fortune=response3.text)
