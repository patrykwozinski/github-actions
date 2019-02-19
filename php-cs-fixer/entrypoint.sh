#!/bin/sh -l

FILES=$(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})

echo '------------------'
echo 'Files to analyse:'
echo '------------------'
echo ${FILES}

/usr/local/bin/php-cs-fixer fix $* ${FILES}
