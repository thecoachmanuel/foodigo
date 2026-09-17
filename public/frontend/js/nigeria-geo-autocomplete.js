/**
 * Live OpenStreetMap & Photon Geocoding + Leaflet Interactive Map Engine for Foodigo
 * 100% Free, Unlimited Real-Time Location Search, Auto-Locate & Pin Draggable Mapping
 * High-Contrast Black on White Dropdown (#000000 on #ffffff)
 */
(function (window, document) {
    'use strict';

    // High-Contrast CSS styles for autocomplete dropdown and interactive maps
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
            font-size: 13px !important;
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
        .nga-geo-badge-lagos { background: #dbeafe !important; color: #1d4ed8 !important; }
        .nga-geo-badge-oyo { background: #fef3c7 !important; color: #b45309 !important; }
        .nga-geo-badge-fct { background: #dcfce7 !important; color: #15803d !important; }

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

        /* Interactive Map Container Styles */
        .foodigo-interactive-map-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            margin-top: 14px;
            margin-bottom: 16px;
        }
        .foodigo-interactive-map-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 16px;
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            font-size: 13.5px;
            font-weight: 600;
            color: #334155;
        }
        .foodigo-interactive-map-header .locate-btn {
            background: #ffffff;
            border: 1.5px solid #000000;
            color: #000000;
            font-weight: 700;
            font-size: 13px;
            padding: 5px 12px;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s ease;
        }
        .foodigo-interactive-map-header .locate-btn:hover {
            background: #000000;
            color: #ffffff;
        }
        .foodigo-map-element {
            height: 250px;
            width: 100%;
            background: #e2e8f0;
            z-index: 1;
        }
        .foodigo-map-footer-hint {
            padding: 8px 14px;
            font-size: 12px;
            color: #64748b;
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .foodigo-leaflet-div-icon {
            background: transparent;
            border: none;
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

    // Real-time Free Geocoding API search
    async function searchOnlineOsm(query, userLat = 7.44, userLng = 3.90) {
        if (!query || query.trim().length < 2) return [];
        const cleanQuery = query.trim();

        // 1. Fast server proxy endpoint with built-in multi-pass engine (Photon + Nominatim)
        try {
            const proxyController = new AbortController();
            const proxyTimeout = setTimeout(() => proxyController.abort(), 3500);
            const proxyRes = await fetch(`/api/geocode/search?q=${encodeURIComponent(cleanQuery)}&lat=${userLat}&lng=${userLng}`, {
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
            // Fallback to client-side Photon query if proxy has network error
        }

        // 2. Direct Komoot Photon API fallback (client-side)
        try {
            const directController = new AbortController();
            const directTimeout = setTimeout(() => directController.abort(), 3500);
            const directRes = await fetch(`https://photon.komoot.io/api/?q=${encodeURIComponent(cleanQuery)}&lat=${userLat}&lon=${userLng}&limit=8`, {
                headers: { 'Accept': 'application/json' },
                signal: directController.signal
            });
            clearTimeout(directTimeout);

            if (directRes.ok) {
                const data = await directRes.json();
                const features = data.features || [];
                if (features.length > 0) {
                    return features.filter(f => {
                        const p = f.properties || {};
                        const coords = f.geometry ? f.geometry.coordinates : [0,0];
                        const lat = coords[1];
                        const lng = coords[0];
                        const cc = (p.countrycode || '').toLowerCase();
                        return (cc === 'ng' || (lat >= 4.0 && lat <= 14.0 && lng >= 2.5 && lng <= 15.0));
                    }).map(f => {
                        const p = f.properties || {};
                        const coords = f.geometry ? f.geometry.coordinates : [0,0];
                        const name = p.name || p.street || '';
                        const street = p.street || '';
                        const district = p.district || p.locality || '';
                        const city = p.city || p.county || '';
                        const state = p.state || 'Oyo';
                        const parts = [name, street, district, city, state].filter(Boolean);
                        const unique = [...new Set(parts)];
                        const formatted = unique.length > 0 ? unique.join(', ') : name;

                        return {
                            name: formatted,
                            display_name: formatted,
                            city: city || district,
                            state: state,
                            lat: coords[1],
                            lng: coords[0],
                            type: p.osm_key || 'landmark'
                        };
                    });
                }
            }
        } catch (err) {
            // Fallback
        }

        return [];
    }

    // Real-time reverse geocode (lat, lng -> clean address string)
    async function reverseGeocodeOnline(lat, lng) {
        if (!lat || !lng || parseFloat(lat) === 0) {
            return 'Bodija, Ibadan, Oyo State';
        }
        try {
            const res = await fetch(`/api/geocode/reverse?lat=${lat}&lng=${lng}`);
            if (res.ok) {
                const data = await res.json();
                if (data && data.address) {
                    return data.address;
                }
            }
        } catch (e) {}

        try {
            const resNom = await fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=18&addressdetails=1`);
            if (resNom.ok) {
                const d = await resNom.json();
                const a = d.address || {};
                const name = a.amenity || a.building || a.shop || '';
                const road = a.road || a.pedestrian || a.suburb || '';
                const city = a.city || a.town || a.county || '';
                const state = a.state || 'Nigeria';
                const parts = [name, road, city, state].filter(Boolean);
                const u = [...new Set(parts)];
                if (u.length > 0) return u.join(', ');
                if (d.display_name) return d.display_name.split(', ').slice(0, 4).join(', ');
            }
        } catch (e) {}

        return 'Bodija, Ibadan, Oyo State';
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
                mapInstance: null,
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

            // Show Loading State (Pure Black text on Pure White background)
            this.dropdown.innerHTML = `<div class="nga-geo-loading" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; background: #ffffff !important; background-color: #ffffff !important; padding: 14px; font-weight: 700; text-align: center;"><i class="fa-solid fa-spinner fa-spin me-2" style="color: #ea580c;"></i> Searching live locations...</div>`;
            this.dropdown.style.display = 'block';

            // Fetch Live Real-Time Multi-Source Locations
            this.debounceTimer = setTimeout(async () => {
                const onlineResults = await searchOnlineOsm(query);
                this.renderResults(onlineResults, false);

                // Auto-resolve top match on typing
                if (onlineResults && onlineResults.length > 0) {
                    const top = onlineResults[0];
                    document.querySelectorAll(this.options.latField).forEach(el => { el.value = top.lat; });
                    document.querySelectorAll(this.options.lngField).forEach(el => { el.value = top.lng; });
                    document.querySelectorAll(this.options.plainAddressField).forEach(el => {
                        if (el !== this.input) el.value = top.name;
                    });

                    if (this.options.mapInstance && typeof this.options.mapInstance.setMarker === 'function') {
                        this.options.mapInstance.setMarker(top.lat, top.lng, top.name, false);
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
                    this.dropdown.innerHTML = `<div class="nga-geo-loading" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; background: #ffffff !important; padding: 14px; font-weight: 700; text-align: center;">Searching live locations...</div>`;
                } else {
                    this.dropdown.innerHTML = `<div class="nga-geo-empty" style="color: #000000 !important; -webkit-text-fill-color: #000000 !important; background: #ffffff !important; padding: 14px; font-weight: 700; text-align: center;">No exact match found. You can pinpoint your location on the map.</div>`;
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
                if (item.type === 'landmark' || item.type === 'amenity' || item.type === 'university' || item.type === 'building') iconChar = '🏛️';
                if (item.type === 'estate' || item.type === 'residential' || item.type === 'house') iconChar = '🏡';
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
                    div.style.backgroundColor = '#ffffff';
                });
                div.addEventListener('mousedown', (e) => {
                    e.preventDefault();
                    this.selectItem(item);
                });

                this.dropdown.appendChild(div);
            });

            this.dropdown.style.display = 'block';
        }

        selectItem(item) {
            this.input.value = item.name;

            document.querySelectorAll(this.options.latField).forEach(el => { el.value = item.lat; });
            document.querySelectorAll(this.options.lngField).forEach(el => { el.value = item.lng; });
            document.querySelectorAll(this.options.plainAddressField).forEach(el => {
                if (el !== this.input) el.value = item.name;
            });

            if (this.options.mapInstance && typeof this.options.mapInstance.setMarker === 'function') {
                this.options.mapInstance.setMarker(item.lat, item.lng, item.name, true);
            }

            if (typeof this.options.onSelect === 'function') {
                this.options.onSelect(item);
            }

            if (typeof window.calculateDeliveryCharge === 'function') {
                window.calculateDeliveryCharge(item.lat, item.lng);
            }

            this.closeDropdown();
        }

        handleKeydown(e) {
            const items = this.dropdown.querySelectorAll('.nga-geo-item');
            if (items.length === 0 || this.dropdown.style.display === 'none') return;

            if (e.key === 'ArrowDown') {
                e.preventDefault();
                this.activeIdx = (this.activeIdx + 1) % items.length;
                this.updateActiveItem(items);
            } else if (e.key === 'ArrowUp') {
                e.preventDefault();
                this.activeIdx = (this.activeIdx - 1 + items.length) % items.length;
                this.updateActiveItem(items);
            } else if (e.key === 'Enter') {
                if (this.activeIdx >= 0 && this.activeIdx < this.currentResults.length) {
                    e.preventDefault();
                    this.selectItem(this.currentResults[this.activeIdx]);
                }
            } else if (e.key === 'Escape') {
                this.closeDropdown();
            }
        }

        updateActiveItem(items) {
            items.forEach((item, idx) => {
                if (idx === this.activeIdx) {
                    item.classList.add('active');
                    item.style.backgroundColor = '#f1f5f9';
                    item.scrollIntoView({ block: 'nearest' });
                } else {
                    item.classList.remove('active');
                    item.style.backgroundColor = '#ffffff';
                }
            });
        }

        closeDropdown() {
            if (this.dropdown) {
                this.dropdown.style.display = 'none';
            }
            this.activeIdx = -1;
        }
    }

    // Leaflet Interactive Map Helper
    class FoodigoInteractiveMap {
        constructor(containerId, options = {}) {
            this.container = typeof containerId === 'string' ? document.getElementById(containerId) : containerId;
            if (!this.container) return;

            this.options = Object.assign({
                initialLat: 7.4250,
                initialLng: 3.9050,
                initialZoom: 15,
                inputSelector: '#guest_address_input',
                latSelector: '#latitude',
                lngSelector: '#longitude',
                locateBtnSelector: null,
                onChange: null,
            }, options);

            this.map = null;
            this.marker = null;
            this.isDragging = false;

            this.init();
        }

        init() {
            injectStyles();
            if (!window.L) {
                console.warn('Leaflet is not loaded yet');
                return;
            }

            // Create custom icon
            const customIcon = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: `<div style="background: #ea580c; width: 34px; height: 34px; border-radius: 50% 50% 50% 0; transform: rotate(-45deg); border: 3px solid #ffffff; box-shadow: 0 4px 12px rgba(0,0,0,0.3); display: flex; align-items: center; justify-content: center; cursor: pointer;"><div style="width: 10px; height: 10px; background: #ffffff; border-radius: 50%; transform: rotate(45deg);"></div></div>`,
                iconSize: [34, 34],
                iconAnchor: [17, 34],
                popupAnchor: [0, -34]
            });

            // Initialize Leaflet Map
            this.map = L.map(this.container, {
                zoomControl: true,
                scrollWheelZoom: true,
                attributionControl: false
            }).setView([this.options.initialLat, this.options.initialLng], this.options.initialZoom);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
            }).addTo(this.map);

            // Add Draggable Marker
            this.marker = L.marker([this.options.initialLat, this.options.initialLng], {
                draggable: true,
                icon: customIcon
            }).addTo(this.map);

            // Map Drag Event
            this.marker.on('dragend', async (e) => {
                const pos = e.target.getLatLng();
                await this.handleCoordinateChange(pos.lat, pos.lng, true);
            });

            // Map Click Event
            this.map.on('click', async (e) => {
                this.marker.setLatLng(e.latlng);
                await this.handleCoordinateChange(e.latlng.lat, e.latlng.lng, true);
            });

            // Bind "Locate Me" button if specified
            if (this.options.locateBtnSelector) {
                const btn = document.querySelector(this.options.locateBtnSelector);
                if (btn) {
                    btn.addEventListener('click', (e) => {
                        e.preventDefault();
                        this.locateUser();
                    });
                }
            }

            // Invalidate size on load / modal open
            setTimeout(() => {
                if (this.map) this.map.invalidateSize();
            }, 400);
        }

        async handleCoordinateChange(lat, lng, doReverse = true) {
            // Update inputs
            if (this.options.latSelector) {
                document.querySelectorAll(this.options.latSelector).forEach(el => { el.value = lat; });
            }
            if (this.options.lngSelector) {
                document.querySelectorAll(this.options.lngSelector).forEach(el => { el.value = lng; });
            }

            if (doReverse) {
                const address = await reverseGeocodeOnline(lat, lng);
                if (this.options.inputSelector) {
                    const inp = document.querySelector(this.options.inputSelector);
                    if (inp) inp.value = address;
                }
                this.marker.bindPopup(`<b>${address}</b>`).openPopup();
            }

            if (typeof this.options.onChange === 'function') {
                this.options.onChange(lat, lng);
            }

            if (typeof window.calculateDeliveryCharge === 'function') {
                window.calculateDeliveryCharge(lat, lng);
            }
        }

        setMarker(lat, lng, label = '', panMap = true) {
            if (!this.map || !this.marker) return;
            const pos = [parseFloat(lat), parseFloat(lng)];
            this.marker.setLatLng(pos);
            if (panMap) {
                this.map.setView(pos, 16);
            }
            if (label) {
                this.marker.bindPopup(`<b>${label}</b>`).openPopup();
            }
        }

        locateUser() {
            if (!navigator.geolocation) {
                if (window.toastr) toastr.error('Geolocation is not supported by your browser.');
                return;
            }

            if (window.toastr) toastr.info('Detecting your live GPS location...');

            navigator.geolocation.getCurrentPosition(
                async (pos) => {
                    const lat = pos.coords.latitude;
                    const lng = pos.coords.longitude;
                    this.setMarker(lat, lng, 'Your Location', true);
                    await this.handleCoordinateChange(lat, lng, true);
                    if (window.toastr) toastr.success('Location detected!');
                },
                (err) => {
                    if (window.toastr) toastr.warning('Please allow location permission in your browser or search your street manually.');
                },
                { enableHighAccuracy: true, timeout: 8000, maximumAge: 0 }
            );
        }

        invalidateSize() {
            if (this.map) this.map.invalidateSize();
        }
    }

    // Export to Window
    window.NigeriaGeo = {
        attach: function (inputSelector, options = {}) {
            return new NigeriaGeoAutocomplete(inputSelector, options);
        },
        createMap: function (containerId, options = {}) {
            return new FoodigoInteractiveMap(containerId, options);
        },
        searchOnline: searchOnlineOsm,
        reverseGeocode: reverseGeocodeOnline,
        resolve: resolveLocationSync,
    };

})(window, document);
