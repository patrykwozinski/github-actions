FROM php:7.1-alpine

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1

LABEL "com.github.actions.name"="PHPStan GitHub Actions"
LABEL "com.github.actions.description"="static analyse by phpstan"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/patrykwozinski/phpstan-githubactions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Patryk Woziński <patryk.wozinski@gmail.com>"

RUN apk --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community add \
	bash \
	git \
	php7-imagick \
	php7-redis \
	php7-soap \
	php7-zip \
	php7-gd \
	php7-mongodb \
	php7-intl \
	php7-bcmath \
	php-pear \
	php7 \
	php7-dev \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-fileinfo \
	php7-ftp \
	php7-iconv \
	php7-json \
	php7-mbstring \
	php7-mysqlnd \
	php7-openssl \
	php7-pdo \
	php7-pdo_sqlite \
	php7-phar \
	php7-posix \
	php7-session \
	php7-simplexml \
	php7-sqlite3 \
	php7-tokenizer \
	php7-xml \
	php7-xmlreader \
	php7-xmlwriter \
	php7-zlib \
	&& echo "memory_limit=-1" > /etc/php7/conf.d/99_memory-limit.ini \
	&& rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

COPY --from=composer:1.8.0 /usr/bin/composer /usr/local/bin/composer

RUN composer global require hirak/prestissimo \
	&& composer global require phpstan/phpstan ^0.11

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
