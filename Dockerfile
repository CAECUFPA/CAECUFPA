FROM php:8.4-fpm-alpine

RUN apk add --no-cache nginx supervisor

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /app
COPY . /app

# Ajusta permissões para www‑data (PHP‑FPM)
RUN chown -R www-data:www-data /app \
    && find /app -type d -exec chmod 755 {} \; \
    && find /app -type f -exec chmod 644 {} \;

ENV PORT 80
EXPOSE 80

CMD ["supervisord", "-n"]
