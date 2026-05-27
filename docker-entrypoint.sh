#!/bin/sh
set -e

if [ ! -d /app/node_modules/.package-lock.json ] && [ ! -f /app/node_modules/.install-complete ]; then
  echo "Installing dependencies inside container..."
  npm ci --ignore-scripts
  touch /app/node_modules/.install-complete
fi

exec "$@"
