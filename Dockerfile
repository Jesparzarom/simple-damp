ARG release=8.2
ARG type=apache
ARG localdir=/www/
ARG workdir=/var/www/html

FROM php:${release}-${type} AS server-builder
WORKDIR $workdir

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data

##### START METADATA #####
LABEL org.opencontainers.image.maintainer="J.Esparza <juanprogramm@outlook.com>" \
    org.opencontainers.image.title="Simple DAMP" \
    org.opencontainers.image.description="This Docker container sets up a development environment using Apache, MySQL, and PHP." \
    org.opencontainers.image.version="1.1" \
    org.opencontainers.image.authors="J.Esparza <juanprogramm@outlook.com>" \
    org.opencontainers.image.url="https://hub.docker.com/r/juanprogramm/simple-damp" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/juanprogramm/simple-damp" \
    org.opencontainers.image.vendor="J.Esparza" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/Jesparzarom/simple-damp" \
    org.opencontainers.image.stack="Docker, Linux, PHP, Apache, MySQL"

##### END METADATA #####

#####  START DOCKER SETTINGS  #####

# Update, upgrade the system
RUN apt-get update && apt-get upgrade -y    \
    #Install additional packages
    && apt-get install -y   \
        unzip   \
        libonig-dev \
        libxml2-dev \
        libzip-dev  \
        libicu-dev  \
        libgd-dev   \
        libpng-dev \
        curl \
        git \
        zip \
    && rm -rf /var/lib/apt/lists/*  \
    # Install necessary development libraries and tools
    && docker-php-ext-install   \
        mysqli  \
        pdo_mysql   \
        mbstring    \
        xml \
        zip \
        intl    \
        gd  \
        exif    \
        pcntl   \
        bcmath  \
        soap    \
        opcache \
    # remove the cache
    # Install Composer
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    # Enable Apache modules
    && a2enmod rewrite expires headers

# Copy Apache configuration
COPY $localdir $workdir
COPY ./conf/apache2/conf-available/servername.conf /etc/apache2/conf-available/servername.conf
COPY ./conf/apache2/conf-available/tuning.conf /etc/apache2/conf-available/tuning.conf
COPY ./conf/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

RUN  a2enconf servername tuning    \
    && chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \; \
    && service apache2 restart

# Expose only HTTP by default
EXPOSE 80

CMD ["apache2-foreground"]

##### END DOCKER SETTINGS #####