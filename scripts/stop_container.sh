# #!/bin/bash
# # Replace 'my-nodejs-container' with the actual name of your Docker container
# docker stop my-nodejs-repo
# docker rm my-nodejs-repo

#!/bin/bash
set -euo pipefail
CONTAINER_NAME="my-nodejs-repo"

echo "Trying to stop container: $CONTAINER_NAME"

if sudo docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  sudo docker stop "$CONTAINER_NAME" || true
  sudo docker rm "$CONTAINER_NAME" || true
else
  echo "Container $CONTAINER_NAME does not exist, skipping stop."
fi
