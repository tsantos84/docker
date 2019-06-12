# README #

This repository contains my personal PHP environment to build PHP applications locally.

### What is this repository for? 

* Faster composer package install thanks to Symfony Flex
* Setup new PHP applications thanks to Symfony installer

### How do I get set up? ###

The easiest way to install the image is through the following command:

    curl -sSL https://github.com/tsantos84/docker/releases/download/v1.0/installer | bash 

It will pull the image and create the command aliases in your `~/.bash_profile` automatically. Alternatively 
you can pull the image by your self:

    docker pull tsantos84/php
    
and run the container from the project directory.

    docker run -it --rm -v ${PWD}:/app tsantos84/php composer install

### Building the image

Instead of pulling the image from Docker Hub, you can build the image locally:

    git clone https://github.com/tsantos84/docker.git && cd docker
    docker build -t php73 .

and run the container from the project directory.

    docker run -it --rm -v ${PWD}:/app php73 symfony new my-app

### What have inside the images ###

* [PHP 7.3](https://php.net)
* [Git](https://git-scm.com/)
* [Composer](https://getcomposer.org) with [Symfony Flex](https://symfony.com/doc/current/setup/flex.html)
* [PHPUnit](https://phpunit.de/)
* [PHP CS Fixer](https://cs.symfony.com/)
* [Symfony installer](https://symfony.com/download)

### Trick

Create an alias to run commands of this images

    echo "alias composer='docker run --rm -it -v ${PWD}:/app tsantos84/php composer $1'" >> ~/.bash_profile

from now you can use the image as an executable:

    composer install

If you install the image through the installer, it will automatically add the alias for you.
