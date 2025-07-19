#!/bin/bash
set -e

CONTAINER_NAME="php-webapp"
IMAGE_NAME="my-php-webapp:latest"
PORT=8080

echo "Removing existing container..."
docker rm -f $CONTAINER_NAME || true

echo "Starting new container..."
docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME

echo "App is now running on http://localhost:$PORT"
