# Créer un Dockerfile pour cette application en mode production
FROM php:8.3-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP_ENV=prod
ENV APP_DEBUG=0

RUN apt-get update \
    && apt-get install -y \
        git \
        unzip \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /var/www/html
COPY . /var/www/html
RUN rm .env
COPY .envprod .env

#COPY composer binary from composer image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader --no-interaction

RUN mkdir -p /run/php/

RUN php bin/console asset-map:compile 

RUN chown -R www-data:www-data /var/www/html/var

RUN php bin/console cache:clear --env=prod

EXPOSE 80
CMD ["php-fpm"]