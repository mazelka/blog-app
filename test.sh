#!/bin/bash
set -e

echo "Running Rails setup and tests in environment: $RAILS_ENV"

bundle exec rails db:create db:schema:load
bundle exec rspec
