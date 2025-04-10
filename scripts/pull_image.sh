#!/bin/bash
AWS_ACCOUNT_ID=091846656105
AWS_REGION=us-east-1
IMAGE_REPO_NAME="my-nodejs-repo" # Ensure this matches your buildspec
IMAGE_TAG=latest # Get the specific commit/build ID

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it."
    exit 1
fi
sudo apt install -y docker.io
# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install it."
    exit 1
fi
echo "Pulling Docker image from ECR:"
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
echo "Pulling Docker image from ECR:"
echo "  Registry: $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
echo "  Repository: $IMAGE_REPO_NAME"
echo "  Tag: $IMAGE_TAG"
docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG

if [ $? -eq 0 ]; then
  echo "Docker image pulled successfully."
else
  echo "Error pulling Docker image. Check logs for details."
  exit 1
fi
