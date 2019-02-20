#!/bin/sh -l

COMMAND="git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS}"

echo 'Command:'
echo ${COMMAND}

FILES=$(${COMMAND})

echo "-----------------"
echo "Analysed files:"
echo "-----------------"
echo ${FILES}

composer install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $* ${FILES}
