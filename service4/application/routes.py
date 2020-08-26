from flask import redirect, url_for, Response, request
from application import app
import requests
import random

@app.route('/')
@app.route('/fortune', methods=['POST'])
def fortune():
    response=request.get_json()
    if response['color'] == "green" or response['starsign']=="Aries":
        fortune = "Change is certain, be accepting."
    elif response['color']=="red" or response['starsign']=="Taurus":
        fortune= "A smiling stranger will bring you some troubling news."
    elif response['color']=="yellow" or response['starsign']=="Gemini":
        fortune= "You are free to invent your life."
    elif response['color']=="violet" or response['starsign']=="Cancer":
        fortune= "Avert misunderstanding by calm, poise, and balance."
    elif response['color']=="orange" or response['starsign']=="Leo":
        fortune= "A dream you have will come true."
    elif response['color']=="indigo" or response['starsign']=="Virgo":
        fortune= "Money! Money! Monney!"
    elif response['color']=="blue" or response['starsign']=="Aquarius":
        fortune= "You will get eaten by a dragon!"
    elif response['color']=="black" or response['starsign']=="Capricorn":
        fortune= "Be assertive when decisive action is needed."
    elif response['color']=="pink" or response['starsign']=="Scorpio":
        fortune= "You will travel to many exotic places in your lifetime."
    elif response['color']=="gray" or response['starsign']=="Sagittarius":
        fortune= "If you feel you are right, stand firmly by your convictions."
    elif response['color']=="ivory" or response['starsign']=="Libra":
        fortune= "It better to be the hammer than the nail."
    else:
        fortune= "You will become great if you believe in yourself."
    return Response(fortune, mimetype='text/plain')

    #"ivory","gray","black","pink"