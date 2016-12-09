FROM tsantos84/php:latest

MAINTAINER Tales Santos <tales.augusto.santos@gmail.com>

RUN apt-get install -y libbz2-dev

RUN docker-php-ext-install bz2

## Install xdebug
RUN pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# PHP Spec
RUN composer global require phpspec/phpspec:~3.0 \
    && ln -s /root/.composer/vendor/bin/phpspec /usr/bin/phpspec

# PHP Mess Detect
RUN wget -c http://static.phpmd.org/php/latest/phpmd.phar \
    && chmod +x phpmd.phar \
    && mv phpmd.phar /usr/bin/phpmd

# PHP Unit
RUN wget https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/bin/phpunit

# PHP CodeSniffer
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
    && chmod +x phpcs.phar \
    && mv phpcs.phar /usr/bin/phpcs

# PHP Code Code Beautifier and Fixer
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar \
    && chmod +x phpcbf.phar \
    && mv phpcbf.phar /usr/bin/phpcbf
