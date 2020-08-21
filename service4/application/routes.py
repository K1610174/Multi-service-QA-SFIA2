from flask import redirect, url_for, Response, request
from application import app
import requests
import random

@app.route('/')
@app.route('/fortune', methods=['POST'])
def fortune():
    response= request.data.decode('utf-8')
    #[green,Cancer]
    if response == "green":
        fortune = "Change is certain, be accepting."
    elif response=="red":
        fortune= "A smiling stranger will bring you some troubling news."
    elif response=="yellow":
        fortune= "You are free to invent your life."
    elif response=="violet":
        fortune= "Avert misunderstanding by calm, poise, and balance."
    elif response=="orange":
        fortune= "A dream you have will come true"
    elif response=="indigo":
        fortune= "Money! Money! Monney!"
    elif response=="blue":
        fortune= "You will get eaten by a dragon!"
    else:
        fortune= "You will become great if you believe in yourself."
    return Response(fortune, mimetype='text/plain')