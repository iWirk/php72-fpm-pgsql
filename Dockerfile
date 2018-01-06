FROM php:7.2-fpm-alpine
# Install modules
RUN apk update && \
    apk add autoconf imagemagick-dev build-base gcc libtool postgresql-dev icu-dev && \
    pecl install imagick && \
    echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install \
        opcache \
        pdo \
        pdo_pgsql \
        pgsql \
        sockets \
        intl && \
    apk del postgresql-dev
CMD ["php-fpm"]
