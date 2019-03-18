#!/bin/sh -l

COMMAND="git diff-index --name-only --diff-filter=MAd HEAD~$(jq --raw-output .pull_request.commits "$GITHUB_EVENT_PATH") ${DIRECTORY}"

echo 'Command:'
echo ${COMMAND}

FILES=$(${COMMAND})

echo "-----------------"
echo "Analysed files:"
echo "-----------------"
echo ${FILES}

composer install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $* ${FILES}
