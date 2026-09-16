@extends('frontend.layouts.master')

@section('title')
    <title>{{ __('translate.Edit Profile') }}</title>
@endsection

@section('content')
    <main class="search_V1_bg" >
        <!-- banner-part start  -->

        <div class="profile_bg" style="background-image: url({{ asset($general_setting->breadcrumb_image) }})">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-12">
                        <ul class="breadcrumb">
                            <li><a href="{{route('home')}}">{{__('translate.Home')}}</a></li>
                            <li><a href="javascript:;">/</a></li>
                            <li><a href="javascript:;" class="active">{{__('translate.Dashboard')}}</a></li>
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
                    <div class=" col-lg-4 col-xxl-3 ">
                        @include('frontend.layouts.partials.dashboard_partials')
                    </div>

                    <div class="col-lg-8 col-xxl-9">

                        <div class="dashbord_edit_profile">
                            <div class="dashbord_taitel mb-2 ">
                                <h4>{{__('translate.Edit your profile')}}</h4>
                            </div>
                            <form class="edit_profile_form" action="{{route('user.update-profile')}}" method="post"
                                  enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="edit_profile_form_item">
                                    <div class="edit_profile_form_inner">
                                        <label for="profile_image_input" class="form-label">{{__('translate.Profile Photo')}}</label>
                                        <div class="d-flex align-items-center gap-3 mb-2">
                                            <div class="profile-preview-wrapper" style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden; border: 2px solid #FE5200; box-shadow: 0 4px 10px rgba(0,0,0,0.08); background: #f8f9fa;">
                                                <img id="user_profile_preview" src="{{ get_user_avatar($user) }}" onerror="this.onerror=null;this.src='{{ default_avatar_url() }}';" alt="avatar" style="width: 100%; height: 100%; object-fit: cover;">
                                            </div>
                                            <div class="flex-grow-1">
                                                <input type="file" class="form-control" id="profile_image_input" name="image" accept="image/*" onchange="previewUserProfile(event)">
                                                <small class="text-muted">{{ __('translate.Allowed formats: JPG, JPEG, PNG, WEBP') }}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="edit_profile_form_item">
                                    <div class="edit_profile_form_inner">
                                        <label for="exampleFormControlInput3" class="form-label">{{__('translate.Name')}}</label>
                                        <input type="text" class="form-control" value="{{html_decode($user->name)}}"
                                               id="exampleFormControlInput3" name="name">
                                    </div>
                                </div>

                                <div class="edit_profile_form_item">
                                    <div class="edit_profile_form_inner">
                                        <label for="exampleFormControlInput5" class="form-label">{{__('translate.Email Address')}}</label>
                                        <input type="email" class="form-control" id="exampleFormControlInput5"
                                               name="email"
                                              value="{{html_decode($user->email)}}">
                                    </div>
                                    <div class="edit_profile_form_inner">
                                        <label for="exampleFormControlInput6" class="form-label">{{__('translate.Phone Number')}}</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput6"
                                            name="phone" value="{{ html_decode($user->phone)}}">
                                    </div>
                                </div>

                                <div class="edit_profile_form_item">

                                    <div class="edit_profile_form_inner">
                                        <label for="exampleFormControlInput7" class="form-label">{{__('translate.Address')}}</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput7"
                                              name="address"
                                               value="{{html_decode($user->address)}}">
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
        </section>

        <!-- dashboard part end -->

    </main>
@endsection

@push('js_section')
<script>
    "use strict";
    function previewUserProfile(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('user_profile_preview');
            if (output) {
                output.src = reader.result;
            }
        };
        if (event.target.files && event.target.files[0]) {
            reader.readAsDataURL(event.target.files[0]);
        }
    }
</script>
@endpush

