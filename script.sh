#!/bin/bash

# Define source (Practice1) and destination (Practice2) repository URLs
SOURCE_REPO="https://github.com/Kedar-Kutaskar/Practice1.git"
DESTINATION_REPO="https://github.com/Kedar-Kutaskar/Practice2.git"

# Clone the source repository
git clone "$SOURCE_REPO" source_repo
cd source_repo

# Authenticate for pushing to the destination repository
# You might need to set up your SSH keys or use a Personal Access Token (PAT)
# Replace 'YOUR_ACCESS_TOKEN' with your actual GitHub personal access token
git remote set-url origin "$DESTINATION_REPO"

# Fetch latest changes from the source repository
git fetch origin

# Create a new branch in the destination repository
NEW_BRANCH_NAME="synced-$(date +"%Y%m%d%H%M%S")"
git checkout -b "$NEW_BRANCH_NAME"

# Push the fetched changes to the new branch in the destination repository
git push origin "$NEW_BRANCH_NAME"

# Clean up
cd ..
rm -rf source_repo

echo "Code pulled from Practice1 repository and pushed to Practice2 repository."
