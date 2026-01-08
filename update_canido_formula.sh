#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.1.0"
  exit 1
fi

VERSION=$1
FORMULA_FILE="Formula/canido.rb"

if [ ! -f "$FORMULA_FILE" ]; then
  echo "Error: $FORMULA_FILE not found"
  exit 1
fi

echo "Fetching SHA256 hashes for version $VERSION..."

MACOS_ARM_SHA=$(curl -sL "https://github.com/tttol/canido/releases/download/v${VERSION}/canido-aarch64-apple-darwin.tar.gz" | shasum -a 256 | cut -d' ' -f1)
echo "macOS ARM64: $MACOS_ARM_SHA"

MACOS_INTEL_SHA=$(curl -sL "https://github.com/tttol/canido/releases/download/v${VERSION}/canido-x86_64-apple-darwin.tar.gz" | shasum -a 256 | cut -d' ' -f1)
echo "macOS x86_64: $MACOS_INTEL_SHA"

LINUX_ARM_SHA=$(curl -sL "https://github.com/tttol/canido/releases/download/v${VERSION}/canido-aarch64-unknown-linux-gnu.tar.gz" | shasum -a 256 | cut -d' ' -f1)
echo "Linux ARM64: $LINUX_ARM_SHA"

LINUX_INTEL_SHA=$(curl -sL "https://github.com/tttol/canido/releases/download/v${VERSION}/canido-x86_64-unknown-linux-gnu.tar.gz" | shasum -a 256 | cut -d' ' -f1)
echo "Linux x86_64: $LINUX_INTEL_SHA"

echo "Updating $FORMULA_FILE..."

sed -i.bak \
  -e "4s/version \".*\"/version \"${VERSION}\"/" \
  -e "10s/sha256 \".*\"/sha256 \"${MACOS_ARM_SHA}\"/" \
  -e "14s/sha256 \".*\"/sha256 \"${MACOS_INTEL_SHA}\"/" \
  -e "21s/sha256 \".*\"/sha256 \"${LINUX_ARM_SHA}\"/" \
  -e "25s/sha256 \".*\"/sha256 \"${LINUX_INTEL_SHA}\"/" \
  "$FORMULA_FILE"

rm -f "${FORMULA_FILE}.bak"

echo "Successfully updated $FORMULA_FILE to version $VERSION"
