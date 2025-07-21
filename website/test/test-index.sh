#!/bin/bash
set -e

# Start Apache in the background
echo "Starting Apache..."
apachectl -D FOREGROUND &

echo "Waiting for Apache to start..."

apache_up=false
for i in {1..10}; do
  if curl -s --fail http://127.0.0.1 > /dev/null; then
    echo "Apache is up!"
    apache_up=true
    break
  fi
  echo "Apache not ready yet... retrying in 1s"
  sleep 1
done

if [ "$apache_up" = false ]; then
  echo "Error: Apache did not start within 10 seconds"
  exit 1
fi

echo "Testing PHP app homepage..."

response=$(curl -s http://localhost)

if echo "$response" | grep -q "Welcome to test project"; then
  echo "Homepage test passed!"
  exit 0
else
  echo "Homepage test failed: Expected text not found"
  echo "Response was:"
  echo "$response"
  exit 1
fi
