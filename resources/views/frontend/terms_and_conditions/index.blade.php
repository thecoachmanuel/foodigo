@extends('frontend.layouts.master')

@section('title')
    <title>{{ $seo_setting?->seo_title ?? 'Terms and Conditions | Nectar' }}</title>
    <meta name="title" content="{{ $seo_setting?->seo_title ?? 'Terms and Conditions | Nectar' }}" />
    <meta name="description" content="{!! strip_tags(clean($seo_setting?->seo_description ?? 'Read the Nectar Terms and Conditions for food ordering, delivery marketplace rules, user accounts, and customer policies.')) !!}" />
@endsection

@section('content')
    <main>
        <!-- banner-part start  -->

        <div class="profile_bg" style="background-image: url({{ asset($general_setting->breadcrumb_image) }})">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-12">
                        <ul class="breadcrumb">
                            <li><a href="{{route('home')}}">{{__('translate.Home')}}</a></li>
                            <li><a href="javascript:;">/</a></li>
                            <li><a href="javascript:;" class="active">{{__('translate.Terms and Conditions')}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- banner-part end -->

        <section class="privace_policy">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="privace_policy_main">
                            {!! clean($terms_and_conditions?->description ?? '') !!}
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>
@endsection
