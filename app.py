from flask import Flask
app=Flask(__name__)

@app.route('/')
def home():
    return "hello! This is new Rest Api Project on Laptop Prices"

from controller import *


if __name__=='__main__':
   app.run(debug=True)
