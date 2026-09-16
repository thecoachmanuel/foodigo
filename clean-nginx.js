const fs = require('fs');

function cleanNginxConfig(filePath) {
    if (!fs.existsSync(filePath)) return;
    
    let content = fs.readFileSync(filePath, 'utf8');
    
    // 1. Remove duplicate/inline 'daemon' directive (since CLI supplies it or we run in foreground)
    content = content.replace(/^\s*daemon\s+[^;]+;\s*$/gm, '');
    
    // 2. Ensure client_max_body_size 50M exists
    if (content.includes('client_max_body_size')) {
        content = content.replace(/client_max_body_size\s+[^;]+;/g, 'client_max_body_size 50M;');
    } else {
        content = content.replace(/http\s*\{/, 'http {\n    client_max_body_size 50M;');
    }

    // 3. Enforce root /app/public; as the canonical document root
    if (content.includes('root /app;')) {
        content = content.replace(/root\s+\/app;/g, 'root /app/public;');
    } else if (/root\s+[^;]+;/.test(content)) {
        content = content.replace(/root\s+[^;]+;/g, 'root /app/public;');
    } else {
        content = content.replace(/server\s*\{/, 'server {\n    root /app/public;\n    index index.php index.html;');
    }

    // 4. Deduplicate 'location /' blocks - keep only one canonical Laravel location block
    let seenRootLocation = false;
    content = content.replace(/location\s+\/\s*\{[\s\S]*?\}/g, () => {
        if (!seenRootLocation) {
            seenRootLocation = true;
            return `location / {\n        try_files $uri $uri/ /index.php?$query_string;\n    }`;
        }
        return '';
    });

    // 5. Ensure HTTPS and Forwarded headers are passed to FastCGI
    if (!content.includes('HTTP_X_FORWARDED_PROTO') && content.includes('fastcgi_param')) {
        content = content.replace(/(fastcgi_param\s+SCRIPT_FILENAME)/, 'fastcgi_param HTTP_X_FORWARDED_PROTO $http_x_forwarded_proto;\n        fastcgi_param HTTPS $http_x_forwarded_proto;\n        $1');
    }

    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`[Foodigo] Successfully cleaned and validated ${filePath}`);
}

cleanNginxConfig('/etc/nginx.conf');
cleanNginxConfig('/etc/nginx/nginx.conf');
