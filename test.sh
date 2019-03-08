#!/bin/bash

set -e

hadolint Dockerfile
shellcheck run.sh
shellcheck test.sh
pipenv run pytest
docker build . -t python-test:latest
dgoss run python-test
