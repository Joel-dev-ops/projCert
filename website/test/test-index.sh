#!/bin/bash
set -e

echo "Waiting for Apache to start..."

# Wait for Apache to respond (up to 10 seconds)
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

# Check for presence of the form element in HTML
if echo "$response" | grep -q "<form"; then
  echo "Homepage test passed!"
  exit 0
else
  echo "Homepage test failed: Form not found"
  echo "Response was:"
  echo "$response"
  exit 1
fi

