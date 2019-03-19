#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "You need to specify 1 parameters."
    echo "./script.sh <path-to-dir>"
    exit 1
fi

DEST_DIR="$1"

mkdir -p "$DEST_DIR"

mkdir -p "$DEST_DIR/src"
cp -rp src/* "$DEST_DIR/src/"

mkdir -p "$DEST_DIR/tests"
cp -rp tests/* "$DEST_DIR/tests/"

mkdir -p "$DEST_DIR/dist"
touch "$DEST_DIR/dist/.gitignore"
echo '*' > "$DEST_DIR/dist/.gitignore"
echo '!.gitignore' >> "$DEST_DIR/dist/.gitignore"

touch "$DEST_DIR/README.md"

# echo '[MESSAGES CONTROL]' > $DEST_DIR/.pylintrc
# echo 'disable=C0301' >> $DEST_DIR/.pylintrc

# echo '**.zip' >> $DEST_DIR/.gitignore
# echo '**.pytest*' >> $DEST_DIR/.gitignore
# echo '**pycache*' >> $DEST_DIR/.gitignore

pwd
pushd "$DEST_DIR" || exit

# DEV
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install --dev pylint
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install --dev pytest

#
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install flask
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install flask-inputs
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install gunicorn
# PIPENV_IGNORE_VIRTUALENVS=1 pipenv install jsonschema
# PIPENV_IGNORE_VIRTUALENVS=1 pipenv install structlog
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install prometheus-flask-exporter

popd
pwd

cp ./*.yaml "$DEST_DIR/"
cp Dockerfile "$DEST_DIR/"
cp test.sh "$DEST_DIR/"
cp run.sh "$DEST_DIR/"
cp .gitignore "$DEST_DIR/"
cp .pylintrc "$DEST_DIR/"
cp Makefile "$DEST_DIR/"
cp env.sh "$DEST_DIR/"
cp VERSION "$DEST_DIR/"
