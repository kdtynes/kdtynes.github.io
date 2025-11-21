#!/bin/bash

# Exit if any subcommand fails
set -e

# Build the site
bundle exec jekyll build

rm -r docs/
mv _site/ docs/

# Add, commit, and push the changes
git add --all
git commit -m "Deploy site"
git push origin master
