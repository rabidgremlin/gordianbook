FROM php:7.3-apache

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update || exit

RUN apt-get install -y git unzip || exit 1

RUN apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd   \
	&& docker-php-ext-install -j$(nproc) gd || exit 1

COPY ./ /var/www/html/

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN cd /var/www/html/ && composer install || exit 1

RUN a2enmod rewrite || exit 1

RUN mkdir /var/www/html/vendor/mpdf/mpdf/src/Config/../../tmp/mpdf && chmod a+w /var/www/html/vendor/mpdf/mpdf/src/Config/../../tmp/mpdf || exit 1
