#!/bin/bash

set -eu

if ! git diff-index --quiet HEAD~$(jq '.commits | length' "${GITHUB_EVENT_PATH}") $*; then
  echo "Changes in $*, proceeding"
else
  echo "No changes in $*, stopping" && echo "ignore:$*" >> "$HOME/ignore"
fi
