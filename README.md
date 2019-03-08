#

## Environment

- Python 3

##

    pipenv install
    export FLASK_APP=src/app.py
    FLASK_APP=src/app.py pipenv run flask run

##

    docker build . -t python-test:latest
    docker rm -f python-test
    docker run --rm --name python-test -d -p 5000:5000 python-test:latest

https://github.com/fdhadzh/flask-pipenv-example
