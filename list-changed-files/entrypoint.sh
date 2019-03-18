#!/bin/bash

FILES=$(git diff-index --name-only --diff-filter=MAd HEAD~$(jq --raw-output .pull_request.commits "$GITHUB_EVENT_PATH") $DIRECTORY)

if [[ -z $FILES ]]; then
    echo 'No changed files'
    exit 78
fi

echo $FILES > .ga-changed-files.txt
