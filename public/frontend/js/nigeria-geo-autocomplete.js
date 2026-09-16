/**
 * Live OpenStreetMap Leaflet Address Autocomplete & Geocoding Engine for Foodigo
 * 100% Free, Unlimited Multi-User Checkout Support
 * Fully Real-Time OpenStreetMap Nominatim with Instant Coordinate Auto-Resolution
 * High-Contrast Black on White Typography (#000000 on #ffffff)
 */
(function (window, document) {
    'use strict';

    // High-Contrast CSS styles for autocomplete dropdown
    const CSS_STYLES = `
        .nga-geo-wrapper {
            position: relative !important;
            width: 100% !important;
            display: block !important;
        }
        .nga-geo-dropdown {
            position: absolute !important;
            top: calc(100% + 4px) !important;
            left: 0 !important;
            right: 0 !important;
            width: 100% !important;
            min-width: 100% !important;
            z-index: 10000050 !important;
            background: #ffffff !important;
            background-color: #ffffff !important;
            border: 2px solid #000000 !important;
            border-radius: 10px !important;
            box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.35), 0 8px 15px -6px rgba(0, 0, 0, 0.2) !important;
            max-height: 290px !important;
            overflow-y: auto !important;
            padding: 0 !important;
            display: none;
            font-family: inherit !important;
        }
        .nga-geo-item {
            padding: 12px 15px !important;
            cursor: pointer !important;
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            transition: all 0.15s ease !important;
            border-bottom: 1px solid #f1f5f9 !important;
            font-size: 14.5px !important;
            color: #000000 !important;
            -webkit-text-fill-color: #000000 !important;
            text-align: left !important;
            background: #ffffff !important;
            background-color: #ffffff !important;
            min-height: 48px !important;
        }
        .nga-geo-item:hover, .nga-geo-item.active {
            background-color: #f1f5f9 !important;
            border-left: 4px solid #ea580c !important;
            padding-left: 14px !important;
        }
        .nga-geo-item-left {
            display: flex !important;
            align-items: center !important;
            gap: 12px !important;
            flex: 1 !important;
            overflow: hidden !important;
        }
        .nga-geo-icon {
            width: 32px !important;
            height: 32px !important;
            border-radius: 8px !important;
            background: #fef3c7 !important;
            color: #d97706 !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            font-size: 15px !important;
            flex-shrink: 0 !important;
            border: 1px solid #fde68a !important;
        }
        .nga-geo-title {
            font-weight: 700 !important;
            color: #000000 !important;
            -webkit-text-fill-color: #000000 !important;
            font-size: 15px !important;
            line-height: 1.35 !important;
            display: block !important;
            text-shadow: none !important;
        }
        .nga-geo-subtitle {
            font-size: 13.5px !important;
            color: #1e293b !important;
            -webkit-text-fill-color: #1e293b !important;
            font-weight: 600 !important;
            line-height: 1.3 !important;
            margin-top: 2px !important;
            display: block !important;
            text-shadow: none !important;
        }
        .nga-geo-badge {
            font-size: 11px !important;
            font-weight: 700 !important;
            padding: 3px 9px !important;
            border-radius: 9999px !important;
            margin-left: 8px !important;
            flex-shrink: 0 !important;
            text-transform: uppercase !important;
            background: #e2e8f0 !important;
            color: #1e293b !important;
        }
        .nga-geo-badge-lagos {
            background: #dbeafe !important;
            color: #1d4ed8 !important;
        }
        .nga-geo-badge-oyo {
            background: #fef3c7 !important;
            color: #b45309 !important;
        }
        .nga-geo-badge-fct {
            background: #dcfce7 !important;
            color: #15803d !important;
        }
        .nga-geo-loading, .nga-geo-empty {
            padding: 16px !important;
            font-size: 14px !important;
            color: #000000 !important;
            -webkit-text-fill-color: #000000 !important;
            font-weight: 700 !important;
            text-align: center !important;
            background: #ffffff !important;
            background-color: #ffffff !important;
        }
    `;

    // Inject styles once into head
    function injectStyles() {
        if (document.getElementById('nga-geo-autocomplete-styles')) return;
        const style = document.createElement('style');
        style.id = 'nga-geo-autocomplete-styles';
        style.textContent = CSS_STYLES;
        document.head.appendChild(style);
    }

    // Real-time Free Geocoding API search via OpenStreetMap Live Engine
    async function searchOnlineOsm(query) {
        if (!query || query.trim().length < 2) return [];
        const cleanQuery = query.trim();

        // 1. Fast server proxy endpoint with built-in caching & OSM connection
        try {
            const proxyController = new AbortController();
            const proxyTimeout = setTimeout(() => proxyController.abort(), 3000);
            const proxyRes = await fetch(`/api/geocode/search?q=${encodeURIComponent(cleanQuery)}`, {
                signal: proxyController.signal
            });
            clearTimeout(proxyTimeout);

            if (proxyRes.ok) {
                const proxyData = await proxyRes.json();
                const items = Array.isArray(proxyData) ? proxyData : (proxyData.results || []);
                if (items && items.length > 0) {
                    return items.map(item => ({
                        name: item.name,
                        display_name: item.display_name || item.name,
                        city: item.city || '',
                        state: item.state || 'Nigeria',
                        lat: parseFloat(item.lat),
                        lng: parseFloat(item.lng || item.lon),
                        type: item.type || 'osm'
                    }));
                }
            }
        } catch (err) {
            // Fallback to direct client-side OSM query if proxy fails
        }

        // 2. Direct OpenStreetMap Nominatim query fallback
        try {
            const directController = new AbortController();
            const directTimeout = setTimeout(() => directController.abort(), 3000);
            const directRes = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(cleanQuery)}&countrycodes=ng&addressdetails=1&limit=8`, {
                headers: { 'Accept': 'application/json' },
                signal: directController.signal
            });
            clearTimeout(directTimeout);

            if (directRes.ok) {
                const data = await directRes.json();
                if (Array.isArray(data) && data.length > 0) {
                    return data.map(item => {
                        const addr = item.address || {};
                        const name = item.name || '';
                        const road = addr.road || addr.neighbourhood || addr.suburb || '';
                        const city = addr.city || addr.town || addr.county || addr.city_district || '';
                        const state = addr.state || 'Nigeria';

                        const nameParts = [name, road, city, state].filter(Boolean);
                        const uniqueParts = [...new Set(nameParts)];
                        const formattedName = uniqueParts.length > 0 ? uniqueParts.join(', ') : (item.display_name || 'Nigeria');

                        return {
                            name: formattedName,
                            display_name: item.display_name || formattedName,
                            city: city || state,
                            state: state,
                            lat: parseFloat(item.lat),
                            lng: parseFloat(item.lon),
                            type: item.type || 'osm'
                        };
                    });
                }
            }
        } catch (err) {
            // Network error
        }

        return [];
    }

    // Resolve address text into coordinates via live OpenStreetMap reverse/search
    async function resolveLocationAsync(addressText) {
        if (!addressText || typeof addressText !== 'string' || addressText.trim().length < 2) {
            return { lat: 7.4250, lng: 3.9050, name: 'Bodija, Ibadan, Oyo State', city: 'Ibadan', state: 'Oyo' };
        }
        const results = await searchOnlineOsm(addressText);
        if (results && results.length > 0) {
            return results[0];
        }
        return { lat: 7.4250, lng: 3.9050, name: addressText, city: 'Ibadan', state: 'Oyo' };
    }

    // Synchronous fallback for instant form submission resolution
    function resolveLocationSync(addressText) {
        if (!addressText || typeof addressText !== 'string') {
            return { lat: 7.4250, lng: 3.9050, name: 'Bodija, Ibadan, Oyo State', city: 'Ibadan', state: 'Oyo' };
        }
        const lower = addressText.toLowerCase();
        if (lower.includes('lagos') || lower.includes('ikeja') || lower.includes('lekki') || lower.includes('victoria island') || lower.includes('ikoyi') || lower.includes('yaba') || lower.includes('surulere') || lower.includes('ajah')) {
            return { lat: 6.4281, lng: 3.4219, name: addressText, city: 'Lagos', state: 'Lagos' };
        }
        if (lower.includes('abuja') || lower.includes('wuse') || lower.includes('maitama') || lower.includes('garki') || lower.includes('fct')) {
            return { lat: 9.0579, lng: 7.4951, name: addressText, city: 'Abuja', state: 'FCT' };
        }
        return { lat: 7.4250, lng: 3.9050, name: addressText, city: 'Ibadan', state: 'Oyo' };
    }

    // Main Autocomplete Class attached to input fields
    class NigeriaGeoAutocomplete {
        constructor(inputElement, options = {}) {
            this.input = typeof inputElement === 'string' ? document.querySelector(inputElement) : inputElement;
            if (!this.input || this.input._nga_attached) return;
            this.input._nga_attached = true;

            this.options = Object.assign({
                latField: '#new_latitude, #latitude, .latitude',
                lngField: '#new_longitude, #longitude, .longitude',
                plainAddressField: '#new_plain_address, #plain_address, .plain_address',
                onSelect: null,
                placeholder: 'Enter area, estate, or street name...',
            }, options);

            this.debounceTimer = null;
            this.dropdown = null;
            this.activeIdx = -1;
            this.currentResults = [];

            this.init();
        }

        init() {
            injectStyles();

            // Wrap input in positioning container if not already
            const parent = this.input.parentElement;
            let wrapper = parent;
            if (!parent.classList.contains('nga-geo-wrapper')) {
                wrapper = document.createElement('div');
                wrapper.className = 'nga-geo-wrapper';
                parent.insertBefore(wrapper, this.input);
                wrapper.appendChild(this.input);
            }

            // Create dropdown element
            this.dropdown = document.createElement('div');
            this.dropdown.className = 'nga-geo-dropdown';
            this.dropdown.style.cssText = 'position: absolute !important; top: calc(100% + 4px) !important; left: 0 !important; right: 0 !important; width: 100% !important; z-index: 10000050 !important; background: #ffffff !important; background-color: #ffffff !important; border: 2px solid #000000 !important; border-radius: 10px !important; box-shadow: 0 15px 35px rgba(0,0,0,0.3) !important; max-height: 290px !important; overflow-y: auto !important; padding: 0 !important; display: none;';
            wrapper.appendChild(this.dropdown);

            // Bind Input Events
            this.input.setAttribute('autocomplete', 'off');
            this.input.setAttribute('spellcheck', 'false');

            this.input.addEventListener('input', (e) => this.handleInput(e.target.value));
            this.input.addEventListener('focus', () => {
                if (this.input.value.trim().length >= 2) {
                    this.handleInput(this.input.value);
                }
            });

            this.input.addEventListener('keydown', (e) => this.handleKeydown(e));
            this.input.addEventListener('blur', () => this.handleBlur());

            // Close dropdown on click outside
            document.addEventListener('click', (e) => {
                if (!wrapper.contains(e.target)) {
                    this.closeDropdown();
                }
            });
        }

        handleInput(value) {
            clearTimeout(this.debounceTimer);
            const query = value ? value.trim() : '';

            if (query.length < 2) {
                this.closeDropdown();
                return;
            }

            // Step 1: Show Loading State (Pure Black text on Pure White background)
            this.dropdown.innerHTML = `<div class="nga-geo-loading" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; background: #ffffff !important; background-color: #ffffff !important; padding: 14px; font-weight: 700; text-align: center;"><i class="fa-solid fa-spinner fa-spin me-2" style="color: #ea580c;"></i> Searching map locations...</div>`;
            this.dropdown.style.display = 'block';

            // Step 2: Fetch Live Real-Time OpenStreetMap locations
            this.debounceTimer = setTimeout(async () => {
                const onlineResults = await searchOnlineOsm(query);
                this.renderResults(onlineResults, false);

                // Step 3: AUTO-RESOLVE ON MAP WHILE TYPING
                if (onlineResults && onlineResults.length > 0) {
                    const top = onlineResults[0];
                    
                    // Update hidden coordinates
                    document.querySelectorAll(this.options.latField).forEach(el => {
                        el.value = top.lat;
                    });
                    document.querySelectorAll(this.options.lngField).forEach(el => {
                        el.value = top.lng;
                    });
                    document.querySelectorAll(this.options.plainAddressField).forEach(el => {
                        if (el !== this.input) {
                            el.value = top.name;
                        }
                    });

                    // Update Leaflet map marker and position
                    if (window.foodigoMap && typeof window.foodigoMap.updatePosition === 'function') {
                        window.foodigoMap.updatePosition(top.lat, top.lng, top.name);
                    }

                    if (typeof window.calculateDeliveryCharge === 'function') {
                        window.calculateDeliveryCharge(top.lat, top.lng);
                    }
                }
            }, 300);
        }

        renderResults(results, isSearching = false) {
            this.currentResults = results || [];
            this.activeIdx = -1;
            this.dropdown.innerHTML = '';

            if (this.currentResults.length === 0) {
                if (isSearching) {
                    this.dropdown.innerHTML = `<div class="nga-geo-loading" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; background: #ffffff !important; padding: 14px; font-weight: 700; text-align: center;">Searching map locations...</div>`;
                } else {
                    this.dropdown.innerHTML = `<div class="nga-geo-empty" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; background: #ffffff !important; padding: 14px; font-weight: 700; text-align: center;">No exact location found. Enter your street or landmark directly.</div>`;
                }
                this.dropdown.style.display = 'block';
                return;
            }

            this.currentResults.forEach((item, idx) => {
                const div = document.createElement('div');
                div.className = 'nga-geo-item';
                div.dataset.index = idx;
                div.style.cssText = 'background: #ffffff !important; background-color: #ffffff !important; color: #000000 !important; padding: 12px 15px; cursor: pointer; display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid #f1f5f9; min-height: 48px;';

                let iconChar = '📍';
                if (item.type === 'landmark' || item.type === 'amenity') iconChar = '🏛️';
                if (item.type === 'estate' || item.type === 'residential') iconChar = '🏡';
                if (item.type === 'street' || item.type === 'highway' || item.type === 'primary') iconChar = '🛣️';
                if (item.type === 'city' || item.type === 'town') iconChar = '🏙️';

                let badgeClass = '';
                const st = (item.state || '').toLowerCase();
                if (st.includes('lagos')) badgeClass = 'nga-geo-badge-lagos';
                else if (st.includes('oyo')) badgeClass = 'nga-geo-badge-oyo';
                else if (st.includes('fct') || st.includes('abuja')) badgeClass = 'nga-geo-badge-fct';

                div.innerHTML = `
                    <div class="nga-geo-item-left" style="display: flex; align-items: center; gap: 12px; flex: 1; overflow: hidden;">
                        <span class="nga-geo-icon" style="width: 32px; height: 32px; border-radius: 8px; background: #fef3c7; color: #d97706; display: inline-flex; align-items: center; justify-content: center; font-size: 15px; flex-shrink: 0; border: 1px solid #fde68a;">${iconChar}</span>
                        <div style="overflow: hidden;">
                            <span class="nga-geo-title" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; font-weight: 700 !important; font-size: 15px !important; line-height: 1.35; display: block; text-shadow: none;">${item.name}</span>
                            <span class="nga-geo-subtitle" style="color: #1e293b !important; -webkit-text-fill-color: #1e293b !important; font-weight: 600 !important; font-size: 13px !important; line-height: 1.3; display: block; margin-top: 2px; text-shadow: none;">${item.city ? item.city + ', ' : ''}${item.state || 'Nigeria'}</span>
                        </div>
                    </div>
                    <span class="nga-geo-badge ${badgeClass}" style="font-size: 11px; font-weight: 700; padding: 3px 9px; border-radius: 9999px; margin-left: 8px; flex-shrink: 0; text-transform: uppercase;">${item.state || 'NG'}</span>
                `;

                div.addEventListener('mouseenter', () => {
                    div.style.backgroundColor = '#f1f5f9';
                });
                div.addEventListener('mouseleave', () => {
                    if (this.activeIdx !== idx) {
                        div.style.backgroundColor = '#ffffff';
                    }
                });

                div.addEventListener('mousedown', (e) => {
                    e.preventDefault();
                    this.selectItem(item);
                });

                this.dropdown.appendChild(div);
            });

            this.dropdown.style.display = 'block';
        }

        handleKeydown(e) {
            const items = this.dropdown.querySelectorAll('.nga-geo-item');
            if (e.key === 'ArrowDown') {
                e.preventDefault();
                this.activeIdx = (this.activeIdx + 1) % items.length;
                this.updateActiveItem(items);
            } else if (e.key === 'ArrowUp') {
                e.preventDefault();
                this.activeIdx = (this.activeIdx - 1 + items.length) % items.length;
                this.updateActiveItem(items);
            } else if (e.key === 'Enter') {
                if (this.activeIdx >= 0 && this.currentResults[this.activeIdx]) {
                    e.preventDefault();
                    this.selectItem(this.currentResults[this.activeIdx]);
                } else if (this.currentResults.length > 0) {
                    e.preventDefault();
                    this.selectItem(this.currentResults[0]);
                } else {
                    this.autoResolveCurrentValue();
                }
            } else if (e.key === 'Escape') {
                this.closeDropdown();
            }
        }

        updateActiveItem(items) {
            items.forEach((it, i) => {
                if (i === this.activeIdx) {
                    it.classList.add('active');
                    it.style.backgroundColor = '#f1f5f9';
                    it.scrollIntoView({ block: 'nearest' });
                } else {
                    it.classList.remove('active');
                    it.style.backgroundColor = '#ffffff';
                }
            });
        }

        handleBlur() {
            setTimeout(() => {
                this.closeDropdown();
                this.autoResolveCurrentValue();
            }, 200);
        }

        autoResolveCurrentValue() {
            const val = this.input.value.trim();
            if (!val) return;

            // Check if coordinates are already filled
            const latEls = document.querySelectorAll(this.options.latField);
            const lngEls = document.querySelectorAll(this.options.lngField);
            const hasCoords = Array.from(latEls).some(el => el.value && parseFloat(el.value) !== 0);

            if (!hasCoords) {
                // Try resolving via online OSM or fallback
                searchOnlineOsm(val).then(results => {
                    if (results && results.length > 0) {
                        this.populateFields(results[0], false);
                        if (window.foodigoMap && typeof window.foodigoMap.updatePosition === 'function') {
                            window.foodigoMap.updatePosition(results[0].lat, results[0].lng, results[0].name);
                        }
                    } else {
                        const resolved = resolveLocationSync(val);
                        this.populateFields(resolved, false);
                        if (window.foodigoMap && typeof window.foodigoMap.updatePosition === 'function') {
                            window.foodigoMap.updatePosition(resolved.lat, resolved.lng, resolved.name);
                        }
                    }
                });
            }
        }

        selectItem(item) {
            this.input.value = item.name;
            this.populateFields(item, true);
            this.closeDropdown();

            // Locate immediately on Leaflet Map
            if (window.foodigoMap && typeof window.foodigoMap.updatePosition === 'function') {
                window.foodigoMap.updatePosition(item.lat, item.lng, item.name);
            }

            // Record manual selection
            try {
                localStorage.setItem('foodigo_user_location_set', 'manual');
            } catch (e) {}
        }

        populateFields(item, userExplicit = true) {
            // Latitude fields
            document.querySelectorAll(this.options.latField).forEach(el => {
                el.value = item.lat;
            });

            // Longitude fields
            document.querySelectorAll(this.options.lngField).forEach(el => {
                el.value = item.lng;
            });

            // Plain address fields
            document.querySelectorAll(this.options.plainAddressField).forEach(el => {
                if (el !== this.input) {
                    el.value = item.name;
                }
            });

            // Trigger global delivery charge calculation
            if (typeof window.calculateDeliveryCharge === 'function') {
                window.calculateDeliveryCharge(item.lat, item.lng);
            }

            if (typeof this.options.onSelect === 'function') {
                this.options.onSelect(item, userExplicit);
            }
        }

        closeDropdown() {
            if (this.dropdown) {
                this.dropdown.style.display = 'none';
            }
        }
    }

    // Expose Global Helper API
    window.NigeriaGeo = {
        attach: function (selector, options) {
            const elements = document.querySelectorAll(selector);
            const instances = [];
            elements.forEach(el => {
                instances.push(new NigeriaGeoAutocomplete(el, options));
            });
            return instances;
        },
        resolve: resolveLocationSync,
        resolveAsync: resolveLocationAsync,
        searchOnline: searchOnlineOsm
    };

    // Auto-initialize on common location input IDs when DOM is ready
    function autoInitInputs() {
        const commonSelectors = [
            '#searchMapInput',
            '#new_plain_address',
            '#plain_address',
            '#checkout_modal_address',
            '#guest_address_input'
        ];
        commonSelectors.forEach(sel => {
            if (document.querySelector(sel)) {
                window.NigeriaGeo.attach(sel);
            }
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', autoInitInputs);
    } else {
        autoInitInputs();
    }

})(window, document);
