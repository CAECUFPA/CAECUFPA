FROM php:8.2-apache

# Copia arquivos para diretório padrão do apache
COPY . /var/www/html/

# Habilita mod_rewrite (se usar .htaccess)
RUN a2enmod rewrite

# Expõe a porta 80
EXPOSE 80
