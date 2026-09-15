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
mkdir -p storage/framework/cache/data
mkdir -p storage/logs
mkdir -p storage/uploads
mkdir -p bootstrap/cache

# Clear stale cached files in bootstrap/cache
rm -f bootstrap/cache/*.php 2>/dev/null || true

# Grant full read/write permissions to storage and bootstrap cache
chmod -R 777 storage bootstrap/cache /app/storage /app/bootstrap/cache 2>/dev/null || true
chown -R www-data:www-data storage bootstrap/cache 2>/dev/null || true

# 3. Laravel Initialization
echo "==> [Foodigo] Setting up Laravel..."
php artisan storage:link --force 2>/dev/null || true
php artisan foodigo:init-db --force-if-empty || true
php artisan migrate --force || true
php artisan module:migrate --force || true
php artisan optimize:clear || true
php artisan cache:clear || true
php artisan view:clear || true

# Re-apply 777 permissions after artisan clear
chmod -R 777 storage bootstrap/cache /app/storage /app/bootstrap/cache 2>/dev/null || true

# 4. Start PHP-FPM and Nginx Web Server
echo "==> [Foodigo] Launching Nginx and PHP-FPM on port ${PORT:-8080}..."

# Process Nixpacks' native Nginx template
if [ -f "/assets/scripts/prestart.mjs" ] && [ -f "/assets/nginx.template.conf" ]; then
    node /assets/scripts/prestart.mjs /assets/nginx.template.conf /etc/nginx.conf 2>/dev/null || true
fi

# Clean and sanitize Nginx configuration
if [ -f "/app/clean-nginx.js" ]; then
    node /app/clean-nginx.js || true
elif [ -f "./clean-nginx.js" ]; then
    node ./clean-nginx.js || true
fi

# Start PHP-FPM in background
if [ -f "/assets/php-fpm.conf" ]; then
    php-fpm -y /assets/php-fpm.conf -c /assets/php.ini -D
else
    php-fpm -D
fi

# Start Nginx in foreground
if [ -f "/etc/nginx.conf" ]; then
    exec nginx -c /etc/nginx.conf -g 'daemon off;'
elif [ -f "/etc/nginx/nginx.conf" ]; then
    exec nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
else
    exec nginx -g 'daemon off;'
fi
