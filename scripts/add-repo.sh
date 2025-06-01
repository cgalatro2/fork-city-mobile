#!/bin/bash

set -e

REPO_URL=$1

if [ -z "$REPO_URL" ]; then
  echo "Usage: ./scripts/add-repo.sh <github-repo-url>"
  exit 1
fi

FOLDER_NAME=$(basename "$REPO_URL" .git)
TARGET_DIR="packages/$FOLDER_NAME"

# Clone the repo
git clone "$REPO_URL" "$TARGET_DIR"

# Add to package.json workspaces
jq --arg path "packages/$FOLDER_NAME" '
  .workspaces |= (
    if index($path) == null then . + [$path] else . end
  )
' package.json > tmp.json && mv tmp.json package.json

echo "✅ Repo '$FOLDER_NAME' added to packages/ and registered in workspaces."
