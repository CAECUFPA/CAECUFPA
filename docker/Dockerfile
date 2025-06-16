# Usar a imagem oficial do PHP com FPM
FROM php:8.0-fpm

# Instalar extensões necessárias, por exemplo pdo_mysql
RUN docker-php-ext-install pdo pdo_mysql

# Copiar o código-fonte da raiz para o diretório do container
COPY ../ /var/www/html/

# Ajustar permissões
RUN chown -R www-data:www-data /var/www/html

# Expor a porta 9000 para o PHP-FPM
EXPOSE 9000
