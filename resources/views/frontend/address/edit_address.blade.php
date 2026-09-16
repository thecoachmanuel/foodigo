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

                                            <input id="searchMapInput" class="form-control" type="text"
                                                   placeholder="{{ __('translate.Enter Nigerian area, estate, or street (e.g. Bodija, Ikeja, Lekki)...') }}" value="{{ $address->address }}">

                                            <div id="google_map_area" style="display: none;"></div>
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
            display: none !important;
        }
    </style>
@endpush

@push('js_section')
    <script src="{{ asset('frontend/js/nigeria-geo-autocomplete.js') }}"></script>

    <script>
        "use strict";

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
