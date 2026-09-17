@extends('admin.master_layout')
@section('title')
<title>{{ __('translate.Dashboard') }}</title>
@endsection
@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Dashboard') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Dashboard') }} >> {{ __('translate.Dashboard') }}</p>
@endsection
@push('style_section')
    <link rel="stylesheet" href="{{ asset('backend/css/charts.min.css') }}">
@endpush
@section('body-content')
    <!-- crancy Dashboard -->
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <!-- Dashboard Inner -->
                        <div class="crancy-dsinner">
                            <div class="row">
                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Active Orders') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ $active_orders }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M13.4167 9.33331H23.562C24.291 9.33331 24.6554 9.33331 24.9223 9.45096C26.1026 9.97136 25.5749 11.2825 25.3763 12.2248C25.3385 12.4037 25.222 12.5126 25.0834 12.6015M8.75004 9.33331H4.43801C3.70913 9.33331 3.34469 9.33331 3.07785 9.45096C1.89751 9.97136 2.42524 11.2825 2.62381 12.2248C2.65948 12.3941 2.7755 12.5381 2.93819 12.6154C3.6129 12.9355 4.08544 13.5428 4.20946 14.2489L4.90081 18.1857C5.20499 19.9179 5.30898 22.3932 6.82691 23.6135C7.94061 24.5 9.54527 24.5 12.7546 24.5H14" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                        <path d="M20.4157 15.1667C18.9383 15.1667 17.9803 16.1089 16.8473 16.4524C16.3865 16.592 16.1562 16.6618 16.063 16.7602C15.9698 16.8586 15.9425 17.0024 15.8879 17.2901C15.3036 20.3682 16.5807 23.2139 19.6259 24.3215C19.9532 24.4405 20.1167 24.5 20.4174 24.5C20.718 24.5 20.8817 24.4405 21.2088 24.3215C24.254 23.2139 25.5297 20.3682 24.9453 17.2901C24.8907 17.0024 24.8633 16.8586 24.7701 16.7601C24.6769 16.6617 24.4466 16.5919 23.9859 16.4524C22.8524 16.109 21.8933 15.1667 20.4157 15.1667Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M7.58337 12.8333L11.6667 3.5M17.5 3.5L20.4167 9.33333" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Pending Orders') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ $pending_orders }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M13.4167 9.33331H23.562C24.291 9.33331 24.6554 9.33331 24.9223 9.45096C26.1026 9.97136 25.5749 11.2825 25.3763 12.2248C25.3406 12.3941 25.2245 12.5381 25.0619 12.6154C24.3872 12.9355 23.9146 13.5428 23.7906 14.2489L23.0992 18.1857C22.7951 19.9179 22.6911 22.3933 21.1732 23.6135C20.0595 24.5 18.4548 24.5 15.2455 24.5H12.7546C9.54527 24.5 7.94061 24.5 6.82691 23.6135C5.30898 22.3932 5.20499 19.9179 4.90081 18.1857L4.20946 14.2489C4.08544 13.5428 3.6129 12.9355 2.93819 12.6154C2.7755 12.5381 2.65948 12.3941 2.62381 12.2248C2.42524 11.2825 1.89751 9.97136 3.07785 9.45096C3.34469 9.33331 3.70913 9.33331 4.43801 9.33331H8.75004" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                        <path d="M16.3333 14H11.6666" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M7.58337 12.8333L11.6667 3.5M17.5 3.5L20.4167 9.33333" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Completed Orders') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ $complete_orders }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M13.4167 9.33331H23.562C24.291 9.33331 24.6554 9.33331 24.9223 9.45096C26.1026 9.97136 25.5749 11.2825 25.3763 12.2248C25.3406 12.3941 25.2245 12.5381 25.0619 12.6154C24.4354 12.9126 24.0782 13.4066 23.8776 14M8.75004 9.33331H4.43801C3.70913 9.33331 3.34469 9.33331 3.07785 9.45096C1.89751 9.97136 2.42524 11.2825 2.62381 12.2248C2.65948 12.3941 2.7755 12.5381 2.93819 12.6154C3.6129 12.9355 4.08544 13.5428 4.20946 14.2489L4.90081 18.1857C5.20499 19.9179 5.30898 22.3932 6.82691 23.6135C7.94061 24.5 9.54527 24.5 12.7546 24.5H13.4167" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                        <path d="M16.3334 22.1667C16.3334 22.1667 17.5 22.1667 18.6667 24.5C18.6667 24.5 22.3726 18.6667 25.6667 17.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M7.58337 12.8333L11.6667 3.5M17.5 3.5L20.4167 9.33333" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Cancel Orders') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ $cancel_orders }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M15.1666 24.5H12.7545C9.54514 24.5 7.94049 24.5 6.82679 23.6135C5.30886 22.3932 5.20486 19.9179 4.90069 18.1857L4.20934 14.2489C4.08532 13.5428 3.61277 12.9355 2.93807 12.6154C2.77537 12.5381 2.65936 12.3941 2.62368 12.2248C2.42512 11.2825 1.89739 9.97136 3.07773 9.45096C3.34457 9.33331 3.70901 9.33331 4.43789 9.33331H8.74992M13.4166 9.33331H23.5619C24.2909 9.33331 24.6553 9.33331 24.9221 9.45096C26.1025 9.97136 25.5748 11.2825 25.3762 12.2248C25.3405 12.3941 25.2244 12.5381 25.0618 12.6154C24.1989 13.0249 23.9118 13.7582 23.7379 14.5833" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                        <path d="M18.6667 17.5L22.1667 21M22.1667 21L25.6667 24.5M22.1667 21L18.6667 24.5M22.1667 21L25.6667 17.5" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                        <path d="M7.58325 12.8333L11.6666 3.5M17.4999 3.5L20.4166 9.33333" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Total Earnings') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_earning) }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M16.3333 14.875C16.3333 13.7475 15.2886 12.8334 14 12.8334C12.7113 12.8334 11.6666 13.7475 11.6666 14.875C11.6666 16.0026 12.7113 16.9167 14 16.9167C15.2886 16.9167 16.3333 17.8308 16.3333 18.9584C16.3333 20.086 15.2886 21 14 21C12.7113 21 11.6666 20.086 11.6666 18.9584" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
                                                        <path d="M14 11.0834V12.8334" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14 21V22.75" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M6.79916 12.2693C7.61585 9.81921 9.90868 8.16663 12.4913 8.16663H15.5088C18.0914 8.16663 20.3842 9.81921 21.2009 12.2693L23.0343 17.7693C24.3293 21.6544 21.4375 25.6666 17.3422 25.6666H10.6579C6.56259 25.6666 3.67077 21.6544 4.96583 17.7693L6.79916 12.2693Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                                        <path d="M16.4336 8.16671L11.5665 8.16671L9.93191 6.29182C8.32956 4.45394 10.1989 1.70685 12.5383 2.46153L13.6207 2.81071C13.8671 2.8902 14.133 2.8902 14.3794 2.81071L15.4618 2.46153C17.8012 1.70685 19.6705 4.45394 18.0682 6.29183L16.4336 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Pending Balance') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_pending) }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M15.9545 25.6666H12.0452C7.26726 25.6666 3.89347 20.9857 5.40438 16.453L6.57105 12.953C7.52384 10.0946 10.1988 8.16663 13.2118 8.16663H14.7879C17.8009 8.16663 20.4758 10.0946 21.4286 12.953L22.5554 16.3333" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M16.4336 8.16671L11.5665 8.16671L9.93191 6.29182C8.32956 4.45394 10.1989 1.70685 12.5383 2.46153L13.6207 2.81071C13.8671 2.8902 14.133 2.8902 14.3794 2.81071L15.4618 2.46153C17.8012 1.70685 19.6705 4.45394 18.0682 6.29183L16.4336 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                                        <rect x="23.0742" y="19.7036" width="2.20376" height="6.61129" rx="1.10188" transform="rotate(90 23.0742 19.7036)" stroke="currentColor" stroke-width="1.25"/>
                                                        <rect x="20.8704" y="17.5" width="2.20376" height="6.61129" rx="1.10188" transform="rotate(90 20.8704 17.5)" stroke="currentColor" stroke-width="1.25"/>
                                                        <rect x="21.4214" y="21.9072" width="2.20376" height="6.61129" rx="1.10188" transform="rotate(90 21.4214 21.9072)" stroke="currentColor" stroke-width="1.25"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Total Withdraw') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_withdraw) }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M19.8333 16.3334L14 22.1667L8.16666 16.3334" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14 5.83337V22.1667" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M4.66666 24.5H23.3333" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-3 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Admin Income') }}</h4>
                                                    </div>
                                                </div>
                                                <div class="crancy-ecom-card__content">
                                                    <div class="crancy-ecom-card__camount">
                                                        <div class="crancy-ecom-card__camount__inside">
                                                            <h3 class="crancy-ecom-card__amount">{{ currency($admin_income) }}</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span>
                                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M16.3333 14.875C16.3333 13.7475 15.2886 12.8334 14 12.8334C12.7113 12.8334 11.6666 13.7475 11.6666 14.875C11.6666 16.0026 12.7113 16.9167 14 16.9167C15.2886 16.9167 16.3333 17.8308 16.3333 18.9584C16.3333 20.086 15.2886 21 14 21C12.7113 21 11.6666 20.086 11.6666 18.9584" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
                                                        <path d="M14 11.0834V12.8334" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14 21V22.75" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M6.79916 12.2693C7.61585 9.81921 9.90868 8.16663 12.4913 8.16663H15.5088C18.0914 8.16663 20.3842 9.81921 21.2009 12.2693L23.0343 17.7693C24.3293 21.6544 21.4375 25.6666 17.3422 25.6666H10.6579C6.56259 25.6666 3.67077 21.6544 4.96583 17.7693L6.79916 12.2693Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                                        <path d="M16.4336 8.16671L11.5665 8.16671L9.93191 6.29182C8.32956 4.45394 10.1989 1.70685 12.5383 2.46153L13.6207 2.81071C13.8671 2.8902 14.133 2.8902 14.3794 2.81071L15.4618 2.46153C17.8012 1.70685 19.6705 4.45394 18.0682 6.29183L16.4336 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>
                            </div>

                            <div class="row crancy-gap-30">
                                <div class="col-12">
                                    <!-- Charts One -->
                                    <div class="charts-main charts-home-one mg-top-30">
                                        <!-- Top Heading -->
                                        <div class="charts-main__heading  mg-btm-20">
                                            <h4 class="charts-main__title">{{ __('translate.Order Statitics') }}</h4>

                                        </div>
                                        <div class="charts-main__one">
                                            <div class="tab-content" id="nav-tabContent">
                                                <div class="tab-pane fade show active" id="crancy-chart__s1" role="tabpanel" aria-labelledby="crancy-chart__s1">
                                                    <div class="crancy-chart__inside crancy-chart__three" style="position: relative; height: 350px; width: 100%;">
                                                        <!-- Chart One -->
                                                        <canvas id="myChart_recent_statics"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Charts One -->
                                </div>
                            </div>

                            <div class="crancy-table crancy-table--v3 mg-top-30">

                                <div class="crancy-customer-filter">
                                    <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between create_new_btn_box">
                                        <div class="crancy-header__form crancy-header__form--customer create_new_btn_inline_box">
                                            <h4 class="crancy-product-card__title">{{ __('translate.Latest Order') }}</h4>
                                        </div>
                                    </div>
                                </div>

                                <!-- crancy Table -->
                                <div id="crancy-table__main_wrapper" class="dt-bootstrap5 no-footer">

                                    <table class="crancy-table__main crancy-table__main-v3 dataTable no-footer" id="dataTable">
                                        <!-- crancy Table Head -->
                                        <thead class="crancy-table__head">
                                        <tr>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Order Id') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Customer') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Date') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Amount') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Order Status') }}
                                            </th>

                                            <th class="crancy-table__column-3 crancy-table__h3 sorting">
                                                {{ __('translate.Action') }}
                                            </th>




                                        </tr>
                                        </thead>
                                        <!-- crancy Table Body -->
                                        <tbody class="crancy-table__body">
                                            @foreach ($orders as $index => $order)

                                            <tr class="odd">

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ ++$index }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ $order->user->name }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{$order->created_at->format('F j, Y') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">
                                                        <p>{{ currency($order->grand_total) }}</p>
                                                        @if($order->payment_status == 'success')
                                                            <strong class="text-success">
                                                                {{ __('translate.Paid') }}
                                                            </strong>
                                                        @else
                                                            <strong class="text-danger">
                                                                {{__('translate.Unpaid')}}
                                                            </strong>
                                                        @endif
                                                    </h4>
                                                </td>
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">
                                                        <span class="mb-1">

                                                        @if($order->order_status == 1)
                                                            {{__('translate.State')}} : <span class="tag denger">{{__('translate.Pending')}}</span>
                                                        @elseif($order->order_status == 2)
                                                            {{__('translate.State')}} : <span
                                                                class="tag">{{__('translate.Confirmed')}}</span>
                                                        @elseif($order->order_status == 3)
                                                            {{__('translate.State')}} : <span
                                                                class="tag">{{__('translate.Processing')}}</span>
                                                        @elseif($order->order_status == 4)
                                                            {{__('translate.State')}} : <span
                                                                class="tag">{{__('translate.Food on the way')}}</span>
                                                        @elseif($order->order_status == 5)
                                                            {{__('translate.State')}} : <span
                                                                class="tag">{{__('translate.Delivered')}}</span>
                                                        @elseif($order->order_status == 6)
                                                            {{__('translate.State')}} : <span
                                                                class="tag">{{__('translate.Canceled')}}</span>
                                                        @endif
                                                        </span>
                                                    </h4>
                                                    <div class="text-capitalize opacity-7">
                                                        <span>{{__('translate.Type')}}:</span>
                                                        <span class="text-success">{{$order->order_type}}</span>
                                                    </div>
                                                </td>


                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <a href="{{route('admin.order.details', ['id' => $order->id])}}" class="crancy-btn"><i class="fas fa-eye"></i> {{ __('translate.View') }}</a>
                                                </td>
                                            </tr>
                                        @endforeach

                                        </tbody>
                                        <!-- End crancy Table Body -->
                                    </table>

                                </div>
                                <!-- End crancy Table -->
                            </div>



                        </div>
                        <!-- End Dashboard Inner -->
                    </div>
                </div>


            </div>


        </div>
    </section>
    <!-- End crancy Dashboard -->

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

@endsection
@push('js_section')
    <script src="{{ asset('backend/js/charts.js') }}"></script>

    <script>
        "use strict";

        @php
            $currency_icon = session()->get('currency_icon') ?? \Modules\Currency\App\Models\Currency::where('is_default', 'yes')->value('currency_icon') ?? '₦';
        @endphp

        let purchase_data = @json($data);
		purchase_data = JSON.parse(purchase_data);

        let date_lable = @json($lable);
		date_lable = JSON.parse(date_lable);

        const currencyIcon = @json($currency_icon);

        // Chart Three
        const canvas_myChart = document.getElementById('myChart_recent_statics');
        const ctx_myChart_recent_statics = canvas_myChart.getContext('2d');
        const gradientBgs = ctx_myChart_recent_statics.createLinearGradient(0, 0, 0, 320);

        gradientBgs.addColorStop(0, 'rgba(255, 107, 53, 0.25)');
        gradientBgs.addColorStop(1, 'rgba(255, 107, 53, 0.01)');

        const myChart_recent_statics = new Chart(ctx_myChart_recent_statics, {
            type: 'line',

            data: {
                labels: date_lable,
                datasets: [{
                    label: "{{ __('translate.Order Amount') }}",
                    data: purchase_data,
                    backgroundColor: gradientBgs,
                    borderColor: '#ff6b35',
                    borderWidth: 2.5,
                    fill: true,
                    tension: 0.35,
                    pointBackgroundColor: '#ffffff',
                    pointBorderColor: '#ff6b35',
                    pointBorderWidth: 2,
                    pointRadius: 4,
                    pointHoverRadius: 7,
                    pointHoverBackgroundColor: '#ff6b35',
                    pointHoverBorderColor: '#ffffff',
                    pointHoverBorderWidth: 2,
                }]
            },

            options: {
                maintainAspectRatio: false,
                responsive: true,
                interaction: {
                    intersect: false,
                    mode: 'index',
                },
                scales: {
                    x: {
                        ticks: {
                            color: '#64748b',
                            font: {
                                size: 12,
                                family: "'Plus Jakarta Sans', sans-serif"
                            },
                            maxRotation: 45,
                            minRotation: 0,
                            autoSkip: true,
                            maxTicksLimit: 14
                        },
                        grid: {
                            display: false,
                            drawBorder: false,
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: '#64748b',
                            font: {
                                size: 12,
                                family: "'Plus Jakarta Sans', sans-serif"
                            },
                            callback: function(value) {
                                if (value >= 1000000) {
                                    return currencyIcon + (value / 1000000).toFixed(1) + 'M';
                                } else if (value >= 1000) {
                                    return currencyIcon + (value / 1000).toFixed(0) + 'k';
                                }
                                return currencyIcon + Number(value).toLocaleString();
                            }
                        },
                        grid: {
                            drawBorder: false,
                            color: '#f1f5f9',
                            borderDash: [4, 4]
                        },
                    },
                },
                plugins: {
                    tooltip: {
                        padding: 12,
                        displayColors: false,
                        backgroundColor: '#0f172a',
                        titleColor: '#f8fafc',
                        titleFont: {
                            weight: '600',
                            size: 13,
                            family: "'Plus Jakarta Sans', sans-serif"
                        },
                        bodyColor: '#ffffff',
                        bodyFont: {
                            weight: '700',
                            size: 14,
                            family: "'Plus Jakarta Sans', sans-serif"
                        },
                        cornerRadius: 8,
                        boxPadding: 4,
                        callbacks: {
                            label: function(context) {
                                const val = context.raw || 0;
                                return 'Total Orders: ' + currencyIcon + Number(val).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                            }
                        }
                    },
                    legend: {
                        display: false,
                    },
                    title: {
                        display: false,
                    }
                }
            }
        });

        function itemDeleteConfrimation(id){
            $("#item_delect_confirmation").attr("action",'{{ url("admin/order-delete/") }}'+"/"+id)
        }

    </script>
@endpush
