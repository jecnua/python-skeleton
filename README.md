#

## Environment

- Python 3

## Usage

    ./script path-to-dir

##

    pipenv install
    export FLASK_APP=src/app.py
    FLASK_APP=src/app.py pipenv run flask run

##

    docker build . -t python-test:latest
    docker rm -f python-test
    docker run --rm --name python-test -d -p 5000:5000 python-test:latest

https://github.com/fdhadzh/flask-pipenv-example


##

Different error code: http://flask.pocoo.org/docs/1.0/quickstart/#about-responses

Validate https://pythonhosted.org/Flask-Inputs/

## TODO

- acqua docker scan
- allow to choose the project name
- add on test the user greeting and error code
