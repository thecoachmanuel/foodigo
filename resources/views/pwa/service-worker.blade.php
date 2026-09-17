const CACHE_NAME = 'nectar-cache-v3';

// Install event - activate immediately
self.addEventListener('install', function(event) {
    self.skipWaiting();
});

// Activate event - clean old caches and claim clients
self.addEventListener('activate', function(event) {
    event.waitUntil(
        caches.keys().then(function(cacheNames) {
            return Promise.all(
                cacheNames.map(function(cacheName) {
                    if (cacheName !== CACHE_NAME) {
                        return caches.delete(cacheName);
                    }
                })
            );
        }).then(function() {
            return self.clients.claim();
        })
    );
});

// Fetch event - safely handle requests without breaking Safari
self.addEventListener('fetch', function(event) {
    // 1. Only intercept GET requests. Non-GET requests (POST, PUT, DELETE) must pass through to network natively.
    if (event.request.method !== 'GET') {
        return;
    }

    const url = new URL(event.request.url);

    // 2. Only handle same-origin http/https requests
    if (url.origin !== self.location.origin) {
        return;
    }

    // 3. Do not intercept admin, backend panels, api, payment, checkout, or auth routes
    if (
        url.pathname.startsWith('/admin') ||
        url.pathname.startsWith('/restaurant') ||
        url.pathname.startsWith('/deliveryman') ||
        url.pathname.startsWith('/api') ||
        url.pathname.startsWith('/payment') ||
        url.pathname.startsWith('/checkout') ||
        url.pathname.startsWith('/login') ||
        url.pathname.startsWith('/register') ||
        url.pathname.startsWith('/logout') ||
        url.pathname.startsWith('/sanctum')
    ) {
        return;
    }

    // 4. For page navigations: Network First with graceful cache fallback (never reject Promise in Safari)
    if (event.request.mode === 'navigate') {
        event.respondWith(
            fetch(event.request)
                .catch(function() {
                    return caches.match(event.request).then(function(cached) {
                        return cached || caches.match('/') || new Response(
                            '<!DOCTYPE html><html><head><title>Offline</title></head><body><p>You are currently offline. Please check your internet connection.</p></body></html>',
                            { headers: { 'Content-Type': 'text/html' } }
                        );
                    });
                })
        );
        return;
    }

    // 5. For static assets (css, js, images, fonts): Cache First with background revalidation
    if (url.pathname.match(/\.(css|js|png|jpg|jpeg|svg|webp|gif|woff|woff2|ttf|eot|ico)$/i)) {
        event.respondWith(
            caches.match(event.request).then(function(cachedResponse) {
                if (cachedResponse) {
                    // Return cached asset immediately, revalidate in background
                    fetch(event.request).then(function(networkResponse) {
                        if (networkResponse && networkResponse.status === 200 && networkResponse.type === 'basic') {
                            caches.open(CACHE_NAME).then(function(cache) {
                                cache.put(event.request, networkResponse);
                            });
                        }
                    }).catch(function() {
                        // Network failure is fine since cached version was returned
                    });
                    return cachedResponse;
                }

                return fetch(event.request).then(function(networkResponse) {
                    if (networkResponse && networkResponse.status === 200 && networkResponse.type === 'basic') {
                        const clone = networkResponse.clone();
                        caches.open(CACHE_NAME).then(function(cache) {
                            cache.put(event.request, clone);
                        });
                    }
                    return networkResponse;
                }).catch(function() {
                    return new Response('', { status: 408, statusText: 'Network Timeout' });
                });
            })
        );
        return;
    }

    // Default: let browser handle natively
});

// Message event
self.addEventListener('message', function(event) {
    if (event.data && event.data.action === 'skipWaiting') {
        self.skipWaiting();
    }
});
