#!/bin/bash

set -e

REPO_NAME=$1

if [ -z "$REPO_NAME" ]; then
  echo "Usage: ./scripts/remove-repo.sh <repo-folder-name>"
  exit 1
fi

TARGET_DIR="packages/$REPO_NAME"

if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ Directory '$TARGET_DIR' does not exist."
  exit 1
fi

# Remove the directory
rm -rf "$TARGET_DIR"
echo "🗑️ Removed $TARGET_DIR"

# Update package.json workspaces
jq ".workspaces |= map(select(. != \"packages/$REPO_NAME\"))" package.json > tmp.json && mv tmp.json package.json

echo "✅ Removed 'packages/$REPO_NAME' from workspaces."
