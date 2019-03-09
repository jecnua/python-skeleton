#!/bin/bash

set -e

IMAGE_NAME=$(uuid)

hadolint Dockerfile
shellcheck run.sh
shellcheck test.sh
pipenv run pytest
docker build . -t "$IMAGE_NAME":latest
dgoss run "$IMAGE_NAME"
