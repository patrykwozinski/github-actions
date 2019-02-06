FROM php:7.3-alpine

LABEL "com.github.actions.name"="PHPStan GitHub Actions"
LABEL "com.github.actions.description"="static analyse by phpstan"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/patrykwozinski/phpstan-githubactions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Patryk Woziński <patryk.wozinski@gmail.com>"

RUN wget https://github.com/phpstan/phpstan/releases/download/0.11.1/phpstan.phar -O phpstan \
    && chmod a+x phpstan \
    && mv phpstan /usr/local/bin/phpstan

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
