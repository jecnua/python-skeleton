import logging
import uuid
import gunicorn

from flask import Flask, request, jsonify
from flask.logging import default_handler
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/', methods=['GET', 'PUT'])
def hello_world():
    if request.method == 'GET':
        app.logger.info('INFO FROM ORIGINAL')
        app.logger.error('ERROR FROM ORIGINAL') # this works
        return 'Hello, World! GET'
    if request.method == 'PUT':
        return 'Hello, World! PUT'

if __name__ == '__main__':
    app.run()

if __name__ != '__main__':
    gunicorn_logger = logging.getLogger('gunicorn.error')
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)
