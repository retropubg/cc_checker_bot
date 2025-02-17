# Usar PHP 8.1 con CLI
FROM php:8.1-cli

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql

# Copiar archivos del proyecto al contenedor
COPY . /app

# Instalar Composer y dependencias
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php composer.phar install --no-dev --optimize-autoloader && \
    rm composer-setup.php composer.phar

# Comando para ejecutar el bot
CMD ["php", "bot.php"]
