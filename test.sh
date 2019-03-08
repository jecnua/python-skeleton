#!/bin/bash

hadolint Dockerfile
# shellcheck "*.sh"
docker build . -t python-test:latest
dgoss run python-test
