from flask import Flask, render_template
import random

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/hello')
def helloSimple():
    return render_template('hello.html', name="John")

@app.route('/hello/<name>')
def hello(name):
    return render_template('hello.html', name=name)

@app.errorhandler(404)
def notFound(error):
    return render_template('notFound.html'), 404

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
