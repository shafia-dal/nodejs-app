#!/bin/bash

CONTAINER_NAME="my-nodejs-repo" # Replace with the actual name of your Docker container

echo "Performing health check for Docker container: $CONTAINER_NAME"

# Check if the container is running
if docker ps --filter "name=^${CONTAINER_NAME}$" --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
  echo "Docker container '$CONTAINER_NAME' is running."
else
  echo "Docker container '$CONTAINER_NAME' is NOT running."
  exit 1 # Exit with a non-zero status code to indicate failure
fi

exit 0 # Exit with a zero status code to indicate success