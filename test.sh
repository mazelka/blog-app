#!/bin/bash
set -e

echo "Running Rails setup and tests in environment: $RAILS_ENV"

bundle exec rails db:drop db:create db:schema:load
bundle exec rspec > rspec.log 2>&1
cat rspec.log 