#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.1.0"
  exit 1
fi

VERSION=$1
FORMULA_FILE="Formula/sitesaver.rb"

if [ ! -f "$FORMULA_FILE" ]; then
  echo "Error: $FORMULA_FILE not found"
  exit 1
fi

echo "Fetching SHA256 hash for version $VERSION..."

SOURCE_SHA=$(curl -sL "https://github.com/tttol/sitesaver/archive/refs/tags/${VERSION}.tar.gz" | shasum -a 256 | cut -d' ' -f1)
echo "Source: $SOURCE_SHA"

echo "Updating $FORMULA_FILE..."

sed -i.bak \
  -e "4s|refs/tags/.*.tar.gz|refs/tags/${VERSION}.tar.gz|" \
  -e "5s/sha256 \".*\"/sha256 \"${SOURCE_SHA}\"/" \
  "$FORMULA_FILE"

rm -f "${FORMULA_FILE}.bak"

echo "Successfully updated $FORMULA_FILE to version $VERSION"
