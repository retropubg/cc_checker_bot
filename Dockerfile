# Usar PHP 8.1 con CLI
FROM php:8.1-cli

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar extensiones necesarias (modifica según lo que necesite tu bot)
RUN docker-php-ext-install pdo pdo_mysql

# Copiar archivos del proyecto al contenedor
COPY . /app

# Instalar Composer y dependencias específicas
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php composer.phar require guzzlehttp/guzzle:^7.4 && \
    php composer.phar install --no-dev --optimize-autoloader && \
    rm composer-setup.php composer.phar

# Comando para ejecutar el bot
CMD ["php", "bot.php"]
