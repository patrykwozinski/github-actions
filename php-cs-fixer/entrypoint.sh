#!/bin/sh -l

FILES=$(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})

git branch

/usr/local/bin/php-cs-fixer fix $* ${FILES}
