#!/bin/bash


DEST_DIR=$1

mkdir -p $DEST_DIR

mkdir -p $DEST_DIR/src
mkdir -p $DEST_DIR/src/tests
cp -rp src/* $DEST_DIR/src/
mkdir -p $DEST_DIR/dist
touch $DEST_DIR/dist/.gitignore
touch $DEST_DIR/README.md

# echo '[MESSAGES CONTROL]' > $DEST_DIR/.pylintrc
# echo 'disable=C0301' >> $DEST_DIR/.pylintrc

# echo '**.zip' >> $DEST_DIR/.gitignore
# echo '**.pytest*' >> $DEST_DIR/.gitignore
# echo '**pycache*' >> $DEST_DIR/.gitignore

pwd
pushd $DEST_DIR || exit

pipenv install --dev pylint
pipenv install flask
pipenv install boto3
pipenv install flask
pipenv install structlog
pipenv install prometheus-flask-exporter

popd
pwd

cp *.yaml $DEST_DIR/
cp Dockerfile $DEST_DIR/
cp test.sh $DEST_DIR/
cp run.sh $DEST_DIR/
cp .gitignore $DEST_DIR/
cp .pylintrc $DEST_DIR/
