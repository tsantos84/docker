FROM php:fpm

RUN apt-get update && apt-get install git libzip-dev zlib1g-dev zip -y \
    && docker-php-ext-install zip \
    && curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

RUN composer global require \
    friendsofphp/php-cs-fixer \
    phpunit/phpunit \
    symfony/flex

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH "$PATH:/root/.composer/vendor/bin:/root/.symfony/bin"

COPY tests.sh /var/tests.sh

WORKDIR /app
