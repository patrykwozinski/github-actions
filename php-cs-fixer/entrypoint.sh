#!/bin/sh -l

FILES=$(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})

echo "-----------------"
echo "Analysed files:"
echo "-----------------"
echo ${FILES}

git remote -v

/usr/local/bin/php-cs-fixer fix $* ${FILES}
