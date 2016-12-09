# README #

This repository contains the must personal PHP environment to build PHP applications

### What is this repository for? 

* Setup development environment
* Setup production environment

### How do I get set up? ###

To run your application using production configuration you need to pull `php` image and run
it.

``docker run -it -v $PWD:/opt --workdir=/opt tsantos84/php``

Alternatively you can use the `php-dev` image to setup your development environment. This image
is useful to run automated tests with `phpunit` or `phpspec`. 

``docker run -it -v $PWD:/opt --workdir=/opt tsantos84/php-dev phpunit``
``docker run -it -v $PWD:/opt --workdir=/opt tsantos84/php-dev phpmd ./src``

### What have inside the images ###

#### Production

* PHP 7+
* Git
* Composer

#### Development

* All configuration from production
* PHPUnit
* PHPSpec
* PHPMD
* PHPCS
* PHPCBF
