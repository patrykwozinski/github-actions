#!/bin/sh -l

sh -c "/usr/local/bin/php-cs-fixer fix $* $(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})"
