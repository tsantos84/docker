# README #

This repository contains my personal PHP environment to build PHP applications locally.

### What is this repository for? 

* Setup local environment

### How do I get set up? ###

Build the image:

``docker build -t php .``

and then run one of the built int command

``docker run -v $PWD:/app symfony new my-app``

### What have inside the images ###

* PHP 7:latest
* Git
* Composer with Symfony Flex
* PHPUnit
* PHP CS Fixer
