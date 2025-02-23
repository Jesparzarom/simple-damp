FROM php:8.2-apache

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