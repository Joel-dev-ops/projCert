#!/bin/bash
set -e

echo "Waiting for Apache to start..."

# Wait for port 80 to be ready (max 10 seconds)
for i in {1..10}; do
  if curl -s http://localhost > /dev/null; then
    echo "Apache is up!"
    break
  fi
  echo "Apache not ready yet... retrying in 1s"
  sleep 1
done

echo "Testing PHP app homepage..."

response=$(curl -s http://localhost)

if echo "$response" | grep -q "Welcome"; then
  echo "Homepage test passed!"
  exit 0
else
  echo "Homepage test failed: 'Welcome' text not found"
  echo "Response was:"
  echo "$response"
  exit 1
fi

