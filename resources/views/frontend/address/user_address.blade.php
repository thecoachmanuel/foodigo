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
                                                        <a href="#" class="delet_btn" onclick="itemDeleteConfrimation({{ $address->id }})" href="javascript:;" data-bs-toggle="modal" data-bs-target="#exampleModal">
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

                                    <input id="searchMapInput" class="form-control" type="text"
                                           placeholder="{{ __('translate.Enter Nigerian area, estate, or street (e.g. Bodija, Ikeja, Lekki)...') }}">

                                    <div id="google_map_area" style="display: none;"></div>
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

        <!-- Delete Confirmation Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{{ __('translate.Delete Confirmation') }}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>{{ __('translate.Are you realy want to delete this item?') }}</p>
                    </div>
                    <div class="modal-footer">
                        <form action="" id="item_delect_confirmation" class="delet_modal_form" method="POST">
                            @csrf
                            @method('DELETE')

                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                            <button type="submit" class="btn btn-primary btn-type-dlt">{{ __('translate.Yes, Delete') }}</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </main>
@endsection

@push('style_section')
    <style>
        #google_map_area {
            display: none !important;
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

        function itemDeleteConfrimation(id){
            $("#item_delect_confirmation").attr("action",'<?php echo e(url("user/address-delete/")); ?>'+"/"+id)
        }

        $(document).ready(function() {
            if (window.NigeriaGeo) {
                window.NigeriaGeo.attach('#searchMapInput', {
                    latField: '#latitude, .latitude',
                    lngField: '#longitude, .longitude',
                    plainAddressField: '#plain_address',
                    onSelect: function(item) {
                        $('#plain_address').val(item.name);
                        $('#latitude').val(item.lat);
                        $('#longitude').val(item.lng);
                    }
                });

                window.NigeriaGeo.attach('#plain_address', {
                    latField: '#latitude, .latitude',
                    lngField: '#longitude, .longitude',
                    plainAddressField: '#searchMapInput',
                    onSelect: function(item) {
                        $('#latitude').val(item.lat);
                        $('#longitude').val(item.lng);
                    }
                });
            }
        });
    </script>
@endpush
