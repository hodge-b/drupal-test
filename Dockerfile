FROM drupal:latest

# Install PHP extensions required by Drupal and some useful tools
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libxpm-dev \
    libfreetype6-dev \
    libicu-dev \
    libpq-dev \
    libzip-dev \
    libonig-dev \
    unzip \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm \
    && docker-php-ext-install -j "$(nproc)" \
        gd \
        intl \
        opcache \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        zip \
        bcmath \
        mbstring \
        exif \
        pcntl

# Copy the Drupal files to the web root
COPY . /var/www/html/
