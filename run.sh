#!/bin/bash

IMAGE_NAME=$(uuid)
PORT=$(shuf -i 2000-65000 -n 1)

docker build . -t "$IMAGE_NAME:latest"
docker rm -f "$IMAGE_NAME"
docker run --rm --name "$IMAGE_NAME" -d -p "$PORT":80 "$IMAGE_NAME:latest"
sleep 5
curl localhost:"$PORT"
docker logs "$IMAGE_NAME"
