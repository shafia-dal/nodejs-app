#!/bin/bash
AWS_ACCOUNT_ID=091846656105
AWS_REGION=us-east-1
IMAGE_REPO_NAME="my-nodejs-repo" # Ensure this matches your buildspec
IMAGE_TAG=latest # Get the specific commit/build ID
CONTAINER_NAME="my-nodejs-repo"
echo "Running Docker container: $CONTAINER_NAME"
echo "  Image: $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG"
echo "  Port Mapping: -p $APP_PORT:$APP_PORT"

docker run -d --name my-nodejs-repo \
    -p 80:4000 \
    $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG

# Check if the container started successfully
    if [ $? -eq 0 ]; then
  echo "Docker container '$CONTAINER_NAME' started successfully."
else
  echo "Error starting Docker container. Check logs for details."
  exit 1
fi