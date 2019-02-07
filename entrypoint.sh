#!/bin/sh -l

sh -c "composer install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $*"
