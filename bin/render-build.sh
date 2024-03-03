#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
# No worries it's just a small app and free version of render is not allowing me to open up console and execute commands
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed