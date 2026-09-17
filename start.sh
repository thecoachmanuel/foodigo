#!/bin/bash
set -e

echo "==> [Foodigo] Starting Railway runtime initialization..."

# 1. Setup Persistent Storage for Uploads
echo "==> [Foodigo] Synchronizing persistent uploads volume..."
mkdir -p /app/storage/uploads

# Populate persistent storage with all demo media, products, and branding assets from container build
if [ -d "/app/public/uploads" ] && [ ! -L "/app/public/uploads" ]; then
    echo "==> [Foodigo] Copying all packaged product photos, custom-images, and website assets to storage..."
    cp -rn /app/public/uploads/. /app/storage/uploads/ 2>/dev/null || true
    rm -rf /app/public/uploads
fi

# Ensure public/uploads is linked to persistent volume
if [ ! -L "/app/public/uploads" ]; then
    rm -rf /app/public/uploads
    ln -s /app/storage/uploads /app/public/uploads
fi

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

# Re-apply permissions
chmod -R 777 public storage bootstrap/cache /app/public /app/storage /app/bootstrap/cache 2>/dev/null || true

# 4. Prepare Nginx configuration
echo "==> [Foodigo] Configuring Nginx web server..."

export NIXPACKS_PHP_ROOT_DIR="/app/public"
export PORT="${PORT:-8080}"

# Copy custom template if available
if [ -f "/app/nginx.template.conf" ]; then
    cp /app/nginx.template.conf /assets/nginx.template.conf 2>/dev/null || true
fi

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

# Emergency safety net: ensure no empty or unexpanded root directives remain in any nginx config
for cfg in "/etc/nginx.conf" "/etc/nginx/nginx.conf" "/assets/nginx.template.conf"; do
    if [ -f "$cfg" ]; then
        sed -i 's|root\s*;|root /app/public;|g' "$cfg" 2>/dev/null || true
        sed -i 's|\${NIXPACKS_PHP_ROOT_DIR}|/app/public|g' "$cfg" 2>/dev/null || true
        sed -i 's|\$NIXPACKS_PHP_ROOT_DIR|/app/public|g' "$cfg" 2>/dev/null || true
    fi
done

# 5. Start PHP-FPM and Nginx Web Server
echo "==> [Foodigo] Launching PHP-FPM and Nginx on port ${PORT:-8080}..."

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
