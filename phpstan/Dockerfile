FROM php:7.1-alpine

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH

LABEL "com.github.actions.name"="PHPStan GitHub Actions"
LABEL "com.github.actions.description"="static analyse by phpstan"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/patrykwozinski/phpstan-githubactions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Patryk Woziński <patryk.wozinski@gmail.com>"

RUN apk --update --no-cache add \
    jq \
	gcc \
	curl \
	make \
	g++ \
	icu-dev \
	openssl \
	libressl-dev \
	zlib-dev \
	bash \
	git \
	libxml2-dev \
	libpng-dev \
	libmcrypt-dev \
	libzip-dev \
	php-pear \
	imagemagick-dev \
	imagemagick \
	php7 \
	php7-dev \
	&& rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

RUN echo -e "memory_limit=2G" > /usr/local/etc/php/php.ini

RUN docker-php-ext-configure intl
RUN docker-php-ext-install \
	soap \
	iconv \
	gd \
	zip \
	calendar \
	ftp \
	intl \
	bcmath \
	mcrypt
RUN yes '' | pecl \
	install \
	redis \
	mongodb \
	imagick \
	xdebug
RUN docker-php-ext-enable redis mongodb imagick

COPY --from=composer:1.8.0 /usr/bin/composer /usr/local/bin/composer

RUN composer global require hirak/prestissimo \
	&& composer global require phpstan/phpstan ^0.11

WORKDIR /github/workspace

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
