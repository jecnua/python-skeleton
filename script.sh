#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "You need to specify 2 parameters."
    echo "./script.sh <path-to-dir> <type>"
    exit 1
fi

DEST_DIR="$1"
PROJECT_TYPE="$2"

if [[ "$PROJECT_TYPE" =~ ^(flask|script)$ ]]; then
    echo "Creating a $PROJECT_TYPE project"
else
    echo "$PROJECT_TYPE is not a possible option"
    exit 1
fi

mkdir -p "$DEST_DIR"

mkdir -p "$DEST_DIR/src"
mkdir -p "$DEST_DIR/tests"

mkdir -p "$DEST_DIR/dist"
touch "$DEST_DIR/dist/.gitignore"
echo '*' > "$DEST_DIR/dist/.gitignore"
echo '!.gitignore' >> "$DEST_DIR/dist/.gitignore"

touch "$DEST_DIR/README.md"

cat << EOF > "$DEST_DIR/README.md"
# Python script

![python-3](https://img.shields.io/badge/python-3-green.svg)
EOF

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
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install --dev pytest-cov
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install --dev isort
PIPENV_IGNORE_VIRTUALENVS=1 pipenv install --dev pre-commit
#PIPENV_IGNORE_VIRTUALENVS=1 pipenv install --dev safety-db

if [[ $PROJECT_TYPE == "flask" ]]
then
  PIPENV_IGNORE_VIRTUALENVS=1 pipenv install flask
  PIPENV_IGNORE_VIRTUALENVS=1 pipenv install flask-inputs
  PIPENV_IGNORE_VIRTUALENVS=1 pipenv install gunicorn
  # PIPENV_IGNORE_VIRTUALENVS=1 pipenv install jsonschema
  # PIPENV_IGNORE_VIRTUALENVS=1 pipenv install structlog
  PIPENV_IGNORE_VIRTUALENVS=1 pipenv install prometheus-flask-exporter
fi
if [[ $PROJECT_TYPE == "script" ]]
then
  PIPENV_IGNORE_VIRTUALENVS=1 pipenv install boto3
fi

popd
pwd

cp -rp "$PROJECT_TYPE"/src/* "$DEST_DIR/src/"
cp -rp "$PROJECT_TYPE"/tests/* "$DEST_DIR/tests/"
cp "$PROJECT_TYPE/Makefile" "$DEST_DIR/"

if [[ $PROJECT_TYPE == "flask" ]]
then
  cp ./*.yaml "$DEST_DIR/"
  cp Dockerfile "$DEST_DIR/"
  cp test.sh "$DEST_DIR/"
  cp run.sh "$DEST_DIR/"
  cp .gitignore "$DEST_DIR/"
  cp .pylintrc "$DEST_DIR/"
  cp env.sh "$DEST_DIR/"
  echo '1.0.0' > "$DEST_DIR/VERSION"
fi
if [[ $PROJECT_TYPE == "script" ]]
then
  cp .gitignore "$DEST_DIR/"
  cp .pylintrc "$DEST_DIR/"
  echo '1.0.0' > "$DEST_DIR/VERSION"
fi

pwd
pushd "$DEST_DIR" || exit

git init || exit 1
git add .
git commit -m 'First commit'

# Test
make develop

popd
pwd

exit 0