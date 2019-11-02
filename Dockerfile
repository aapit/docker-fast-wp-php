FROM php:7.3-fpm-alpine
MAINTAINER David Spreekmeester <david@spreekmeester.nl>
WORKDIR /var/www


RUN \
        apk update \
        && apk add --no-cache \
            freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
            imap-dev \
            openssl-dev \
            php7-mysqli \
            php7-opcache \
            php7-gd \
            php7-zlib \
            php7-curl \
            php7-phar \
            php7-json \
            php7-mbstring \
        && docker-php-ext-configure \
            gd \
                --with-gd \
                --with-freetype-dir=/usr/include/ \
                --with-png-dir=/usr/include/ \
                --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-configure \
            imap \
                --with-imap \
                --with-imap-ssl \
        && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
        && docker-php-ext-install -j${NPROC} \
            gd \
            mysqli \
            opcache \
            imap \
        && apk del --no-cache \
            freetype-dev libpng-dev libjpeg-turbo-dev

USER www-data
