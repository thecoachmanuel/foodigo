const fs = require('fs');

function cleanNginxConfig(filePath) {
    if (!fs.existsSync(filePath)) {
        console.log(`[Foodigo] Config file does not exist at ${filePath}, skipping.`);
        return;
    }
    
    let content = fs.readFileSync(filePath, 'utf8');
    
    // 1. Remove duplicate/inline 'daemon' directive (since CLI or start.sh supplies daemon off;)
    content = content.replace(/^\s*daemon\s+[^;]+;\s*$/gm, '');
    
    // 2. Ensure client_max_body_size 100M exists in http block
    if (content.includes('client_max_body_size')) {
        content = content.replace(/client_max_body_size\s+[^;]+;/g, 'client_max_body_size 100M;');
    } else if (content.includes('http {')) {
        content = content.replace(/http\s*\{/, 'http {\n    client_max_body_size 100M;');
    }

    // 3. Enforce root /app/public; as the canonical document root
    if (content.includes('root /app;')) {
        content = content.replace(/root\s+\/app;/g, 'root /app/public;');
    } else if (/root\s+[^;]+;/.test(content)) {
        content = content.replace(/root\s+[^;]+;/g, 'root /app/public;');
    } else if (content.includes('server {')) {
        content = content.replace(/server\s*\{/, 'server {\n    root /app/public;\n    index index.php index.html;');
    }

    // 4. Ensure location / forwards everything through index.php
    if (content.includes('location / {') || content.includes('location / {')) {
        content = content.replace(/location\s+\/\s*\{[\s\S]*?\}/g, (match) => {
            return `location / {\n        try_files $uri $uri/ /index.php?$query_string;\n    }`;
        });
    }

    // 5. Ensure FastCGI parameters include Forwarded headers for HTTPS
    if (!content.includes('HTTP_X_FORWARDED_PROTO') && content.includes('fastcgi_param')) {
        content = content.replace(/(fastcgi_param\s+SCRIPT_FILENAME)/, 'fastcgi_param HTTP_X_FORWARDED_PROTO $http_x_forwarded_proto;\n        fastcgi_param HTTPS $http_x_forwarded_proto;\n        $1');
    }

    // 6. Ensure index.php index.html is in server block
    if (!content.includes('index index.php')) {
        content = content.replace(/server\s*\{/, 'server {\n    index index.php index.html;');
    }

    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`[Foodigo] Successfully cleaned and validated ${filePath}`);
}

// Clean all potential nginx config locations
cleanNginxConfig('/assets/nginx.template.conf');
cleanNginxConfig('/etc/nginx.conf');
cleanNginxConfig('/etc/nginx/nginx.conf');
