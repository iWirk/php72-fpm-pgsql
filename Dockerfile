FROM php:7.2-fpm-alpine
# Install modules
RUN apk update && \
    buildDeps="libpq-dev libzip-dev libicu-dev libpng12-dev libjpeg62-turbo-dev libfreetype6-dev libmagickwand-6.q16-dev" && \
    apk add $buildDeps && \
    ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin && \
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
