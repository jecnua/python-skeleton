# Python module skeleton - TO BE REFINED

[![License: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![](https://img.shields.io/maintenance/yes/2019.svg)
![python-3](https://img.shields.io/badge/python-3-green.svg)

_TO_BE_REFINED_

This module has been created in a hurry while preparing a test so it not at the same standards of the others.

## Environment

-   Python 3

## Usage

    ./script <path-to-dir>

## Test

    pipenv install
    export FLASK_APP=src/app.py
    FLASK_APP=src/app.py pipenv run flask run

## Build

    docker build . -t python-test:latest
    docker rm -f python-test
    docker run --rm --name python-test -d -p 5000:5000 python-test:latest

<https://github.com/fdhadzh/flask-pipenv-example>

## Notes

How to build url with variables:

-   <http://flask.pocoo.org/docs/latest/quickstart/#variable-rules>

Different error code:

-   <http://flask.pocoo.org/docs/1.0/quickstart/#about-responses>

Validate <https://pythonhosted.org/Flask-Inputs/>

## Ignored for now

-   <https://github.com/nathancahill/flask-inputs>
-   <https://gitlab.com/vector.kerr/flask-jsonschema-validator>
-   <http://flask.pocoo.org/docs/0.12/api/#flask.Request.is_json> too strict

      if request.method == 'GET':
          return jsonify(message='Hello '+name)
          <http://flask.pocoo.org/docs/0.12/api/#flask.json.jsonify>

## Validation

    input_recieved = request.get_json(force=True)

This will return malformed if it's empty or not json.

    app.logger.error(request.is_json) # Too strict as it's not specified

## TODO

-   Add travis
-   Add acqua docker scan
-   Allow to choose the project name
-   Import all new learning from the test
