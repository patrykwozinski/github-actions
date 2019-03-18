#!/bin/sh -l

FILES=$(cat .ga-changed-files.txt)

/usr/local/bin/php-cs-fixer fix $* ${FILES}
