FROM php:7-fpm

MAINTAINER Tales Santos <tales.augusto.santos@gmail.com>

# Packages
RUN apt-get update && apt-get upgrade -y \
    libicu-dev \
    libmcrypt-dev \
    acl \
    vim \
    libpng-dev \
    git \
    wget \
    php5-mysql

# PHP Extensions
RUN docker-php-ext-install \
    pdo_mysql \
    intl \
    mbstring \
    mcrypt \
    gd \
    zip

# Install Redis for PHP 7
RUN git clone -b php7 https://github.com/phpredis/phpredis.git \
    && mv phpredis/ /etc/ \
    && cd /etc/phpredis \
    && phpize \
    && ./configure \
    && make && make install \
    && echo "extension=/etc/phpredis/modules/redis.so" >> /usr/local/etc/php/conf.d/redis.ini

# Install composer
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/bin/composer

# Date Timezone
#COPY php.ini /usr/local/etc/php/conf.d/php.ini
