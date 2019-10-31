FROM php:7.3-fpm-alpine
MAINTAINER David Spreekmeester <david@spreekmeester.nl>
WORKDIR /var/www


RUN \
        apk update \
        && apk add --no-cache \
            php7-mysqli \
            php7-opcache \
            php7-gd \
            php7-zlib \
            php7-curl \
            php7-phar \
            php7-json \
            php7-mbstring \
        && docker-php-ext-install \
            mysqli \
            opcache
