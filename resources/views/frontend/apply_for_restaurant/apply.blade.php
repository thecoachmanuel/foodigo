@extends('frontend.layouts.master')

@section('title')
    <title>{{ __('translate.Apply for restaurant') }}</title>
@endsection

@section('content')
    <main>
        <!-- banner-part start  -->

        <div class="profile_bg"
             style="background-image: url({{ asset($general_setting->breadcrumb_image) }});">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-12">
                        <ul class="breadcrumb">
                            <li><a href="{{route('home')}}">{{__('translate.Home')}}</a></li>
                            <li><a href="{{ route('home') }}">/</a></li>
                            <li><a href="javascript:;" class="active">{{__('translate.Apply for restaurant')}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- banner-part end -->


        <!-- contuct part start  -->


        <section class="contact_us">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xxl-10">
                        <div class="contact_us_txt">
                            <div class="create_new_btn_inline_box">
                                <h4 class="crancy-product-card__title mb-3">{{ __('translate.Basic Information') }}</h4>
                            </div>
                        </div>


                        <form class="edit_profile_form" action="{{route('store-restaurant')}}" method="post" enctype="multipart/form-data">
                            @csrf

                            <div class="dashbord_edit_profile dashbord_edit_profile_two">
                                    <div class="edit_profile_form_item">

                                        <div class="edit_profile_form_inner">
                                            <div class="crancy__item-form--group">
                                                <label class="crancy__item-label mb-2">{{ __('translate.Logo Image') }} * </label>
                                                <div class="crancy-product-card__upload crancy-product-card__upload--border bg-white w-100 h-100">
                                                    <input type="file" class="btn-check" name="logo" id="input-img1" autocomplete="off" onchange="previewImage(event)">
                                                    <label class="crancy-image-video-upload__label" for="input-img1">
                                                        <img id="view_img" class="restaurant-image" src="{{ asset($general_setting->placeholder_image) }}">
                                                        <h4 class="crancy-image-video-upload__title">{{ __('translate.Click here to') }} <span class="crancy-primary-color">{{ __('translate.Choose File') }}</span> {{ __('translate.and upload') }} </h4>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="edit_profile_form_inner">
                                            <div class="crancy__item-form--group">
                                                <label class="crancy__item-label mb-2">{{ __('translate.Cover Image') }} * </label>
                                                <div class="crancy-product-card__upload crancy-product-card__upload--border bg-white w-100 h-100">
                                                    <input type="file" class="btn-check" name="cover_image" id="input-img2" autocomplete="off" onchange="previewCoverImage(event)">
                                                    <label class="crancy-image-video-upload__label" for="input-img2">
                                                        <img class="restaurant-cover-image" id="view_cover_img" src="{{ asset($general_setting->placeholder_image) }}">
                                                        <h4 class="crancy-image-video-upload__title">{{ __('translate.Click here to') }} <span class="crancy-primary-color">{{ __('translate.Choose File') }}</span> {{ __('translate.and upload') }} </h4>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="edit_profile_form_item">
                                        <div class="edit_profile_form_inner">
                                            <label for="title" class="form-label">{{__('translate.Restaurant Name')}}</label>
                                            <input type="text" class="form-control" id="title"
                                                name="restaurant_name" value="{{ old('restaurant_name') }}">
                                        </div>
                                        <div class="edit_profile_form_inner">
                                            <label for="slug" class="form-label">{{__('translate.Slug')}}</label>
                                            <input type="text" class="form-control" id="slug" value="{{ old('slug') }}"
                                                name="slug">
                                        </div>
                                    </div>

                                    <div class="edit_profile_form_item">
                                        <div class="edit_profile_form_inner">
                                            <label class="crancy__item-label mb-2">{{ __('translate.City') }} * </label>
                                            <select class="form-select crancy__item-input select2" name="city_id">
                                                <option value="">{{ __('translate.Select City') }}</option>
                                                @foreach ($cities as $city)
                                                    <option {{ $city->id == old('city_id') ? 'selected' : '' }} value="{{ $city->id }}">{{ $city->translate?->name ?? $city->name ?? '' }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="edit_profile_form_inner">
                                            <label class="crancy__item-label mb-2">{{ __('translate.Cuisine') }} * </label>
                                            <select class="form-select crancy__item-input select2" name="cuisines[]" multiple>
                                                <option value="">{{ __('translate.Select Cuisine') }}</option>
                                                @foreach ($cuisines as $cuisine)
                                                    <option {{ $cuisine->id == old('cuisine') ? 'selected' : '' }} value="{{ $cuisine->id }}">{{ $cuisine->translate?->name ?? $cuisine->name ?? '' }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="contact_us_txt mt-2 ">
                                    <div class="create_new_btn_inline_box">
                                        <h4 class="crancy-product-card__title mb-3 mt-5">{{ __('translate.Contact, Address & Delivery Area') }}</h4>
                                    </div>
                                </div>


                                <div class="dashbord_edit_profile dashbord_edit_profile_two">
                                   <div class="row">
                                        <div class="col-md-6">
                                            <div class="edit_profile_form_inner">
                                                <label for="whatsapp" class="form-label  mb-2">{{__('translate.WhatsApp Phone *')}}</label>
                                                <input type="text" class="form-control" id="whatsapp"
                                                    name="whatsapp" value="{{ old('whatsapp') }}">
                                            </div>
                                            <div class="edit_profile_form_inner">
                                                <label for="plain_address" class="form-label  mb-2 mt-2">{{__('translate.Address *')}}</label>
                                                <input type="text" class="form-control" id="plain_address"
                                                    name="address" value="{{ old('address') }}">
                                            </div>

                                            <div class="edit_profile_form_inner d-none">
                                                <label for="latitude" class="form-label  mb-2 mt-2">{{__('translate.Latitude *')}}</label>
                                                <input type="text" class="form-control" id="latitude"
                                                    name="latitude" value="{{ old('latitude') }}" readonly>
                                            </div>

                                            <div class="edit_profile_form_inner d-none">
                                                <label for="longitude" class="form-label  mb-2 mt-2">{{__('translate.Longitude *')}}</label>
                                                <input type="text" class="form-control" id="longitude"
                                                    name="longitude" value="{{ old('longitude') }}" readonly>
                                            </div>

                                            <div class="edit_profile_form_inner">
                                                <label for="distance" class="form-label  mb-2 mt-2">{{__('translate.Maximum Delivery Distance (km) *')}}</label>
                                                <input type="text" class="form-control" id="distance"
                                                    name="max_delivery_distance" value="{{ old('max_delivery_distance') }}">
                                            </div>
                                        </div>

                                         <div class="col-md-6">
                                           <div class="b-b" >
                                             <label class="crancy__item-label mb-2">{{ __('translate.Your Location') }} * </label>
                                             <div class="position-relative w-100">
                                                 <input id="searchMapInput" class="form-control" type="text" placeholder="{{ __('translate.Search area, street, or estate...') }}" autocomplete="off" style="font-weight: 600;">
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
                                   </div>
                                </div>

                                <div class="contact_us_txt mt-2">
                                    <div class="create_new_btn_inline_box">
                                        <h4 class="crancy-product-card__title mb-3 mt-5">{{ __('translate.Restaurant Owner Information') }}</h4>
                                    </div>
                                </div>


                                <div class="dashbord_edit_profile dashbord_edit_profile_two">
                                   <div class="row">
                                        <div class="col-12">

                                            <div class="e-p-df" >
                                                <div class="edit_profile_form_inner">
                                                    <label for="ownerName" class="form-label  mb-2">{{__('translate.Name *')}}</label>
                                                    <input type="text" class="form-control" id="ownerName"
                                                        name="owner_name" value="{{ old('owner_name') }}">
                                                </div>
                                                <div class="edit_profile_form_inner">
                                                    <label for="ownerEmail" class="form-label  mb-2 mt-2">{{__('translate.Email *')}}</label>
                                                    <input type="email" class="form-control" id="ownerEmail"
                                                        name="owner_email" value="{{ old('owner_email') }}">
                                                </div>

                                                <div class="edit_profile_form_inner">
                                                    <label for="ownerPhone" class="form-label  mb-2 mt-2">{{__('translate.Phone *')}}</label>
                                                    <input type="text" class="form-control" id="ownerPhone"
                                                        name="owner_phone" value="{{ old('owner_phone') }}">
                                                </div>
                                            </div>


                                        </div>
                                   </div>
                                </div>

                                <div class="contact_us_txt mt-2">
                                    <div class="create_new_btn_inline_box">
                                        <h4 class="crancy-product-card__title mb-3 mt-5">{{ __('translate.Account Information') }}</h4>
                                    </div>
                                </div>


                                <div class="dashbord_edit_profile dashbord_edit_profile_two">
                                   <div class="row">
                                        <div class="col-12">

                                            <div class="e-p-df">
                                                <div class="edit_profile_form_inner">
                                                    <label for="name" class="form-label  mb-2">{{__('translate.Name *')}}</label>
                                                    <input type="text" class="form-control" id="name"
                                                        name="name" value="{{ old('name') }}">
                                                </div>
                                                <div class="edit_profile_form_inner">
                                                    <label for="email" class="form-label  mb-2 mt-2">{{__('translate.Email *')}}</label>
                                                    <input type="email" class="form-control" id="email"
                                                        name="email" value="{{ old('email') }}">
                                                </div>

                                                <div class="edit_profile_form_inner">
                                                    <label for="password" class="form-label mb-2 mt-2">{{__('translate.password *')}}</label>
                                                    <div class="position-relative">
                                                        <input type="password" class="form-control" id="password" name="password" required style="padding-right: 42px;">
                                                        <span class="toggle-password" style="position: absolute; right: 14px; top: 50%; transform: translateY(-50%); cursor: pointer; color: #94a3b8; font-size: 15px; z-index: 10;"><i class="fa-solid fa-eye-slash"></i></span>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                   </div>
                                </div>

                                <div class="contact_us_txt mt-2">
                                    <div class="create_new_btn_inline_box ">
                                        <h4 class="crancy-product-card__title mb-3 mt-5">{{ __('translate.Others Information') }}</h4>
                                    </div>
                                </div>


                                <div class="dashbord_edit_profile dashbord_edit_profile_two">
                                   <div class="row">
                                        <div class="col-md-6">

                                            <div class="edit_profile_form_inner">
                                                <label for="openHour" class="form-label">{{__('translate.Opening Hour *')}}</label>
                                                <input type="text" class="form-control clockpicker" id="openHour"
                                                    name="opening_hour" data-align="top" data-autoclose="true" autocomplete="off" value="{{ old('opening_hour') }}">
                                            </div>


                                            <div class="edit_profile_form_inner">
                                                <label for="minTime" class="form-label  mb-2 mt-2">{{__('translate.Minimum food processing time(minute) *')}}</label>
                                                <input type="text" class="form-control" id="minTime"
                                                    name="min_processing_time" value="{{ old('min_processing_time') }}">
                                            </div>

                                            <div class="edit_profile_form_inner">
                                                <label for="timeSlot" class="form-label  mb-2 mt-2">{{__('translate.Time slot separated(minute) *')}}</label>
                                                <input type="text" class="form-control" id="timeSlot"
                                                    name="time_slot_separate" value="{{ old('time_slot_separate') }}">
                                            </div>

                                        </div>

                                        <div class="col-md-6">

                                            <div class="edit_profile_form_inner">
                                                <label for="closeHour" class="form-label  mb-2 mt-2">{{__('translate.Closing Hour *')}}</label>
                                                <input type="text" class="form-control clockpicker" id="closeHour"
                                                    name="closing_hour" value="{{ old('closing_hour') }}"  data-align="top" data-autoclose="true" autocomplete="off">
                                            </div>

                                            <div class="edit_profile_form_inner">
                                                <label for="maxTime" class="form-label  mb-2 mt-2">{{__('translate.Maximum food processing time(minute) *')}}</label>
                                                <input type="text" class="form-control" id="maxTime"
                                                    name="max_processing_time" value="{{ old('max_processing_time') }}">
                                            </div>

                                            <div class="edit_profile_form_inner">
                                                <label for="tags" class="form-label  mb-2 mt-2">{{__('translate.Tags')}}</label>
                                                <input type="text" class="form-control tags" id="tags"
                                                    name="tags" value="{{ old('tags') }}">
                                            </div>
                                        </div>

                                        <div class=" col-12 col-lg-2 col-md-6 mt-4">

                                            <div class="crancy__item-form--group two mg-top-form-20">
                                                <div class="crancy-ptabs__notify-switch  crancy-ptabs__notify-switch--two">
                                                    <label class="crancy__item-switch">
                                                    <input {{ old('is_pickup_order') ? 'checked' : '' }} name="is_pickup_order" type="checkbox" >
                                                    <span class="crancy__item-switch--slide crancy__item-switch--round"></span>
                                                    </label>
                                                </div>
                                                <label class="crancy__item-label">{{__('translate.Pickup Order')}} </label>

                                            </div>

                                        </div>

                                        <div class=" col-12 col-md-6 col-lg-2 col  mt-0 mt-md-4">

                                            <div class="crancy__item-form--group two mg-top-form-20">
                                                <div class="crancy-ptabs__notify-switch  crancy-ptabs__notify-switch--two">
                                                    <label class="crancy__item-switch">
                                                    <input {{ old('is_delivery_order') ? 'checked' : '' }} name="is_delivery_order" type="checkbox" >
                                                    <span class="crancy__item-switch--slide crancy__item-switch--round"></span>
                                                    </label>
                                                </div>
                                                <label class="crancy__item-label">{{__('translate.Delivery Order')}} </label>

                                            </div>

                                        </div>

                                   </div>
                                </div>

                                <div class="edit_profile_form_btn mt-5">
                                    <button type="submit" class="thm-btn">{{__('translate.Save Data')}}</button>
                                </div>

                            </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- contuct part end -->

    </main>
@endsection

@push('style_section')

<link rel="stylesheet" href="{{ asset('global/select2/select2.min.css') }}">
<link rel="stylesheet" href="{{ asset('global/tagify/tagify.css') }}">
<link rel="stylesheet" href="{{ asset('global/clockpicker/bootstrap-clockpicker.css') }}">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />

    <style>
        #google_map_area {
            height: 400px;
            width: 100%;
            border-radius: 12px;
            margin-top: 12px;
            border: 1.5px solid #cbd5e1;
            z-index: 1;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        }

        .tox .tox-promotion,
        .tox-statusbar__branding{
            display: none !important;
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

        /* High-Contrast Autocomplete Dropdown */
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
            z-index: 10000050 !important;
            background: #ffffff !important;
            background-color: #ffffff !important;
            border: 2px solid #000000 !important;
            border-radius: 10px !important;
            box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.35), 0 8px 15px -6px rgba(0, 0, 0, 0.2) !important;
            max-height: 280px !important;
            overflow-y: auto !important;
            padding: 0 !important;
            display: none;
        }
        .nga-geo-item {
            padding: 10px 14px !important;
            cursor: pointer !important;
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            transition: all 0.15s ease !important;
            border-bottom: 1px solid #f1f5f9 !important;
            color: #000000 !important;
            background: #ffffff !important;
        }
        .nga-geo-item:hover, .nga-geo-item.active {
            background-color: #f1f5f9 !important;
            border-left: 4px solid #ea580c !important;
            padding-left: 14px !important;
        }
        .nga-geo-title {
            font-weight: 700 !important;
            color: #000000 !important;
            font-size: 14px !important;
            line-height: 1.35 !important;
            display: block !important;
        }
        .nga-geo-subtitle {
            font-size: 12.5px !important;
            color: #475569 !important;
            font-weight: 500 !important;
            line-height: 1.3 !important;
            margin-top: 2px !important;
            display: block !important;
        }
    </style>

@endpush

@push('js_section')

    <script src="{{ asset('global/select2/select2.min.js') }}"></script>
    <script src="{{ asset('global/tagify/tagify.js') }}"></script>
    <script src="{{ asset('global/clockpicker/bootstrap-clockpicker.js') }}"></script>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
    <script src="{{ asset('frontend/js/nigeria-geo-autocomplete.js') }}"></script>

    <script>
        (function($) {
            "use strict"
            $(document).ready(function () {
                $("#title").on("keyup",function(e){
                    let inputValue = $(this).val();
                    let slug = inputValue.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-');
                    $("#slug").val(slug);
                })

                $('.select2').select2();
                $('.tags').tagify();
                $('.clockpicker').clockpicker();

                $('.reset_btn').on('click', function(){
                    location.reload();
                })
            });
        })(jQuery);

        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function(){
                var output = document.getElementById('view_img');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        };

        function previewCoverImage(event) {
            var reader = new FileReader();
            reader.onload = function(){
                var output = document.getElementById('view_cover_img');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        };
    </script>

    <script>
        "use strict";

        document.addEventListener("DOMContentLoaded", function() {
            let defaultLat = parseFloat("{{ old('latitude', '7.4250') }}") || 7.4250;
            let defaultLng = parseFloat("{{ old('longitude', '3.9050') }}") || 3.9050;

            const foodigoPinIcon = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin"><i class="fa-solid fa-location-dot"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            const map = L.map('google_map_area', {
                center: [defaultLat, defaultLng],
                zoom: 14,
                zoomControl: true,
                attributionControl: false
            });

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19
            }).addTo(map);

            const marker = L.marker([defaultLat, defaultLng], {
                draggable: true,
                icon: foodigoPinIcon
            }).addTo(map);

            function updateLocation(lat, lng, addressText) {
                $('#latitude').val(lat);
                $('#longitude').val(lng);
                if (addressText) {
                    $('#plain_address').val(addressText);
                    $('#searchMapInput').val(addressText);
                    marker.bindPopup(`<b>${addressText}</b>`).openPopup();
                } else {
                    fetch(`/api/geocode/reverse?lat=${lat}&lng=${lng}`)
                        .then(res => res.json())
                        .then(data => {
                            if (data && data.address) {
                                $('#plain_address').val(data.address);
                                $('#searchMapInput').val(data.address);
                                marker.bindPopup(`<b>${data.address}</b>`).openPopup();
                            }
                        })
                        .catch(console.warn);
                }
            }

            // Draggable pin event
            marker.on('dragend', function(e) {
                const pos = e.target.getLatLng();
                updateLocation(pos.lat, pos.lng);
            });

            // Map click event
            map.on('click', function(e) {
                marker.setLatLng(e.latlng);
                updateLocation(e.latlng.lat, e.latlng.lng);
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
                            map.setView([lat, lng], 16);
                            marker.setLatLng([lat, lng]);
                            updateLocation(lat, lng);
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

            // Auto-detect GPS on first load if on default coordinates
            if (navigator.geolocation && defaultLat === 7.4250 && defaultLng === 3.9050 && !$('#latitude').val()) {
                navigator.geolocation.getCurrentPosition(function(pos) {
                    const lat = pos.coords.latitude;
                    const lng = pos.coords.longitude;
                    map.setView([lat, lng], 15);
                    marker.setLatLng([lat, lng]);
                    updateLocation(lat, lng);
                }, function() {});
            }

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
                                map.setView([top.lat, top.lng], 16);
                                marker.setLatLng([top.lat, top.lng]);
                                marker.bindPopup(`<b>${top.name}</b>`).openPopup();
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

            // NigeriaGeo Autocomplete Integration
            if (window.NigeriaGeo) {
                window.NigeriaGeo.attach('#searchMapInput', {
                    latField: '#latitude',
                    lngField: '#longitude',
                    plainAddressField: '#plain_address',
                    onSelect: function(item) {
                        map.setView([item.lat, item.lng], 16);
                        marker.setLatLng([item.lat, item.lng]);
                        updateLocation(item.lat, item.lng, item.name);
                    }
                });

                window.NigeriaGeo.attach('#plain_address', {
                    latField: '#latitude',
                    lngField: '#longitude',
                    plainAddressField: '#searchMapInput',
                    onSelect: function(item) {
                        map.setView([item.lat, item.lng], 16);
                        marker.setLatLng([item.lat, item.lng]);
                        updateLocation(item.lat, item.lng, item.name);
                    }
                });
            }

            setTimeout(() => { map.invalidateSize(); }, 300);
        });
    </script>
@endpush

