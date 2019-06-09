# README #

This repository contains my personal PHP environment to build PHP applications locally.

### What is this repository for? 

* Faster composer package install thanks to Symfony Flex
* Setup new PHP applications thanks to Symfony installer

### How do I get set up? ###

You can pull the image from Docker Hub

    docker pull tsantos84/php
    
and run the container from the project directory.

    docker run -it --rm -v ${PWD}:/app tsantos84/php composer install

### Building the image

Instead of pulling the image from Docker Hub, you can build the image locally:

    git@github.com:tsantos84/docker.git
    docker build -t php74 .

and run the container from the project directory.

    docker run -it --rm -v ${PWD}:/app php74 symfony new my-app

### What have inside the images ###

* PHP 7:latest
* Git
* Composer with Symfony Flex
* PHPUnit
* PHP CS Fixer
* Symfony installer

### Trick

Create an alias to run commands of this images

    echo "alias composer='docker run --rm -it -v ${PWD}:/app tsantos84/php composer $1'" >> ~/.bash_profile

from now you can use the image as an executable:

    composer install
