#!/usr/bin/env bash

### Configure environment

set -o errexit    # always exit on error
set -o pipefail   # don't ignore exit codes when piping output
set -o nounset    # fail on unset variables
set -o noglob     # disable filename expansion

### Configure directories

BUILD_DIR=${BUILD_DIR:-"/code"}

### Handle errors

handle_failure() {
  echo "-> Build failed"
}
trap 'handle_failure' ERR

### Compile

# Go to code
cd ${BUILD_DIR}

# Install dependencies
npm install

# Build application
gulp

echo "-> Build finished"
