#!/bin/bash
set -e

PORT=${PORT:-8081}
IMAGE=${IMAGE:-my-php-webapp}
CONTAINER_NAME=my-php-app

echo "🛠️ Deploying Docker container..."
echo "👉 Using image: $IMAGE"
echo "👉 Mapping container port 80 to host port $PORT"

# Stop any existing container
docker rm -f $CONTAINER_NAME 2>/dev/null || true

# Run new container
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:80 \
  $IMAGE

# Get host IP dynamically
HOST_IP=$(curl -s http://checkip.amazonaws.com)
echo "✅ Deployment complete. App is running at: http://$HOST_IP:$PORT/"
