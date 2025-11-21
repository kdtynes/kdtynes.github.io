#!/bin/bash

# Exit if any subcommand fails
set -e

# Save current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Build the site
bundle exec jekyll build

# Switch to the gh-pages branch
git checkout gh-pages

# Remove all files under version control
git rm -rf .

touch .nojekyll

# Copy the built site over
cp -r ../_site/* .

# Add, commit, and push the changes
git add --all
git commit -m "Deploy site to gh-pages"
git push origin gh-pages

# Switch back to the original branch
git checkout $current_branch

