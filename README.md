# Python module skeleton - TO BE REFINED

[![License: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![](https://img.shields.io/maintenance/yes/2021.svg)
![python-3](https://img.shields.io/badge/python-3-green.svg)

_TO_BE_REFINED_

_DISCLAIMER_: This module has been created in a hurry so it not at the same
standards of the others.

This module will create a python3 flask project (with docker and testing).

## Usage

You will need to call the script passing as a parameter the new project path and type:

    ./script.sh <path-to-dir> <type>

Type can be of value:

- flask
- script

For example:

    ./script.sh /tmp/jecnua-new-project flask

## Test

To run the python app locally (not in docker):

    pipenv install
    export FLASK_APP=src/app.py
    FLASK_APP=src/app.py pipenv run flask run

## Build

Build and run docker:

    docker build . -t python-test:latest
    docker rm -f python-test
    docker run --rm --name python-test -d -p 5000:5000 python-test:latest

## Notes

-   <https://github.com/fdhadzh/flask-pipenv-example>

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

## Notes

Limitation of cli and endpoint.

- <https://github.com/aws/aws-cli/issues/1270>

## TODO

-   Add a version for lambdas
-   Add travis
-   Add acqua docker scan
-   Allow to choose the project name
-   Import all new learning
