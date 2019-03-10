'''
Entrypoint module of the flask application
'''
import logging

from flask import Flask, request
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__) # pylint: disable=C0103
PrometheusMetrics(app)

@app.route('/', methods=['GET', 'PUT'])
def hello_world():
    '''
    Test method
    '''
    if request.method == 'GET':
        app.logger.info('INFO FROM ORIGINAL') # pylint: disable=E1101
        app.logger.error('ERROR FROM ORIGINAL') # pylint: disable=E1101
        return 'Hello, World! GET'
    if request.method == 'PUT':
        return 'Hello, World! PUT'
    raise Exception('Method not allowed')

if __name__ == '__main__':
    app.run()

if __name__ != '__main__':
    GUNICORN_LOGGER = logging.getLogger('gunicorn.error')
    app.logger.handlers = GUNICORN_LOGGER.handlers
    app.logger.setLevel(GUNICORN_LOGGER.level) # pylint: disable=E1101
