#!/bin/sh -l

sh -c "php composer.phar install && /usr/local/bin/phpstan analyse $*"
