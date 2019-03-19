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
        app.logger.info('INFO LEVEL GET METHOD /') # pylint: disable=E1101
        app.logger.error('ERROR LEVEL GET METHOD /') # pylint: disable=E1101
        return 'Hello, World! GET'
    if request.method == 'PUT':
        return 'Hello, World! PUT'
    raise Exception('Method not allowed')

@app.route('/hello/<user>', methods=['GET'])
def hello_user(user):
    '''
    This methos shows how to use (part of) the endpoint
    as parameter for the function
    '''
    return 'Hello ' + str(user)

@app.route('/modify/<user>', methods=['PUT'])
def modify_user(user):
    '''
    This methos shows how you can return a different error
    code than 200
    '''
    app.logger.info('INFO LEVEL PUT METHOD /modify/<user> WITH' + str(user)) # pylint: disable=E1101
    return '', 204 # This way you return the code of your choice

if __name__ == '__main__':
    app.run()

if __name__ != '__main__':
    GUNICORN_LOGGER = logging.getLogger('gunicorn.error')
    app.logger.handlers = GUNICORN_LOGGER.handlers
    app.logger.setLevel(GUNICORN_LOGGER.level) # pylint: disable=E1101
