FROM php:7.2-fpm-alpine
# Install modules
RUN apk update && \
    apk add autoconf imagemagick-dev build-base gcc libtool postgresql && \
    pecl install imagick && \
    echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini && \
    docker-php-ext-install \
        opcache \
        pdo \
        pdo_pgsql \
        pgsql \
        sockets \
        intl && \
    apk del postgresql
CMD ["php-fpm"]
