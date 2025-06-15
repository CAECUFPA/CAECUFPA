FROM php:8.3-fpm

# Instala o nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copia o código da aplicação
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html

# Copia as configurações
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copia o script de inicialização
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 10000

CMD ["/start.sh"]
