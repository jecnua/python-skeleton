#!/bin/bash

mkdir -p src
mkdir -p src/tests
mkdir -p dist
touch dist/.gitignore

echo '[MESSAGES CONTROL]' > .pylintrc
echo 'disable=C0301' > .pylintrc

echo '**.zip' >> .gitignore
echo '**.pytest*' >> .gitignore
echo '**pycache*' >> .gitignore


pipenv install --dev pylint
pipenv install flask
