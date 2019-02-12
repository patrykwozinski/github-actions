#!/bin/bash

set -eu

if echo "$GITHUB_REF" | grep -E $*; then
  echo "Branch is not supported"
  exit 78
fi

echo "Branch filtered"
