FROM php:8.2-apache


LABEL maintainer="J.Esparza <juanprogramm@outlook.com>" \
    org.opencontainers.image.title="Simple DAMP" \
    org.opencontainers.image.description="This Docker container sets up a development environment using Apache, MySQL, and PHP." \
    org.opencontainers.image.version="1.0" \
    org.opencontainers.image.authors="J.Esparza <juanprogramm@outlook.com>" \
    org.opencontainers.image.url="https://hub.docker.com/r/juanprogramm/simple-damp" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/juanprogramm/simple-damp" \
    org.opencontainers.image.vendor="J.Esparza" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/Jesparzarom/simple-damp" \
    com.example.stack="Docker, Linux, PHP, Apache, MySQL"

# Actualizar lista de paquetes
RUN apt-get update && apt-get upgrade -y

# Instalar extensiones PHP esenciales
RUN docker-php-ext-install pdo pdo_mysql mysqli && a2enmod rewrite headers

# Instalar Composer (en una sola capa)
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && rm -f composer-setup.php

# Configurar directorio de trabajo
WORKDIR /var/www/html

# Si tienes un archivo php.ini personalizado, puedes copiarlo
# COPY ./conf/php.ini /usr/local/etc/php/

# Exponer el puerto 80
# EXPOSE 80