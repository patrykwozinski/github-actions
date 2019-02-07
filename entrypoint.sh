#!/bin/sh -l

sh -c "rm vendor && php composer.phar global require hirak/prestissimo && php composer.phar install -n --prefer-dist --no-scripts -o && /usr/local/bin/phpstan analyse $*"
