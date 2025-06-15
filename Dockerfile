# Usa a imagem oficial PHP 8.3 FPM (sem Apache)
FROM php:8.3-fpm

# Instala extensões PHP necessárias
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Copia o código da aplicação
COPY . /var/www/html/

# Ajusta permissões
RUN chown -R www-data:www-data /var/www/html
