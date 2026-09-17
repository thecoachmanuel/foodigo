@extends('frontend.layouts.master')

@section('title')
    <title>{{__('translate.Edit Address')}}</title>
@endsection

@section('content')
    <main class="search_V1_bg" >
        <!-- banner-part start  -->

        <div class="profile_bg"
             style="background-image: url({{ asset($general_setting->breadcrumb_image) }});">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-12">
                        <ul class="breadcrumb">
                            <li><a href="{{route('home')}}">{{__('translate.Home')}}</a></li>
                            <li><a href="{{ route('home') }}">/</a></li>
                            <li><a href="javascript:;" class="active">{{__('translate.Address')}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- banner-part end -->

        <!-- dashboard part start  -->
        <section class="dashboard">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4  col-xxl-3">
                        @include('frontend.layouts.partials.dashboard_partials')
                    </div>

                    <div class="col-lg-8  col-xxl-9">

                        <div class="row">
                            <div class="col-12">

                                <div class="dashbord_taitel mb-4">
                                    <h4>{{__('translate.Edit Address')}}</h4>
                                </div>

                                <div class="dashbord_edit_profile">
                                    <form class="edit_profile_form" method="post"
                                        action="{{route('user.address-update', $address->id)}}">

                                        @csrf
                                        @method('put')

                                        <div class="address_form_item">
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mb-3 mt-3">{{ __('translate.Name') }}</label>
                                                <input type="text" class="form-control delivery-info" id="" value="{{$address->name}}"
                                                        name="name"
                                                        >
                                            </div>
                                        </div>

                                        <div class="address_form_item">
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mb-3 mt-3">{{ __('translate.Email Address') }}</label>
                                                <input type="email" class="form-control delivery-info" id="" value="{{$address->email}}"
                                                        name="email">
                                            </div>
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mb-3 mt-3">{{ __('translate.Phone Number') }}</label>
                                                <input type="text" class="form-control delivery-info" id="" value="{{$address->phone}}"
                                                        name="phone">
                                            </div>
                                        </div>

                                        <div class="address_form_item">
                                            <div class="address_form_inner">
                                                <label class="crancy__item-label mb-3 mt-3">{{ __('translate.Your Location') }} * </label>
                                                <div class="position-relative w-100">
                                                    <input id="searchMapInput" class="form-control" type="text"
                                                           placeholder="{{ __('translate.Search area, street, or estate...') }}" value="{{ $address->address }}" autocomplete="off" style="font-weight: 600;">
                                                </div>

                                                <!-- Quick Location Actions Bar matching Home Screen -->
                                                <div class="d-flex align-items-center justify-content-between mt-2 mb-2 px-1">
                                                    <small class="text-muted" style="font-size: 12px; font-weight: 500;">
                                                        <i class="fa-solid fa-map-pin text-warning me-1"></i> {{ __('translate.Drag pin or click map to adjust') }}
                                                    </small>
                                                    <button type="button" id="btn_detect_gps" class="btn btn-sm" style="font-size: 12px; font-weight: 700; color: #ea580c; background: #fff7ed; border: 1px solid #fed7aa; border-radius: 8px; padding: 4px 10px; display: inline-flex; align-items: center; gap: 6px;">
                                                        <i class="fa-solid fa-crosshairs"></i> <span id="btn_gps_text">{{ __('translate.Locate Me') }}</span>
                                                    </button>
                                                </div>

                                                <div id="google_map_area"></div>
                                            </div>
                                        </div>

                                        <div class="address_form_item">
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mt-3 mb-2">{{__('translate.Address')}}</label>
                                                <input type="text" class="form-control delivery-info" name="address" id="plain_address" value="{{$address->address}}">
                                            </div>
                                        </div>

                                        <div class="address_form_item d-none">
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mt-2 mb-2">{{__('translate.Latitude')}}</label>
                                                <input class="form-control delivery-info latitude" type="text" name="latitude" id="latitude" value="{{$address->lat}}" readonly>
                                            </div>
                                        </div>

                                        <div class="address_form_item d-none">
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mt-2 mb-2">{{__('translate.Longitude')}}</label>
                                                <input class="form-control longitude delivery-info" type="text" name="longitude" id="longitude" value="{{$address->lon}}" readonly>
                                            </div>
                                        </div>
                                        <div class="address_form_item mb-4">
                                            <div class="address_form_inner">
                                                <label for="" class="form-label mb-3 mt-3">{{ __('translate.Delivery Type') }}</label>
                                                <select class="form-select delivery-info" aria-label="Default select example"
                                                        name="delivery_type">
                                                    <option {{ $address->delivery_type == 'home' ? 'selected' : '' }} value="home">{{ __('translate.Home') }}</option>
                                                    <option {{ $address->delivery_type == 'office' ? 'selected' : '' }} value="office">{{ __('translate.Office') }}</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="edit_profile_form_btn">
                                            <button type="submit" class="thm-btn">{{__('translate.Update')}}</button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

    </main>
@endsection

@push('style_section')
    <style>
        #google_map_area {
            height: 280px;
            width: 100%;
            border-radius: 12px;
            margin-top: 10px;
            border: 1.5px solid #cbd5e1;
            z-index: 1;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        }

        .foodigo-leaflet-div-icon {
            background: none !important;
            border: none !important;
        }

        .foodigo-map-pin {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            background: #ea580c;
            border: 2.5px solid #ffffff;
            border-radius: 50% 50% 50% 0;
            transform: rotate(-45deg);
            box-shadow: 0 4px 10px rgba(0,0,0,0.35);
        }

        .foodigo-map-pin i {
            transform: rotate(45deg);
            color: #ffffff;
            font-size: 15px;
        }

        /* High-Contrast Pure Black on White Autocomplete Dropdown */
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
    </style>
@endpush

@push('js_section')
    <script>
        "use strict";

        $(document).ready(function() {
            let defaultLat = parseFloat("{{ $address->lat ?? session('latitude', '7.4250') }}") || 7.4250;
            let defaultLng = parseFloat("{{ $address->lon ?? session('longitude', '3.9050') }}") || 3.9050;

            const foodigoPinIcon = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin"><i class="fa-solid fa-location-dot"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            const addrMap = L.map('google_map_area', {
                center: [defaultLat, defaultLng],
                zoom: 15,
                zoomControl: true,
                attributionControl: false
            });

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19
            }).addTo(addrMap);

            const addrMarker = L.marker([defaultLat, defaultLng], {
                draggable: true,
                icon: foodigoPinIcon
            }).addTo(addrMap);

            @if($address->address)
                addrMarker.bindPopup(`<b>{{ addslashes($address->address) }}</b>`).openPopup();
            @endif

            function updateCoords(lat, lng, addressText) {
                $('#latitude').val(lat);
                $('#longitude').val(lng);
                if (addressText) {
                    $('#plain_address').val(addressText);
                    $('#searchMapInput').val(addressText);
                    addrMarker.bindPopup(`<b>${addressText}</b>`).openPopup();
                } else {
                    fetch(`/api/geocode/reverse?lat=${lat}&lng=${lng}`)
                        .then(res => res.json())
                        .then(data => {
                            if (data && data.address) {
                                $('#plain_address').val(data.address);
                                $('#searchMapInput').val(data.address);
                                addrMarker.bindPopup(`<b>${data.address}</b>`).openPopup();
                            }
                        })
                        .catch(console.warn);
                }
            }

            addrMarker.on('dragend', function(e) {
                const pos = e.target.getLatLng();
                updateCoords(pos.lat, pos.lng);
            });

            addrMap.on('click', function(e) {
                addrMarker.setLatLng(e.latlng);
                updateCoords(e.latlng.lat, e.latlng.lng);
            });

            // Locate Me GPS Button Handler
            $('#btn_detect_gps').on('click', function() {
                const $text = $('#btn_gps_text');
                $text.text("{{ __('translate.Locating...') }}");

                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(
                        function(pos) {
                            const lat = pos.coords.latitude;
                            const lng = pos.coords.longitude;
                            addrMap.setView([lat, lng], 16);
                            addrMarker.setLatLng([lat, lng]);
                            updateCoords(lat, lng);
                            $text.text("{{ __('translate.Located!') }}");
                            setTimeout(() => { $text.text("{{ __('translate.Locate Me') }}"); }, 2000);
                        },
                        function(err) {
                            $text.text("{{ __('translate.Locate Me') }}");
                            toastr.warning("{{ __('translate.Could not access GPS. Please pinpoint your location on the map or type your address.') }}");
                        },
                        { enableHighAccuracy: true, timeout: 8000 }
                    );
                } else {
                    $text.text("{{ __('translate.Locate Me') }}");
                    toastr.warning("{{ __('translate.Geolocation is not supported by your browser.') }}");
                }
            });

            // Auto-Geocoding Function: Converts typed text directly into lat/lng + moves pin
            let geocodeTimer = null;
            function autoGeocodeAddress(queryText, updateOtherFieldSelector) {
                if (!queryText || queryText.trim().length < 2) return;
                clearTimeout(geocodeTimer);
                geocodeTimer = setTimeout(() => {
                    fetch(`/api/geocode/search?q=${encodeURIComponent(queryText.trim())}`)
                        .then(res => res.json())
                        .then(results => {
                            if (results && results.length > 0) {
                                const top = results[0];
                                $('#latitude').val(top.lat);
                                $('#longitude').val(top.lng);
                                if (updateOtherFieldSelector) {
                                    $(updateOtherFieldSelector).val(top.name);
                                }
                                addrMap.setView([top.lat, top.lng], 16);
                                addrMarker.setLatLng([top.lat, top.lng]);
                                addrMarker.bindPopup(`<b>${top.name}</b>`).openPopup();
                            }
                        })
                        .catch(console.warn);
                }, 400);
            }

            // Bind real-time input / paste / change events to auto-populate lat/lng
            $('#plain_address').on('input paste change', function() {
                const val = $(this).val();
                if (val && val.trim().length >= 3) {
                    autoGeocodeAddress(val, '#searchMapInput');
                }
            });

            $('#searchMapInput').on('input paste change', function() {
                const val = $(this).val();
                if (val && val.trim().length >= 3) {
                    autoGeocodeAddress(val, '#plain_address');
                }
            });

            if (window.NigeriaGeo) {
                window.NigeriaGeo.attach('#searchMapInput', {
                    latField: '#latitude, .latitude',
                    lngField: '#longitude, .longitude',
                    plainAddressField: '#plain_address',
                    onSelect: function(item) {
                        $('#plain_address').val(item.name);
                        $('#latitude').val(item.lat);
                        $('#longitude').val(item.lng);
                        addrMap.setView([item.lat, item.lng], 16);
                        addrMarker.setLatLng([item.lat, item.lng]);
                        addrMarker.bindPopup(`<b>${item.name}</b>`).openPopup();
                    }
                });

                window.NigeriaGeo.attach('#plain_address', {
                    latField: '#latitude, .latitude',
                    lngField: '#longitude, .longitude',
                    plainAddressField: '#searchMapInput',
                    onSelect: function(item) {
                        $('#latitude').val(item.lat);
                        $('#longitude').val(item.lng);
                        addrMap.setView([item.lat, item.lng], 16);
                        addrMarker.setLatLng([item.lat, item.lng]);
                        addrMarker.bindPopup(`<b>${item.name}</b>`).openPopup();
                    }
                });
            }

            setTimeout(() => { addrMap.invalidateSize(); }, 300);
        });
    </script>
@endpush
