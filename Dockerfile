FROM php:7-fpm
MAINTAINER David Spreekmeester <david@spreekmeester.nl>

RUN apt-get update && apt-get install -y \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \

    && docker-php-ext-install mysqli
