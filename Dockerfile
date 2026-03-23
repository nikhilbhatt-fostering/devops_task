FROM php:8.3-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip libpq-dev libzip-dev zip libxml2-dev \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_pgsql zip xml dom gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Permissions
RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm"]
