#!/bin/bash

docker rm -f python-test
docker run --rm --name python-test -d -p 5000:80 python-test:latest
