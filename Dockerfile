# Imagem oficial PHP‑FPM 8.4 (Alpine)
FROM php:8.4-fpm-alpine

# Instala Nginx e Supervisor
RUN apk add --no-cache nginx supervisor

# Copia configurações
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define diretório da aplicação
WORKDIR /app
COPY . /app

# Ajusta permissões para PHP-FPM (www-data)
RUN chown -R www-data:www-data /app \
    && find /app -type d -exec chmod 755 {} \; \
    && find /app -type f -exec chmod 644 {} \;

# Porta usada pelo Render (HTTP)
ENV PORT 80
EXPOSE 80

# Inicia Supervisor (que aciona PHP-FPM e Nginx)
CMD ["supervisord", "-n"]