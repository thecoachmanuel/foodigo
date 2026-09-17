@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Restaurant Details') }} - {{ html_decode($restaurant->restaurant_name) }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Restaurant Details') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Restaurant') }} >> {{ html_decode($restaurant->restaurant_name) }}</p>
@endsection

@section('body-content')

    <!-- crancy Dashboard -->
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">

            <!-- Stat Cards Row 1 -->
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <div class="flex-1">
                                <div class="crancy-ecom-card__heading">
                                    <div class="crancy-ecom-card__icon">
                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Gross Sales') }}</h4>
                                    </div>
                                </div>
                                <div class="crancy-ecom-card__content">
                                    <div class="crancy-ecom-card__camount">
                                        <div class="crancy-ecom-card__camount__inside">
                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_income) }}</h3>
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
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <div class="flex-1">
                                <div class="crancy-ecom-card__heading">
                                    <div class="crancy-ecom-card__icon">
                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Admin Commission') }} ({{ $commission_per_sale }}%)</h4>
                                    </div>
                                </div>
                                <div class="crancy-ecom-card__content">
                                    <div class="crancy-ecom-card__camount">
                                        <div class="crancy-ecom-card__camount__inside">
                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_commission) }}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span>
                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6.79916 12.2693C7.61585 9.81921 9.90868 8.16663 12.4913 8.16663H15.5088C18.0914 8.16663 20.3842 9.81921 21.2009 12.2693L23.0343 17.7693C24.3293 21.6544 21.4375 25.6666 17.3422 25.6666H10.6579C6.56259 25.6666 3.67077 21.6544 4.96583 17.7693L6.79916 12.2693Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                        <path d="M16.4336 8.16671L11.5665 8.16671L9.93191 6.29182C8.32956 4.45394 10.1989 1.70685 12.5383 2.46153L13.6207 2.81071C13.8671 2.8902 14.133 2.8902 14.3794 2.81071L15.4618 2.46153C17.8012 1.70685 19.6705 4.45394 18.0682 6.29183L16.4336 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                        <path d="M10.5 19.8334C13.1301 21.3672 14.6741 21.4019 17.5 19.8334" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
                                        <path d="M15.1667 13.9418C15.1667 13.2652 14.5399 12.7168 13.7667 12.7168C12.9935 12.7168 12.3667 13.2652 12.3667 13.9418C12.3667 14.6183 12.9935 15.1668 13.7667 15.1668C14.5399 15.1668 15.1667 15.7152 15.1667 16.3918C15.1667 17.0683 14.5399 17.6168 13.7667 17.6168C12.9935 17.6168 12.3667 17.0683 12.3667 16.3918" stroke="currentColor" stroke-linecap="round"/>
                                        <path d="M13.7667 11.6666V12.7166" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M13.7667 17.6165V18.6665" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <div class="flex-1">
                                <div class="crancy-ecom-card__heading">
                                    <div class="crancy-ecom-card__icon">
                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Net Earnings') }}</h4>
                                    </div>
                                </div>
                                <div class="crancy-ecom-card__content">
                                    <div class="crancy-ecom-card__camount">
                                        <div class="crancy-ecom-card__camount__inside">
                                            <h3 class="crancy-ecom-card__amount">{{ currency($net_income) }}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span>
                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M16.9166 16.9167C16.9166 15.3059 15.6107 14 13.9999 14C12.3891 14 11.0833 15.3059 11.0833 16.9167C11.0833 18.5275 12.3891 19.8334 13.9999 19.8334C15.6107 19.8334 16.9166 18.5275 16.9166 16.9167Z" stroke="currentColor" stroke-width="1.5"/>
                                        <path d="M6.79904 12.2693C7.61572 9.81921 9.90856 8.16663 12.4911 8.16663H15.5087C18.0913 8.16663 20.3841 9.81921 21.2008 12.2693L23.0341 17.7693C24.3292 21.6544 21.4374 25.6666 17.342 25.6666H10.6578C6.56247 25.6666 3.67064 21.6544 4.96571 17.7693L6.79904 12.2693Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                        <path d="M16.4335 8.16671L11.5664 8.16671L9.93178 6.29183C8.32944 4.45394 10.1987 1.70685 12.5382 2.46153L13.6206 2.81071C13.867 2.8902 14.1328 2.8902 14.3793 2.81071L15.4617 2.46153C17.8011 1.70685 19.6704 4.45394 18.0681 6.29183L16.4335 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                    </svg>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stat Cards Row 2 -->
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <div class="flex-1">
                                <div class="crancy-ecom-card__heading">
                                    <div class="crancy-ecom-card__icon">
                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Wallet Balance') }}</h4>
                                    </div>
                                </div>
                                <div class="crancy-ecom-card__content">
                                    <div class="crancy-ecom-card__camount">
                                        <div class="crancy-ecom-card__camount__inside">
                                            <h3 class="crancy-ecom-card__amount">{{ currency($current_balance) }}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span>
                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.3332 21H16.3332M23.3332 21C24.6218 21 25.6665 22.0446 25.6665 23.3333C25.6665 24.622 24.6218 25.6666 23.3332 25.6666H16.3332C15.0445 25.6666 13.9998 24.622 13.9998 23.3333C13.9998 22.0446 15.0445 21 16.3332 21M23.3332 21C24.6218 21 25.6665 19.9553 25.6665 18.6666C25.6665 17.378 24.6218 16.3333 23.3332 16.3333H22.5554M16.3332 21C15.0445 21 13.9998 19.9553 13.9998 18.6666C13.9998 17.378 15.0445 16.3333 16.3332 16.3333H22.5554M15.9545 25.6666H12.0452C7.26726 25.6666 3.89347 20.9857 5.40438 16.453L6.57105 12.953C7.52384 10.0946 10.1988 8.16663 13.2118 8.16663H14.7879C17.8009 8.16663 20.4758 10.0946 21.4286 12.953L22.5554 16.3333" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                        <path d="M16.4336 8.16671L11.5665 8.16671L9.93191 6.29183C8.32956 4.45394 10.1989 1.70685 12.5383 2.46153L13.6207 2.81071C13.8671 2.8902 14.133 2.8902 14.3794 2.81071L15.4618 2.46153C17.8012 1.70685 19.6705 4.45394 18.0682 6.29183L16.4336 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                    </svg>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <div class="flex-1">
                                <div class="crancy-ecom-card__heading">
                                    <div class="crancy-ecom-card__icon">
                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Total Withdrawn') }}</h4>
                                    </div>
                                </div>
                                <div class="crancy-ecom-card__content">
                                    <div class="crancy-ecom-card__camount">
                                        <div class="crancy-ecom-card__camount__inside">
                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_withdraw_amount) }}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span>
                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M2.33337 9.33337H4.66671L12.1815 12.6211C13.188 13.0615 13.6509 14.2314 13.2181 15.2412L13.0379 15.6618C12.6028 16.677 11.427 17.1473 10.4118 16.7122L8.16671 15.75" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M2.66878 19.1626C2.2983 18.9773 1.8478 19.1275 1.66255 19.498C1.47731 19.8684 1.62748 20.319 1.99796 20.5042L2.66878 19.1626ZM13.1688 15.6626L12.498 15.3271L11.8271 16.6688L12.498 17.0042L13.1688 15.6626ZM18.9164 18.6667V19.4167H21.3334V18.6667V17.9167H18.9164V18.6667ZM23.3334 20.6667H22.5834V21.3334H23.3334H24.0834V20.6667H23.3334ZM21.3334 23.3334V22.5834H11.2219V23.3334V24.0834H21.3334V23.3334ZM7.64421 22.4888L7.97962 21.818L2.66878 19.1626L2.33337 19.8334L1.99796 20.5042L7.3088 23.1596L7.64421 22.4888ZM16.2332 18.0333L16.5686 17.3625L13.1688 15.6626L12.8334 16.3334L12.498 17.0042L15.8978 18.7041L16.2332 18.0333ZM11.2219 23.3334V22.5834C10.0964 22.5834 8.98632 22.3213 7.97962 21.818L7.64421 22.4888L7.3088 23.1596C8.52378 23.7671 9.86352 24.0834 11.2219 24.0834V23.3334ZM23.3334 21.3334H22.5834C22.5834 22.0237 22.0237 22.5834 21.3334 22.5834V23.3334V24.0834C22.8522 24.0834 24.0834 22.8522 24.0834 21.3334H23.3334ZM21.3334 18.6667V19.4167C22.0237 19.4167 22.5834 19.9764 22.5834 20.6667H23.3334H24.0834C24.0834 19.1479 22.8522 17.9167 21.3334 17.9167V18.6667ZM18.9164 18.6667V17.9167C18.1014 17.9167 17.2976 17.7269 16.5686 17.3625L16.2332 18.0333L15.8978 18.7041C16.835 19.1727 17.8685 19.4167 18.9164 19.4167V18.6667Z" fill="currentColor"/>
                                        <path d="M21.875 9.02595C21.875 8.4234 21.2874 7.93494 20.5625 7.93494C19.8376 7.93494 19.25 8.4234 19.25 9.02595C19.25 9.6285 19.8376 10.117 20.5625 10.117C21.2874 10.117 21.875 10.6054 21.875 11.208C21.875 11.8105 21.2874 12.299 20.5625 12.299C19.8376 12.299 19.25 11.8105 19.25 11.208" stroke="currentColor" stroke-linecap="round"/>
                                        <path d="M20.5625 7V7.93516" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M20.5625 12.2994V13.2346" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M16.3025 8.38189C16.8848 6.51864 18.6104 5.25 20.5625 5.25V5.25C22.5146 5.25 24.2402 6.51864 24.8225 8.38189L25.1676 9.48622C26.1384 12.593 23.8174 15.75 20.5625 15.75V15.75C17.3076 15.75 14.9866 12.593 15.9574 9.48622L16.3025 8.38189Z" stroke="currentColor" stroke-width="1.25" stroke-linejoin="round"/>
                                        <path d="M21.9314 5.03125L19.1936 5.03125L18.2742 3.97663C17.3729 2.94282 18.4243 1.39758 19.7403 1.82209L20.3491 2.0185C20.4877 2.06322 20.6373 2.06322 20.7759 2.0185L21.3847 1.82209C22.7007 1.39758 23.7521 2.94282 22.8508 3.97663L21.9314 5.03125Z" stroke="currentColor" stroke-width="1.25" stroke-linejoin="round"/>
                                    </svg>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <div class="flex-1">
                                <div class="crancy-ecom-card__heading">
                                    <div class="crancy-ecom-card__icon">
                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Pending Withdraw') }}</h4>
                                    </div>
                                </div>
                                <div class="crancy-ecom-card__content">
                                    <div class="crancy-ecom-card__camount">
                                        <div class="crancy-ecom-card__camount__inside">
                                            <h3 class="crancy-ecom-card__amount">{{ currency($pending_withdraw) }}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span>
                                <div class="d-inline-flex justify-content-center align-items-center bg-success-white rounded-circle grid-icon-size text-primary">
                                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M15.9545 25.6666H12.0452C7.26726 25.6666 3.89347 20.9857 5.40438 16.453L6.57105 12.953C7.52384 10.0946 10.1988 8.16663 13.2118 8.16663H14.7879C17.8009 8.16663 20.4758 10.0946 21.4286 12.953L22.5554 16.3333" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M16.4335 8.16671L11.5664 8.16671L9.93178 6.29182C8.32944 4.45394 10.1987 1.70685 12.5382 2.46153L13.6206 2.81071C13.867 2.8902 14.1328 2.8902 14.3793 2.81071L15.4617 2.46153C17.8011 1.70685 19.6704 4.45394 18.0681 6.29183L16.4335 8.16671Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
                                        <rect x="23.0742" y="19.7036" width="2.20376" height="6.61129" rx="1.10188" transform="rotate(90 23.0742 19.7036)" stroke="currentColor" stroke-width="1.25"/>
                                        <rect x="20.8704" y="17.5" width="2.20376" height="6.61129" rx="1.10188" transform="rotate(90 20.8704 17.5)" stroke="currentColor" stroke-width="1.25"/>
                                        <rect x="21.4214" y="21.9072" width="2.20376" height="6.61129" rx="1.10188" transform="rotate(90 21.4214 21.9072)" stroke="currentColor" stroke-width="1.25"/>
                                    </svg>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Profile & Main Content Row -->
            <div class="row mg-top-30 row__bscreen">
                <!-- Left Sidebar: Restaurant Profile Info -->
                <div class="col-xxl-3 col-xl-4 col-lg-4">
                    <div class="overview-profile">
                        <div style="position: relative; width: 100%; height: 120px; border-radius: 12px; overflow: hidden; background: #f0f0f0; margin-bottom: 45px;">
                            @if (!empty($restaurant->cover_image))
                                <img src="{{ asset($restaurant->cover_image) }}" alt="Cover" style="width: 100%; height: 100%; object-fit: cover;">
                            @else
                                <div style="width: 100%; height: 100%; background: linear-gradient(135deg, #22be0d 0%, #15803d 100%);"></div>
                            @endif
                            <div class="overview-profile-thumb" style="position: absolute; bottom: -35px; left: 50%; transform: translateX(-50%); margin: 0; width: 75px; height: 75px; border: 3px solid #fff; border-radius: 50%; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.15);">
                                @if (!empty($restaurant->logo))
                                    <img src="{{ asset($restaurant->logo) }}" alt="Logo" style="width: 100%; height: 100%; object-fit: cover;">
                                @elseif(!empty($general_setting?->default_avatar))
                                    <img src="{{ asset($general_setting->default_avatar) }}" alt="Logo" style="width: 100%; height: 100%; object-fit: cover;">
                                @else
                                    <img src="{{ asset('uploads/website-images/default-avatar.png') }}" alt="Logo" style="width: 100%; height: 100%; object-fit: cover;">
                                @endif
                            </div>
                        </div>

                        <div class="overview-profile-txt text-center" style="margin-top: 5px;">
                            <h4 style="font-size: 18px; font-weight: 700;">{{ html_decode($restaurant->restaurant_name) }}</h4>
                            <p style="color: #64748b; font-size: 13px; margin-top: 4px;">{{ html_decode($restaurant->city?->translate?->name ?? '') }}</p>
                        </div>

                        <!-- Status Badges -->
                        <div class="d-flex justify-content-center gap-2 mt-3 flex-wrap">
                            @if ($restaurant->admin_approval == 'enable')
                                <span class="badge bg-success text-white px-3 py-1">{{ __('translate.Approved') }}</span>
                            @elseif ($restaurant->admin_approval == 'rejected')
                                <span class="badge bg-danger text-white px-3 py-1">{{ __('translate.Rejected') }}</span>
                            @else
                                <span class="badge bg-warning text-dark px-3 py-1">{{ __('translate.Awaiting Approval') }}</span>
                            @endif

                            @if ($restaurant->is_banned == 'enable')
                                <span class="badge bg-danger text-white px-3 py-1">{{ __('translate.Banned') }}</span>
                            @else
                                <span class="badge bg-primary text-white px-3 py-1">{{ __('translate.Active') }}</span>
                            @endif

                            @if ($restaurant->is_trusted == 1)
                                <span class="badge bg-info text-white px-3 py-1">{{ __('translate.Trusted') }}</span>
                            @endif
                        </div>

                        <!-- Quick Actions -->
                        <div class="overview-profile-item mg-top-20">
                            <div class="overview-profile-inner">
                                <h4 style="font-size: 15px; font-weight: 600; margin-bottom: 12px;">{{ __('translate.Management Actions') }}</h4>
                                
                                <div class="d-flex flex-column gap-2">
                                    <!-- Approval Toggle Form -->
                                    @if ($restaurant->admin_approval != 'enable')
                                        <form action="{{ route('admin.restaurants.approval-status', $restaurant->id) }}" method="POST">
                                            @csrf
                                            <input type="hidden" name="status" value="enable">
                                            <button type="submit" class="crancy-btn crancy-full-width" style="background-color: #22be0d; color: #fff; border: none; border-radius: 8px; padding: 10px;">
                                                <i class="fas fa-check-circle"></i> {{ __('translate.Approve Restaurant') }}
                                            </button>
                                        </form>
                                    @else
                                        <form action="{{ route('admin.restaurants.approval-status', $restaurant->id) }}" method="POST">
                                            @csrf
                                            <input type="hidden" name="status" value="rejected">
                                            <button type="submit" class="crancy-btn crancy-full-width" style="background-color: #eab308; color: #fff; border: none; border-radius: 8px; padding: 10px;">
                                                <i class="fas fa-ban"></i> {{ __('translate.Reject Restaurant') }}
                                            </button>
                                        </form>
                                    @endif

                                    <!-- Ban / Unban Form -->
                                    <form action="{{ route('admin.restaurants.ban-status', $restaurant->id) }}" method="POST">
                                        @csrf
                                        <button type="submit" class="crancy-btn crancy-full-width" style="background-color: {{ $restaurant->is_banned == 'enable' ? '#22be0d' : '#ef4444' }}; color: #fff; border: none; border-radius: 8px; padding: 10px;">
                                            <i class="fas {{ $restaurant->is_banned == 'enable' ? 'fa-user-check' : 'fa-user-slash' }}"></i>
                                            {{ $restaurant->is_banned == 'enable' ? __('translate.Unban Restaurant') : __('translate.Ban Restaurant') }}
                                        </button>
                                    </form>

                                    <!-- Edit Profile -->
                                    <a href="{{ route('admin.restaurants.edit', $restaurant->id) }}" class="crancy-btn crancy-full-width user_edit_btn" style="text-align: center; text-decoration: none;">
                                        <i class="fas fa-edit"></i> {{ __('translate.Edit Profile') }}
                                    </a>

                                    <!-- Delete Button -->
                                    <a onclick="itemDeleteConfrimation({{ $restaurant->id }})" href="javascript:;" data-bs-toggle="modal" data-bs-target="#exampleModal" class="crancy-btn crancy-full-width user_delete_btn" style="text-align: center; text-decoration: none;">
                                        <i class="fas fa-trash"></i> {{ __('translate.Delete Restaurant') }}
                                    </a>
                                </div>
                            </div>

                            <!-- Contact & Details Info -->
                            <div class="overview-profile-inner mg-top-20">
                                <h4 style="font-size: 15px; font-weight: 600; margin-bottom: 12px;">{{ __('translate.Restaurant Information') }}</h4>
                                <ul class="overview-profile-inner-contact">
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Owner') }}:</span>
                                        <span>{{ html_decode($restaurant->owner_name) }}</span>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Owner Email') }}:</span>
                                        <a href="mailto:{{ html_decode($restaurant->owner_email) }}">{{ html_decode($restaurant->owner_email) }}</a>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Owner Phone') }}:</span>
                                        <a href="tel:{{ html_decode($restaurant->owner_phone) }}">{{ html_decode($restaurant->owner_phone) }}</a>
                                    </li>
                                    @if (!empty($restaurant->whatsapp))
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.WhatsApp') }}:</span>
                                        <a href="https://wa.me/{{ preg_replace('/[^0-9]/', '', $restaurant->whatsapp) }}" target="_blank">{{ html_decode($restaurant->whatsapp) }}</a>
                                    </li>
                                    @endif
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Account Email') }}:</span>
                                        <span>{{ html_decode($restaurant->email) }}</span>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Address') }}:</span>
                                        <span>{{ html_decode($restaurant->address) }}</span>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Hours') }}:</span>
                                        <span>{{ $restaurant->opening_hour }} - {{ $restaurant->closing_hour }}</span>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Prep Time') }}:</span>
                                        <span>{{ $restaurant->min_processing_time }} - {{ $restaurant->max_processing_time }} {{ __('translate.min') }}</span>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Delivery Order') }}:</span>
                                        <span class="badge bg-{{ $restaurant->is_delivery_order == 'enable' ? 'success' : 'secondary' }}">{{ ucfirst($restaurant->is_delivery_order) }}</span>
                                    </li>
                                    <li>
                                        <span style="font-weight: 600; color: #475569;">{{ __('translate.Pickup Order') }}:</span>
                                        <span class="badge bg-{{ $restaurant->is_pickup_order == 'enable' ? 'success' : 'secondary' }}">{{ ucfirst($restaurant->is_pickup_order) }}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Main Content: Tabs for Orders, Products, Withdrawals, Reviews -->
                <div class="col-xxl-9 col-xl-8 col-lg-8">
                    <div class="crancy-body">
                        <div class="crancy-dsinner">

                            <!-- Navigation Tabs -->
                            <ul class="nav nav-tabs mg-bottom-20" id="restaurantDetailTabs" role="tablist" style="border-bottom: 2px solid #e2e8f0;">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="orders-tab" data-bs-toggle="tab" data-bs-target="#orders-tab-pane" type="button" role="tab" aria-controls="orders-tab-pane" aria-selected="true" style="font-weight: 600; padding: 12px 20px;">
                                        <i class="fas fa-shopping-bag me-1"></i> {{ __('translate.Orders') }} ({{ $total_orders }})
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="products-tab" data-bs-toggle="tab" data-bs-target="#products-tab-pane" type="button" role="tab" aria-controls="products-tab-pane" aria-selected="false" style="font-weight: 600; padding: 12px 20px;">
                                        <i class="fas fa-utensils me-1"></i> {{ __('translate.Products') }} ({{ $products->count() }})
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="withdraw-tab" data-bs-toggle="tab" data-bs-target="#withdraw-tab-pane" type="button" role="tab" aria-controls="withdraw-tab-pane" aria-selected="false" style="font-weight: 600; padding: 12px 20px;">
                                        <i class="fas fa-money-bill-wave me-1"></i> {{ __('translate.Withdrawals') }} ({{ $withdraw_list->count() }})
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews-tab-pane" type="button" role="tab" aria-controls="reviews-tab-pane" aria-selected="false" style="font-weight: 600; padding: 12px 20px;">
                                        <i class="fas fa-star me-1"></i> {{ __('translate.Reviews') }} ({{ $reviews->count() }})
                                    </button>
                                </li>
                            </ul>

                            <div class="tab-content" id="restaurantDetailTabsContent">
                                <!-- Orders Tab Pane -->
                                <div class="tab-pane fade show active" id="orders-tab-pane" role="tabpanel" aria-labelledby="orders-tab" tabindex="0">
                                    <div class="crancy-table crancy-table--v3">
                                        <div class="crancy-customer-filter">
                                            <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between">
                                                <h4 class="crancy-product-card__title">{{ __('translate.Recent Orders') }}</h4>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="crancy-table__main crancy-table__main-v3 no-footer" id="dataTable">
                                                <thead class="crancy-table__head">
                                                    <tr>
                                                        <th>{{ __('translate.Order ID') }}</th>
                                                        <th>{{ __('translate.Customer') }}</th>
                                                        <th>{{ __('translate.Date') }}</th>
                                                        <th>{{ __('translate.Amount') }}</th>
                                                        <th>{{ __('translate.Status') }}</th>
                                                        <th>{{ __('translate.Payment') }}</th>
                                                        <th>{{ __('translate.Action') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="crancy-table__body">
                                                    @forelse ($orders as $order)
                                                        <tr>
                                                            <td><strong>#{{ $order->id }}</strong></td>
                                                            <td>{{ $order->user?->name ?? 'Guest' }}</td>
                                                            <td>{{ $order->created_at?->format('d M, Y') }}</td>
                                                            <td>{{ currency($order->grand_total ?? $order->total ?? 0) }}</td>
                                                            <td>
                                                                @php $st = (int) $order->order_status; @endphp
                                                                @if ($st == 1)
                                                                    <span class="badge bg-warning text-dark">{{ __('translate.Order Received') }}</span>
                                                                @elseif ($st == 2)
                                                                    <span class="badge bg-info text-white">{{ __('translate.Order Confirmed') }}</span>
                                                                @elseif ($st == 3)
                                                                    <span class="badge bg-primary text-white">{{ __('translate.Food Ready') }}</span>
                                                                @elseif ($st == 4)
                                                                    <span class="badge bg-info text-white">{{ __('translate.On the way') }}</span>
                                                                @elseif ($st == 5)
                                                                    <span class="badge bg-success text-white">{{ __('translate.Delivered') }}</span>
                                                                @else
                                                                    <span class="badge bg-danger text-white">{{ __('translate.Cancelled') }}</span>
                                                                @endif
                                                            </td>
                                                            <td>
                                                                @if ($order->payment_status == 'success')
                                                                    <span class="badge bg-success text-white">{{ __('translate.Success') }}</span>
                                                                @else
                                                                    <span class="badge bg-warning text-dark">{{ __('translate.Pending') }}</span>
                                                                @endif
                                                            </td>
                                                            <td>
                                                                <a href="{{ route('admin.order-show', $order->id) }}" class="crancy-btn"><i class="fas fa-eye"></i> {{ __('translate.View') }}</a>
                                                            </td>
                                                        </tr>
                                                    @empty
                                                        <tr>
                                                            <td colspan="7" class="text-center py-4">{{ __('translate.No orders found') }}</td>
                                                        </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!-- Products Tab Pane -->
                                <div class="tab-pane fade" id="products-tab-pane" role="tabpanel" aria-labelledby="products-tab" tabindex="0">
                                    <div class="crancy-table crancy-table--v3">
                                        <div class="crancy-customer-filter">
                                            <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between">
                                                <h4 class="crancy-product-card__title">{{ __('translate.Products / Menu Items') }}</h4>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="crancy-table__main crancy-table__main-v3 no-footer">
                                                <thead class="crancy-table__head">
                                                    <tr>
                                                        <th>{{ __('translate.Image') }}</th>
                                                        <th>{{ __('translate.Name') }}</th>
                                                        <th>{{ __('translate.Price') }}</th>
                                                        <th>{{ __('translate.Offer Price') }}</th>
                                                        <th>{{ __('translate.Status') }}</th>
                                                        <th>{{ __('translate.Action') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="crancy-table__body">
                                                    @forelse ($products as $prod)
                                                        <tr>
                                                            <td>
                                                                <img src="{{ asset($prod->thumb_image ?? 'uploads/website-images/default-avatar.png') }}" alt="" style="width: 45px; height: 45px; object-fit: cover; border-radius: 8px;">
                                                            </td>
                                                            <td><strong>{{ html_decode($prod->translate_product?->name ?? $prod->name) }}</strong></td>
                                                            <td>{{ currency($prod->price ?? 0) }}</td>
                                                            <td>{{ $prod->offer_price ? currency($prod->offer_price) : '-' }}</td>
                                                            <td>
                                                                <span class="badge bg-{{ $prod->status == 'enable' ? 'success' : 'danger' }}">{{ ucfirst($prod->status ?? 'enable') }}</span>
                                                            </td>
                                                            <td>
                                                                <a href="{{ route('admin.product.edit', $prod->id) }}" class="crancy-btn"><i class="fas fa-edit"></i></a>
                                                            </td>
                                                        </tr>
                                                    @empty
                                                        <tr>
                                                            <td colspan="6" class="text-center py-4">{{ __('translate.No products found') }}</td>
                                                        </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!-- Withdrawals Tab Pane -->
                                <div class="tab-pane fade" id="withdraw-tab-pane" role="tabpanel" aria-labelledby="withdraw-tab" tabindex="0">
                                    <div class="crancy-table crancy-table--v3">
                                        <div class="crancy-customer-filter">
                                            <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between">
                                                <h4 class="crancy-product-card__title">{{ __('translate.Withdrawal History') }}</h4>
                                                <a href="{{ route('admin.withdraw-list.index') }}" class="crancy-btn"><i class="fas fa-external-link-alt"></i> {{ __('translate.Manage Withdrawals') }}</a>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="crancy-table__main crancy-table__main-v3 no-footer">
                                                <thead class="crancy-table__head">
                                                    <tr>
                                                        <th>{{ __('translate.Method') }}</th>
                                                        <th>{{ __('translate.Amount') }}</th>
                                                        <th>{{ __('translate.Charge') }}</th>
                                                        <th>{{ __('translate.Status') }}</th>
                                                        <th>{{ __('translate.Date') }}</th>
                                                        <th>{{ __('translate.Action') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="crancy-table__body">
                                                    @forelse ($withdraw_list as $withdraw)
                                                        <tr>
                                                            <td><strong>{{ html_decode($withdraw->method) }}</strong></td>
                                                            <td>{{ currency($withdraw->total_amount) }}</td>
                                                            <td>{{ currency($withdraw->withdraw_charge) }}</td>
                                                            <td>
                                                                @if ($withdraw->status == 'approved')
                                                                    <span class="badge bg-success text-white">{{ __('translate.Approved') }}</span>
                                                                @elseif ($withdraw->status == 'rejected')
                                                                    <span class="badge bg-danger text-white">{{ __('translate.Rejected') }}</span>
                                                                @else
                                                                    <span class="badge bg-warning text-dark">{{ __('translate.Pending') }}</span>
                                                                @endif
                                                            </td>
                                                            <td>{{ $withdraw->created_at?->format('d M, Y H:i') }}</td>
                                                            <td>
                                                                <a href="{{ route('admin.withdraw-list.show', $withdraw->id) }}" class="crancy-btn"><i class="fas fa-eye"></i> {{ __('translate.View') }}</a>
                                                            </td>
                                                        </tr>
                                                    @empty
                                                        <tr>
                                                            <td colspan="6" class="text-center py-4">{{ __('translate.No withdrawal records found') }}</td>
                                                        </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!-- Reviews Tab Pane -->
                                <div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel" aria-labelledby="reviews-tab" tabindex="0">
                                    <div class="crancy-table crancy-table--v3">
                                        <div class="crancy-customer-filter">
                                            <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between">
                                                <h4 class="crancy-product-card__title">{{ __('translate.Customer Reviews') }}</h4>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="crancy-table__main crancy-table__main-v3 no-footer">
                                                <thead class="crancy-table__head">
                                                    <tr>
                                                        <th>{{ __('translate.Customer') }}</th>
                                                        <th>{{ __('translate.Rating') }}</th>
                                                        <th>{{ __('translate.Review') }}</th>
                                                        <th>{{ __('translate.Status') }}</th>
                                                        <th>{{ __('translate.Date') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="crancy-table__body">
                                                    @forelse ($reviews as $review)
                                                        <tr>
                                                            <td>{{ $review->user?->name ?? 'Guest' }}</td>
                                                            <td>
                                                                @for ($i = 1; $i <= 5; $i++)
                                                                    <i class="fas fa-star" style="color: {{ $i <= $review->rating ? '#f59e0b' : '#cbd5e1' }}; font-size: 13px;"></i>
                                                                @endfor
                                                            </td>
                                                            <td><small>{{ html_decode($review->review) }}</small></td>
                                                            <td>
                                                                <span class="badge bg-{{ $review->status == 'enable' ? 'success' : 'danger' }}">{{ ucfirst($review->status ?? 'enable') }}</span>
                                                            </td>
                                                            <td>{{ $review->created_at?->format('d M, Y') }}</td>
                                                        </tr>
                                                    @empty
                                                        <tr>
                                                            <td colspan="5" class="text-center py-4">{{ __('translate.No reviews found') }}</td>
                                                        </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
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

@endsection

@push('js_section')
    <script>
        "use strict";
        function itemDeleteConfrimation(id){
            $("#item_delect_confirmation").attr("action", '{{ url("admin/restaurant/restaurants/") }}' + "/" + id);
        }
    </script>
@endpush
