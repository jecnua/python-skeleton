#

## Environment

-   Python 3

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
- <http://flask.pocoo.org/docs/0.12/api/#flask.Request.is_json> too strict

    if request.method == 'GET':
        return jsonify(message='Hello '+name)
        <http://flask.pocoo.org/docs/0.12/api/#flask.json.jsonify>

input_recieved = request.get_json(force=True)

this will return malformed if it's empty or not json!!!

# app.logger.error(request.is_json) # Too strict as it's not specified

## TODO

-   acqua docker scan
-   allow to choose the project name
-   add on test the user greeting and error code
