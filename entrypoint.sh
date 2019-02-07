#!/bin/sh -l

sh -c "php composer.phar global require hirak/prestissimo && php composer.phar install -n --prefer-dist --no-scripts -o && /composer/vendor/bin/phpstan analyse $*"
