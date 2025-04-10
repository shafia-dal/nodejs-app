#!/bin/bash
CONTAINER_NAME="my-nodejs-repo"

echo "Trying to stop container: $CONTAINER_NAME"

if sudo docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  sudo docker stop "$CONTAINER_NAME" || true
  sudo docker rm "$CONTAINER_NAME" || true
else
  echo "Container $CONTAINER_NAME does not exist, skipping stop."
fi