#!/bin/sh -l

FILES=$(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})

git branch

composer install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $* ${FILES}
