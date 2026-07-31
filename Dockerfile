FROM php:7.4-apache

# Librerías del sistema necesarias para compilar la extensión curl
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Extensiones necesarias: pdo_mysql (BD) y curl (PayPal API)
RUN docker-php-ext-install pdo_mysql curl

# Asegurar que solo un módulo MPM esté activo (el apt-get anterior puede activar mpm_event)
RUN a2dismod mpm_event mpm_worker 2>/dev/null; a2enmod mpm_prefork

# Habilitar mod_rewrite (por si usan USE_URLREWRITE=1)
RUN a2enmod rewrite

# Permitir que .htaccess sobreescriba reglas
RUN sed -ri -e 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copiar composer.json primero (cache de capas)
COPY composer.json ./
RUN composer install --no-dev --optimize-autoloader

# Copiar el resto del proyecto
COPY . .

# Railway asigna el puerto por variable de entorno $PORT
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
EXPOSE 80

CMD ["apache2-foreground"]