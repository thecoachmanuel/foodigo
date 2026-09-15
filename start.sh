#!/bin/bash
set -e

echo "==> [Foodigo] Starting Railway runtime initialization..."

# 1. Setup Persistent Storage for Uploads
echo "==> [Foodigo] Checking persistent uploads volume..."
mkdir -p /app/storage/uploads

# If volume is freshly mounted and empty, seed it with default images from the container build
if [ ! -d "/app/storage/uploads/website-images" ] && [ -d "/app/public/uploads" ]; then
    echo "==> [Foodigo] Populating persistent volume with initial demo and branding assets..."
    cp -rn /app/public/uploads/* /app/storage/uploads/ 2>/dev/null || true
fi

# Link public/uploads to the persistent volume
rm -rf /app/public/uploads
ln -s /app/storage/uploads /app/public/uploads

# 2. Ensure Required Storage Directories & Permissions
echo "==> [Foodigo] Configuring storage directories and permissions..."
mkdir -p storage/framework/sessions
mkdir -p storage/framework/views
mkdir -p storage/framework/cache
mkdir -p storage/logs
mkdir -p bootstrap/cache

chmod -R 775 storage bootstrap/cache 2>/dev/null || true

# 3. Laravel Initialization
echo "==> [Foodigo] Setting up Laravel..."
php artisan storage:link --force 2>/dev/null || true
php artisan optimize:clear

# 4. Start PHP-FPM and Nginx Web Server
echo "==> [Foodigo] Launching Nginx and PHP-FPM on port ${PORT:-8080}..."

# Process Nixpacks' native Nginx template
if [ -f "/assets/scripts/prestart.mjs" ] && [ -f "/assets/nginx.template.conf" ]; then
    node /assets/scripts/prestart.mjs /assets/nginx.template.conf /etc/nginx.conf 2>/dev/null || true
fi

# Ensure high upload limit (50M) in /etc/nginx.conf
if [ -f "/etc/nginx.conf" ]; then
    sed -i 's/client_max_body_size [^;]*;/client_max_body_size 50M;/g' /etc/nginx.conf 2>/dev/null || true
    if ! grep -q "client_max_body_size" /etc/nginx.conf; then
        sed -i '/http {/a \    client_max_body_size 50M;' /etc/nginx.conf 2>/dev/null || true
    fi
fi

# Start PHP-FPM in background
if [ -f "/assets/php-fpm.conf" ]; then
    php-fpm -y /assets/php-fpm.conf -c /assets/php.ini -D
else
    php-fpm -D
fi

# Start Nginx in foreground (Nixpacks template already includes 'daemon off;')
if [ -f "/etc/nginx.conf" ]; then
    exec nginx -c /etc/nginx.conf
elif [ -f "/etc/nginx/nginx.conf" ]; then
    exec nginx -c /etc/nginx/nginx.conf
else
    exec nginx
fi
