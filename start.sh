#!/bin/bash

# Inicia o PHP-FPM em background
php-fpm &

# Inicia o nginx (fica rodando em foreground)
nginx -g "daemon off;"
