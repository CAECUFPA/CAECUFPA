FROM php:8.3-fpm

# Instala extensões PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Instala o nginx e outras dependências
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copia o código da aplicação
COPY . /var/www/html/

# Ajusta permissões
RUN chown -R www-data:www-data /var/www/html

# Copia a configuração do nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia o script de start
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expõe a porta que o Render vai usar
EXPOSE 10000

# Comando de inicialização
CMD ["/start.sh"]
