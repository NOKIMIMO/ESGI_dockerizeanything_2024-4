# Créer un Dockerfile pour cette application en mode production
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP_ENV=prod
ENV APP_DEBUG=0

RUN apt update && \
    apt install -y software-properties-common curl git supervisor  && \
    apt clean

RUN add-apt-repository ppa:ondrej/php \
    && apt update \
    && apt install -y php8.3 php8.3-fpm php8.3-intl php8.3-xml php8.3-dom nginx \
    && apt clean

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php

EXPOSE 80
#pas bien
COPY . /var/www/html 
WORKDIR /var/www/html
RUN rm .env
RUN mv .envprod .env

RUN chown -R www-data:www-data /var/www/html/var

RUN composer install --no-dev --optimize-autoloader

COPY .docker/nginx/grilli.com.conf /etc/nginx/sites-enabled/
COPY .docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /run/php/

RUN php bin/console asset-map:compile 

RUN php bin/console cache:clear --env=prod

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
