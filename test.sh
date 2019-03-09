#!/bin/bash

docker build . -t python-test:latest
docker rm -f python-test
docker run --rm --name python-test -d -p 5000:80 python-test:latest
sleep 5
curl localhost:5000
docker logs python-test
