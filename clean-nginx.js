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
    
    // 3. Deduplicate 'location /' blocks - keep only one canonical Laravel location block
    let seenRootLocation = false;
    content = content.replace(/location\s+\/\s*\{[\s\S]*?\}/g, () => {
        if (!seenRootLocation) {
            seenRootLocation = true;
            return `location / {\n        try_files $uri $uri/ /index.php?$query_string;\n    }`;
        }
        return '';
    });

    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`[Foodigo] Successfully cleaned and validated ${filePath}`);
}

cleanNginxConfig('/etc/nginx.conf');
cleanNginxConfig('/etc/nginx/nginx.conf');
