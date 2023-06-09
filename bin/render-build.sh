#!/usr/bin/env bash
# exit on error
set -o errexit

# Build commands for front end to create the production build
rm -rf public
npm install --prefix vite-project/ && npm run build --prefix vite-project/

# Build commands for back end
bundle install
bundle exec rails db:migrate
# bundle exec rake db:seed # if you have seed data, run this command for the initial deploy only to avoid duplicate records