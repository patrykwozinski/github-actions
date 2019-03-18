#!/bin/sh -l

FILES=$(cat .ga-changed-files.txt)

composer install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $* ${FILES}
