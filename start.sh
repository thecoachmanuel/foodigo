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

# Process Nginx template if Nixpacks prestart script is available
if [ -f "/assets/scripts/prestart.mjs" ]; then
    if [ -f "/app/nginx.template.conf" ]; then
        node /assets/scripts/prestart.mjs /app/nginx.template.conf /etc/nginx.conf 2>/dev/null || true
    elif [ -f "/assets/nginx.template.conf" ]; then
        node /assets/scripts/prestart.mjs /assets/nginx.template.conf /etc/nginx.conf 2>/dev/null || true
    fi
fi

# Strip any existing daemon directive to prevent duplicate directive errors
if [ -f "/etc/nginx.conf" ]; then
    sed -i '/daemon off;/d' /etc/nginx.conf 2>/dev/null || true
fi
if [ -f "/etc/nginx/nginx.conf" ]; then
    sed -i '/daemon off;/d' /etc/nginx/nginx.conf 2>/dev/null || true
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
