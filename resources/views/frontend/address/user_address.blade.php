@extends('frontend.layouts.master')

@section('title')
    <title>{{__('translate.Address')}}</title>
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

                    <div class="col-lg-8  col-xxl-9 ">

                        <div class="row change_password ">
                            <div class="col-lg-12">
                                <div class="row ">
                                    <div class="col-lg-6 col-xxl-6">

                                        <div class="dashbord_taitel">
                                            <h4>{{__('translate.Address')}}</h4>
                                            <p>{{__('translate.Check your address')}}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-xxl-6">

                                        <div class="dashbord_add_btn">
                                            <a href="#" class="thm-btn" data-bs-toggle="modal" data-bs-target="#exampleModal7">
                                                <span>
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M17 11C17 13.7614 14.7614 16 12 16C9.23858 16 7 13.7614 7 11C7 8.23858 9.23858 6 12 6C14.7614 6 17 8.23858 17 11Z"
                                                            stroke="#28303F" stroke-width="1.5"/>
                                                        <path
                                                            d="M21 10.8889C21 15.7981 15.375 22 12 22C8.625 22 3 15.7981 3 10.8889C3 5.97969 7.02944 2 12 2C16.9706 2 21 5.97969 21 10.8889Z"
                                                            stroke="#28303F" stroke-width="1.5"/>
                                                        <path d="M12 9V13" stroke="#28303F" stroke-width="1.5"
                                                              stroke-linecap="round"/>
                                                        <path d="M14 11L10 11" stroke="#28303F" stroke-width="1.5"
                                                              stroke-linecap="round"/>
                                                    </svg>
                                                </span>

                                                {{__('translate.Add Address')}}
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt_30px">
                                    @foreach($addresses as $key => $address)
                                        <div class="col-sm-6 col-xxl-6 mb-4">
                                            <div class="dashboard_address_item">
                                                <div class="dashboard_address_txt">
                                                    <h5>{{ __('translate.Address') }}  # {{ $key + 1 }} </h5>

                                                    <div class="dashboard_address_btn">
                                                        <a class="copy_btn"  href="{{ route('user.address-edit', ['id' => $address->id]) }}">
                                                        <span>
                                                            <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <rect x="0.5" y="0.5" width="35" height="35" rx="7.5"
                                                                      stroke="#000929" stroke-opacity="0.1"/>
                                                                <g clip-path="url(#clip0_381_50693)">
                                                                    <path
                                                                        d="M24.813 16C25.122 16 25.414 15.857 25.603 15.613C25.792 15.369 25.858 15.051 25.782 14.752C25.471 13.535 24.837 12.423 23.949 11.535L20.464 8.05C19.142 6.728 17.384 6 15.514 6H10.999C8.243 6 6 8.243 6 11V25C6 27.757 8.243 30 11 30H14C14.552 30 15 29.552 15 29C15 28.448 14.552 28 14 28H11C9.346 28 8 26.654 8 25V11C8 9.346 9.346 8 11 8H15.515C15.678 8 15.84 8.008 16 8.023V13C16 14.654 17.346 16 19 16H24.813ZM18 13V8.659C18.379 8.877 18.732 9.147 19.05 9.465L22.535 12.95C22.849 13.264 23.118 13.618 23.338 14H19C18.449 14 18 13.551 18 13ZM29.122 17.879C27.988 16.745 26.012 16.745 24.879 17.879L18.172 24.586C17.417 25.341 17 26.346 17 27.415V29.001C17 29.553 17.448 30.001 18 30.001H19.586C20.655 30.001 21.659 29.584 22.414 28.829L29.121 22.122C29.688 21.555 30 20.802 30 20C30 19.198 29.688 18.445 29.122 17.879ZM27.707 20.707L20.999 27.414C20.622 27.792 20.12 28 19.585 28H18.999V27.414C18.999 26.88 19.207 26.378 19.585 26L26.293 19.293C26.67 18.915 27.329 18.915 27.707 19.293C27.896 19.481 28 19.732 28 20C28 20.268 27.896 20.518 27.707 20.707Z"
                                                                        fill="#000929"/>
                                                                </g>
                                                            </svg>
                                                        </span>
                                                        </a>
                                                        <a href="javascript:;" class="delet_btn" onclick="itemDeleteConfirmation({{ $address->id }})" data-bs-toggle="modal" data-bs-target="#deleteAddressModal">
                                                        <span>
                                                            <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <rect x="0.5" y="0.5" width="35" height="35" rx="7.5"
                                                                      stroke="#E94222" stroke-opacity="0.1"/>
                                                                <path
                                                                    d="M11 14V24C11 26.2091 12.7909 28 15 28H21C23.2091 28 25 26.2091 25 24V14M20 17V23M16 17L16 23M22 11L20.5937 8.8906C20.2228 8.3342 19.5983 8 18.9296 8H17.0704C16.4017 8 15.7772 8.3342 15.4063 8.8906L14 11M22 11H14M22 11H27M14 11H9"
                                                                    stroke="#E94222" stroke-width="1.5" stroke-linecap="round"
                                                                    stroke-linejoin="round"/>
                                                            </svg>

                                                        </span>
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="dashboard_address_inner">
                                                    <ul class="address">
                                                        <li><a href="javascript:;">{{__('translate.Name')}} : <span> {{$address->name}}</span></a></li>
                                                        <li><a href="mailto:{{$address->email}}">{{__('translate.Email')}} :
                                                                <span>{{$address->email}}</span> </a></li>
                                                        <li><a href="tel:{{$address->phone}}">{{__('translate.Phone')}} : <span> {{$address->phone}}</span></a>
                                                        </li>
                                                        </li>
                                                        <li><a href="javascript:;">{{__('translate.Delivery Type')}} : <span>{{$address->delivery_type}}</span>
                                                            </a>
                                                        <li><a href="javascript:;">{{__('translate.Address')}} : <span>{{$address->address}}</span> </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </section>

        <!-- Modal -->
        <div class="modal profile_location_modal  address_modal fade " id="exampleModal7" tabindex="-1"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{{__('translate.Add new address')}} </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="address_form_main" method="post" action="{{route('user.address-store')}}">
                            @csrf
                            <div class="address_form_item">
                                <div class="address_form_inner">
                                    <label for="name" class="form-label">{{__('translate.Name')}}</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           value="{{ auth()->user()?->name }}"
                                           placeholder="{{__('translate.Name')}}">
                                </div>
                            </div>

                            <div class="address_form_item">
                                <div class="address_form_inner">
                                    <label for="email" class="form-label">{{__('translate.Email Address')}}</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           value="{{ auth()->user()?->email }}"
                                           placeholder="{{__('translate.Email Address')}}">
                                </div>
                                <div class="address_form_inner">
                                    <label for="phone" class="form-label">{{__('translate.Phone Number')}}</label>
                                    <input type="text" class="form-control" id="phone" name="phone"
                                           value="{{ auth()->user()?->phone }}"
                                           placeholder="{{__('translate.Phone Number')}}">
                                </div>
                            </div>

                            <div class="address_form_item">
                                <div class="address_form_inner">
                                    <label class="crancy__item-label mb-2">{{ __('translate.Your Location') }} * </label>

                                    <div class="position-relative w-100">
                                        <input id="searchMapInput" class="form-control" type="text"
                                               placeholder="{{ __('translate.Search area, street, or estate...') }}" autocomplete="off" style="font-weight: 600;">
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
                                    <label for="exampleFormControlInput1" class="form-label">{{__('translate.Address')}}</label>
                                    <input type="text" class="form-control" name="address" id="plain_address" value="{{ old('address') }}">
                                </div>
                            </div>

                            <div class="address_form_item d-none">
                                <div class="address_form_inner">
                                    <label for="exampleFormControlInput1" class="form-label">{{__('translate.Latitude')}}</label>
                                    <input class="form-control latitude" type="text" name="latitude" id="latitude" value="{{ old('latitude') }}" readonly>
                                </div>
                            </div>

                            <div class="address_form_item d-none">
                                <div class="address_form_inner">
                                    <label for="exampleFormControlInput1" class="form-label">{{__('translate.Longitude')}}</label>
                                    <input class="form-control longitude" type="text" name="longitude" id="longitude" value="{{ old('longitude') }}" readonly>
                                </div>
                            </div>

                            <div class="address_form_item">
                                <div class="address_form_inner">
                                    <label for="exampleFormControlInput1" class="form-label">{{__('translate.Delivery Type')}}</label>
                                    <select class="form-select" aria-label="Default select example"
                                            name="delivery_type">
                                        <option value="home">{{__('translate.Home')}}</option>
                                        <option value="office">{{__('translate.Office')}}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="address_form_item_btn">
                                <button type="submit" class="thm-btn">{{__('translate.Save')}}</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Brand-Styled Delete Confirmation Modal -->
        <div class="modal fade brand_delete_modal" id="deleteAddressModal" tabindex="-1" aria-labelledby="deleteAddressModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <button type="button" class="btn-close brand_modal_close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="modal-body text-center p-4 pt-5">
                        <div class="delete_icon_wrapper">
                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#E94222" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                <line x1="10" y1="11" x2="10" y2="17"></line>
                                <line x1="14" y1="11" x2="14" y2="17"></line>
                            </svg>
                        </div>
                        <h4 class="brand_modal_title mt-3 mb-2">{{ __('translate.Delete Address') }}</h4>
                        <p class="brand_modal_text mb-1">{{ __('translate.Do you realy want to delete this item?') }}</p>
                        <small class="brand_modal_subtext text-muted">{{ __('translate.This action cannot be undone.') }}</small>
                        <form action="" id="address_delete_form" method="POST" class="mt-4">
                            @csrf
                            @method('DELETE')
                            <div class="d-flex justify-content-center gap-3">
                                <button type="button" class="btn btn_cancel_brand" data-bs-dismiss="modal">{{ __('translate.Cancel') }}</button>
                                <button type="submit" class="btn btn_delete_brand">{{ __('translate.Yes, Delete') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </main>
@endsection

@push('style_section')
    <style>
        /* Brand Styled Delete Modal */
        .brand_delete_modal .modal-content {
            border: none !important;
            border-radius: 20px !important;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.18) !important;
            overflow: hidden !important;
            background: #ffffff !important;
            position: relative !important;
        }
        .brand_delete_modal .brand_modal_close {
            position: absolute !important;
            top: 18px !important;
            right: 18px !important;
            z-index: 10 !important;
            opacity: 0.6 !important;
            transition: opacity 0.2s ease !important;
        }
        .brand_delete_modal .brand_modal_close:hover {
            opacity: 1 !important;
        }
        .brand_delete_modal .delete_icon_wrapper {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: #FFF1F0;
            border: 6px solid #FFE4E1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            transition: transform 0.2s ease;
        }
        .brand_delete_modal .delete_icon_wrapper:hover {
            transform: scale(1.06);
        }
        .brand_delete_modal .brand_modal_title {
            font-size: 22px;
            font-weight: 700;
            color: #0F172A;
        }
        .brand_delete_modal .brand_modal_text {
            font-size: 15px;
            color: #475569;
            line-height: 1.5;
        }
        .brand_delete_modal .brand_modal_subtext {
            font-size: 13px;
            color: #94A3B8;
        }
        .brand_delete_modal .btn_cancel_brand {
            padding: 11px 24px;
            border-radius: 10px;
            background: #F1F5F9;
            color: #475569;
            font-weight: 600;
            font-size: 14.5px;
            border: 1px solid #E2E8F0;
            transition: all 0.2s ease;
            min-width: 110px;
        }
        .brand_delete_modal .btn_cancel_brand:hover {
            background: #E2E8F0;
            color: #1E293B;
        }
        .brand_delete_modal .btn_delete_brand {
            padding: 11px 26px;
            border-radius: 10px;
            background: #E94222;
            color: #FFFFFF;
            font-weight: 600;
            font-size: 14.5px;
            border: 1px solid #E94222;
            box-shadow: 0 4px 14px rgba(233, 66, 34, 0.35);
            transition: all 0.2s ease;
            min-width: 120px;
        }
        .brand_delete_modal .btn_delete_brand:hover {
            background: #D83618;
            border-color: #D83618;
            color: #FFFFFF;
            box-shadow: 0 6px 18px rgba(233, 66, 34, 0.45);
            transform: translateY(-1px);
        }

        #google_map_area {
            height: 260px;
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

        function itemDeleteConfirmation(id){
            $("#address_delete_form").attr("action", '<?php echo e(url("user/address-delete")); ?>' + "/" + id);
        }
        function itemDeleteConfrimation(id){
            itemDeleteConfirmation(id);
        }

        $(document).ready(function() {
            let addrMap = null;
            let addrMarker = null;
            let defaultLat = parseFloat("{{ session('latitude', '7.4250') }}") || 7.4250;
            let defaultLng = parseFloat("{{ session('longitude', '3.9050') }}") || 3.9050;

            const foodigoPinIcon = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin"><i class="fa-solid fa-location-dot"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            function initAddressMap() {
                const mapEl = document.getElementById('google_map_area');
                if (!mapEl || addrMap) return;

                addrMap = L.map('google_map_area', {
                    center: [defaultLat, defaultLng],
                    zoom: 14,
                    zoomControl: true
                });

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom: 19,
                    attribution: '&copy; OpenStreetMap contributors'
                }).addTo(addrMap);

                addrMarker = L.marker([defaultLat, defaultLng], {
                    draggable: true,
                    icon: foodigoPinIcon
                }).addTo(addrMap);

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
            }

            $('#exampleModal').on('shown.bs.modal', function () {
                if (!addrMap) {
                    initAddressMap();
                }
                setTimeout(() => {
                    if (addrMap) addrMap.invalidateSize();
                }, 150);
            });

            // Locate Me GPS Button Handler
            $('#btn_detect_gps').on('click', function() {
                if (!addrMap) initAddressMap();
                const $text = $('#btn_gps_text');
                $text.text("{{ __('translate.Locating...') }}");

                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(
                        function(pos) {
                            const lat = pos.coords.latitude;
                            const lng = pos.coords.longitude;
                            if (addrMap && addrMarker) {
                                addrMap.setView([lat, lng], 16);
                                addrMarker.setLatLng([lat, lng]);
                            }
                            $('#latitude').val(lat);
                            $('#longitude').val(lng);
                            fetch(`/api/geocode/reverse?lat=${lat}&lng=${lng}`)
                                .then(res => res.json())
                                .then(data => {
                                    if (data && data.address) {
                                        $('#plain_address').val(data.address);
                                        $('#searchMapInput').val(data.address);
                                        if (addrMarker) addrMarker.bindPopup(`<b>${data.address}</b>`).openPopup();
                                    }
                                })
                                .catch(console.warn);

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
                                if (addrMap && addrMarker) {
                                    addrMap.setView([top.lat, top.lng], 16);
                                    addrMarker.setLatLng([top.lat, top.lng]);
                                    addrMarker.bindPopup(`<b>${top.name}</b>`).openPopup();
                                }
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
                        if (addrMap && addrMarker) {
                            addrMap.setView([item.lat, item.lng], 16);
                            addrMarker.setLatLng([item.lat, item.lng]);
                            addrMarker.bindPopup(`<b>${item.name}</b>`).openPopup();
                        }
                    }
                });

                window.NigeriaGeo.attach('#plain_address', {
                    latField: '#latitude, .latitude',
                    lngField: '#longitude, .longitude',
                    plainAddressField: '#searchMapInput',
                    onSelect: function(item) {
                        $('#latitude').val(item.lat);
                        $('#longitude').val(item.lng);
                        if (addrMap && addrMarker) {
                            addrMap.setView([item.lat, item.lng], 16);
                            addrMarker.setLatLng([item.lat, item.lng]);
                            addrMarker.bindPopup(`<b>${item.name}</b>`).openPopup();
                        }
                    }
                });
            }
        });
    </script>
@endpush
