FROM php:7.4-fpm

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libmcrypt-dev \
    libzip-dev \
    nodejs \
    npm

RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl opcache
RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg
RUN docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



RUN mkdir /tmp/scripts;
COPY init/init.sh /tmp/scripts
RUN chmod +x -R /tmp/scripts
#RUN /tmp/scripts/init.sh

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www
RUN chown -R www:www /var/www
WORKDIR /var/www
USER www

EXPOSE 80
CMD ["php-fpm"]