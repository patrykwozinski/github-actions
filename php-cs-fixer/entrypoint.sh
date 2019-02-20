#!/bin/sh -l

COMMAND="git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS}"

echo 'Command:'
echo ${COMMAND}

FILES=$(${COMMAND})

echo "-----------------"
echo "Analysed files:"
echo "-----------------"
echo ${FILES}

/usr/local/bin/php-cs-fixer fix $* ${FILES}
