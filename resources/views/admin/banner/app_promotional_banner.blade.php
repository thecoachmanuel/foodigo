@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.App Promotional Banners') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.App Promotional Banners') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Banner') }} >> {{ __('translate.App Promotional Banners') }}</p>
@endsection

@section('body-content')
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <div class="crancy-dsinner">
                            <form action="{{ route('admin.app.promotional.banner.update') }}" method="POST" enctype="multipart/form-data">
                                @csrf

                                <div class="row">
                                    <div class="col-12 mg-top-30">
                                        <div class="crancy-product-card">
                                            <h4 class="crancy-product-card__title">{{ __('translate.App Exclusive Promotional Banners') }}</h4>
                                            <p style="color: #64748B; font-size: 13px; margin-bottom: 20px;">
                                                Manage the promotional banners exclusively shown inside the mobile app (Home screen). Changing these does not alter website homepage banners.
                                            </p>

                                            <div class="row">
                                                <!-- App Banner 1 -->
                                                <div class="col-md-6 mg-top-20">
                                                    <div class="crancy__item-form--group w-100">
                                                        <label class="form-label" style="font-weight: 600;">{{ __('translate.App Promotional Banner One') }}</label>
                                                        <div class="crancy-product-card__upload crancy-product-card__upload--border">
                                                            <input type="file" class="btn-check" name="app_promotional_banner_one" id="app_img1" autocomplete="off" onchange="previewAppImg1(event)">
                                                            <label class="crancy-image-video-upload__label" for="app_img1">
                                                                <img id="view_app_img1" src="{{ $banner_one ? asset($banner_one) : asset('uploads/website-images/placeholder.png') }}" style="max-height: 140px; object-fit: cover; border-radius: 8px;">
                                                                <h4 class="crancy-image-video-upload__title" style="margin-top: 8px;">{{ __('translate.Click here to') }} <span class="crancy-primary-color">{{ __('translate.Choose File') }}</span></h4>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="sign-up-from-inner mg-top-15">
                                                        <label class="form-label">{{ __('translate.Banner One Link / Action URL') }}</label>
                                                        <input type="text" class="form-control" name="app_promotional_banner_one_url" value="{{ $banner_one_url }}" placeholder="https://... or restaurant slug">
                                                    </div>
                                                </div>

                                                <!-- App Banner 2 -->
                                                <div class="col-md-6 mg-top-20">
                                                    <div class="crancy__item-form--group w-100">
                                                        <label class="form-label" style="font-weight: 600;">{{ __('translate.App Promotional Banner Two') }}</label>
                                                        <div class="crancy-product-card__upload crancy-product-card__upload--border">
                                                            <input type="file" class="btn-check" name="app_promotional_banner_two" id="app_img2" autocomplete="off" onchange="previewAppImg2(event)">
                                                            <label class="crancy-image-video-upload__label" for="app_img2">
                                                                <img id="view_app_img2" src="{{ $banner_two ? asset($banner_two) : asset('uploads/website-images/placeholder.png') }}" style="max-height: 140px; object-fit: cover; border-radius: 8px;">
                                                                <h4 class="crancy-image-video-upload__title" style="margin-top: 8px;">{{ __('translate.Click here to') }} <span class="crancy-primary-color">{{ __('translate.Choose File') }}</span></h4>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="sign-up-from-inner mg-top-15">
                                                        <label class="form-label">{{ __('translate.Banner Two Link / Action URL') }}</label>
                                                        <input type="text" class="form-control" name="app_promotional_banner_two_url" value="{{ $banner_two_url }}" placeholder="https://... or offer slug">
                                                    </div>
                                                </div>

                                                <div class="col-12 mg-top-30 text-end">
                                                    <button class="crancy-btn" type="submit">{{ __('translate.Update App Banners') }}</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js_section')
<script>
    function previewAppImg1(event){
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('view_app_img1');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }
    function previewAppImg2(event){
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('view_app_img2');
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
@endpush
