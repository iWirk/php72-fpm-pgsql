FROM php:7.2-fpm-alpine
# Install modules
RUN apk update && \
    apk add autoconf imagemagick-dev build-base gcc  && \
    ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-7/bin-Q16/MagickWand-config /usr/bin && \
    pecl install imagick && \
    echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini && \
    docker-php-ext-install \
        opcache \
        pdo \
        pdo_pgsql \
        pgsql \
        sockets \
        intl
CMD ["php-fpm"]
