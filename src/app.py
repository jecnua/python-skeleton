from flask import Flask, request
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/', methods=['GET','PUT'])
def hello_world():
    if request.method == 'GET':
        return 'Hello, World! GET'
    if request.method == 'PUT':
        return 'Hello, World! PUT'
