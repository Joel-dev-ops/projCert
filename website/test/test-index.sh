#!/bin/bash
set -e

# Simple test: curl homepage and check for expected content
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
