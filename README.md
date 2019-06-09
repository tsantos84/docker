# README #

This repository contains my personal PHP environment to build PHP applications locally.

### What is this repository for? 

* Setup local environment for PHP applications

### How do I get set up? ###

Build the image:

    docker build -t php .

and then run one of the built int command

    docker run -v $PWD:/app php symfony new my-app

### What have inside the images ###

* PHP 7:latest
* Git
* Composer with Symfony Flex
* PHPUnit
* PHP CS Fixer

### Trick

Create an alias to run commands of this images

    echo "alias php='docker run --rm -it -v ${PWD}:/app php $1'" >> ~/.bash_profile

from now you can use the image as an executable:

    php symfony new my-app
