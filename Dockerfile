# Usa PHP 7.4 con Apache
FROM php:7.4-cli

# Instala extensiones necesarias (modifícalo si necesitas otras)
RUN docker-php-ext-install pdo pdo_mysql

# Copia los archivos del bot al contenedor
WORKDIR /app
COPY . /app

# Instala dependencias de Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php composer.phar install && \
    rm composer-setup.php composer.phar

# Especifica el comando para ejecutar el bot
CMD ["php", "bot.php"]
