from flask import Flask
app=Flask(__name__)

@app.route('/')
def demo():
    return "hello! This is new Rest Api Project on Laptop Prices"

from controller import lap_item_controller
from model import lap_item_model

if __name__=='__main__':
   app.run(debug=True)