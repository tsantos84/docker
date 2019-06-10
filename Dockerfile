FROM php:fpm-alpine AS php

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

RUN apk update && apk add --no-cache git zip libzip-dev bash \
    && docker-php-ext-install zip \
    && curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony/bin/symfony /usr/local/bin/symfony \
    && rm -f /var/cache/apk/*

RUN composer global require \
    friendsofphp/php-cs-fixer \
    phpunit/phpunit \
    symfony/flex

ENV PATH "$PATH:/root/.composer/vendor/bin:/root/.symfony/bin"

COPY tests.sh /var/tests.sh

WORKDIR /app

FROM php AS dev

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && rm -f /var/cache/apk/*
