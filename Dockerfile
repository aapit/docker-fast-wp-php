FROM php:7.3-fpm-alpine
MAINTAINER David Spreekmeester <david@spreekmeester.nl>
WORKDIR /var/www

RUN \
        #apk update && apk add --no-cache \
        #libjpeg62-turbo-dev \
        #libpng12-dev \
        #&& docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
        #&& docker-php-ext-install -j$(nproc) gd \
        #&& docker-php-ext-install \
    docker-php-ext-install \
       mysqli \
       opcache

#RUN usermod -u 1000 www-data
