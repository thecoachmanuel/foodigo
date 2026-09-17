<!-- PWA Meta Tags -->
@php
    $settings = Modules\GlobalSetting\App\Models\GlobalSetting::get()->keyBy('key');
    $logoPath = $settings->get('logo')->value ?? null;
    $faviconPath = $settings->get('favicon')->value ?? null;
    $isSvg = $logoPath && pathinfo($logoPath, PATHINFO_EXTENSION) === 'svg';
@endphp
<link rel="manifest" href="{{ url('/manifest.json') }}">
<meta name="theme-color" content="#ff6b35">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="{{ $settings->get('app_name')->value ?? 'Nectar' }}">
<meta name="application-name" content="{{ $settings->get('app_name')->value ?? 'Nectar' }}">
<meta name="msapplication-TileColor" content="#ff6b35">
<meta name="msapplication-config" content="/browserconfig.xml">

<!-- Apple Touch Icons -->
<link rel="apple-touch-icon" href="{{ asset($faviconPath ?? '/images/icons/icon-152x152.png') }}">
<link rel="apple-touch-icon" sizes="152x152" href="{{ asset($faviconPath ?? '/images/icons/icon-152x152.png') }}">
<link rel="apple-touch-icon" sizes="180x180" href="{{ asset($faviconPath ?? '/images/icons/icon-192x192.png') }}">
<link rel="apple-touch-icon" sizes="167x167" href="{{ asset($faviconPath ?? '/images/icons/icon-152x152.png') }}">

<!-- PWA Icons -->
<link rel="icon" type="image/png" sizes="32x32" href="{{ asset($faviconPath ?? '/images/icons/icon-72x72.png') }}">
<link rel="icon" type="image/png" sizes="16x16" href="{{ asset($faviconPath ?? '/images/icons/icon-72x72.png') }}">

<!-- Service Worker Registration -->
<script>
if ('serviceWorker' in navigator) {
    console.log('Service Worker: Supported');
    window.addEventListener('load', function() {
        console.log('Service Worker: Registering...');
        navigator.serviceWorker.register('/service-worker.js', { updateViaCache: 'none' })
            .then(function(registration) {
                // Ensure immediate update check
                if (typeof registration.update === 'function') {
                    registration.update();
                }
            })
            .catch(function(err) {
                console.warn('ServiceWorker registration notice: ', err?.message || err);
            });
    });
} else {
    console.log('Service Worker: Not supported');
}
</script>
