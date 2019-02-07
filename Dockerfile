FROM phpstan/phpstan:0.10

LABEL "com.github.actions.name"="PHPStan GitHub Actions"
LABEL "com.github.actions.description"="static analyse by phpstan"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/patrykwozinski/phpstan-githubactions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Patryk Woziński <patryk.wozinski@gmail.com>"

RUN apk --update add \
	bash \
	git \
	php-pear \
	php7-imagick \
	php7-redis \
	php7-soap \
	php7-zip \
	php7-gd \
	php7-mongodb \
	php7-intl \
	php7-bcmath

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
