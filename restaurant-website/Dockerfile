# Créer un Dockerfile pour cette application en mode production
FROM php:8.2-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP_ENV=prod
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk add \
        git \
        unzip

WORKDIR /var/www/html
COPY . .

#COPY composer binary from composer image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader --no-interaction

RUN php bin/console asset-map:compile 

RUN chown -R www-data:www-data /var/www/html/var

EXPOSE 9000

RUN php bin/console cache:clear --env=prod 


