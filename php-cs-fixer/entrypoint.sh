#!/bin/sh -l

FILES=$(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})

echo '------------------'
echo 'Files to analyse:'
echo '------------------'
echo ${FILES}

ls -al

/usr/local/bin/php-cs-fixer fix $* ${FILES}
