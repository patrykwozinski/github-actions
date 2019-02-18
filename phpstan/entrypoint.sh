#!/bin/sh -l

composer install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $* $(git diff --name-only --diff-filter=MAd ${BRANCH}...HEAD -- ${FILTERS})
