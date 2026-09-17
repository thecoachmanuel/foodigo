#!/bin/bash
set -e

echo "==> [Foodigo] Starting fast Railway runtime initialization..."

# 1. Setup Persistent Storage for Uploads (Fast One-Time Seed)
mkdir -p /app/storage/uploads

if [ -d "/app/public/uploads" ] && [ ! -L "/app/public/uploads" ]; then
    if [ ! -f "/app/storage/uploads/.seeded" ]; then
        echo "==> [Foodigo] Initializing persistent uploads volume..."
        cp -rn /app/public/uploads/. /app/storage/uploads/ 2>/dev/null || true
        touch /app/storage/uploads/.seeded
    fi
    rm -rf /app/public/uploads
fi

if [ ! -L "/app/public/uploads" ]; then
    rm -rf /app/public/uploads
    ln -s /app/storage/uploads /app/public/uploads
fi

# 2. Ensure Required Framework Storage & Fast Permissions
mkdir -p storage/framework/sessions storage/framework/views storage/framework/cache/data storage/logs bootstrap/cache
rm -f bootstrap/cache/*.php 2>/dev/null || true
chmod -R 777 storage/framework storage/logs bootstrap/cache 2>/dev/null || true

# 3. Fast Laravel Initialization (Migrations run during preDeployCommand)
php artisan storage:link --force 2>/dev/null || true
php artisan optimize:clear 2>/dev/null || true

# 4. Start PHP-FPM Early in Background
echo "==> [Foodigo] Starting PHP-FPM..."
if [ -f "/assets/php-fpm.conf" ]; then
    php-fpm -y /assets/php-fpm.conf -c /assets/php.ini -D
else
    php-fpm -D
fi

# 5. Prepare Nginx Web Server Configuration
echo "==> [Foodigo] Preparing Nginx configuration..."
export NIXPACKS_PHP_ROOT_DIR="/app/public"
export PORT="${PORT:-8080}"

if [ -f "/app/nginx.template.conf" ]; then
    cp /app/nginx.template.conf /assets/nginx.template.conf 2>/dev/null || true
fi

if [ -f "/assets/scripts/prestart.mjs" ] && [ -f "/assets/nginx.template.conf" ]; then
    node /assets/scripts/prestart.mjs /assets/nginx.template.conf /etc/nginx.conf 2>/dev/null || true
fi

if [ -f "/app/clean-nginx.js" ]; then
    node /app/clean-nginx.js || true
elif [ -f "./clean-nginx.js" ]; then
    node ./clean-nginx.js || true
fi

# Emergency safety net: ensure no empty or unexpanded root directives remain
for cfg in "/etc/nginx.conf" "/etc/nginx/nginx.conf" "/assets/nginx.template.conf"; do
    if [ -f "$cfg" ]; then
        sed -i -E 's|^[[:space:]]*root[[:space:]]*;[[:space:]]*$|        root /app/public;|g' "$cfg" 2>/dev/null || true
        sed -i 's|\${NIXPACKS_PHP_ROOT_DIR}|/app/public|g' "$cfg" 2>/dev/null || true
        sed -i 's|\$NIXPACKS_PHP_ROOT_DIR|/app/public|g' "$cfg" 2>/dev/null || true
    fi
done

# 6. Launch Nginx Web Server
echo "==> [Foodigo] Launching Nginx on port ${PORT:-8080}..."
if [ -f "/etc/nginx.conf" ]; then
    exec nginx -c /etc/nginx.conf -g 'daemon off;'
elif [ -f "/etc/nginx/nginx.conf" ]; then
    exec nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
else
    exec nginx -g 'daemon off;'
fi
