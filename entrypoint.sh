#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

# Wait until PostgreSQL is ready
until pg_isready -h "$DATABASE_HOST" -U "$DATABASE_USERNAME"; do
  echo "Waiting for database to be ready..."
  sleep 1
done

# Set up database
bundle exec rails db:create db:migrate

# Execute the container's main process
exec "$@"
