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
                            <span>
                                <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle opacity="0.08" cx="27" cy="27" r="27" fill="#22be0d"/>
                                    <path d="M25.125 41H16.125C15.8266 41 15.5405 40.8815 15.3295 40.6705C15.1185 40.4595 15 40.1734 15 39.875C15 39.5766 15.1185 39.2905 15.3295 39.0795C15.5405 38.8685 15.8266 38.75 16.125 38.75H25.125C25.4234 38.75 25.7095 38.8685 25.9205 39.0795C26.1315 39.2905 26.25 39.5766 26.25 39.875C26.25 40.1734 26.1315 40.4595 25.9205 40.6705C25.7095 40.8815 25.4234 41 25.125 41Z" fill="#22be0d"/>
                                    <path d="M28.5 20.75C28.2016 20.75 27.9155 20.8685 27.7045 21.0795C27.4935 21.2905 27.375 21.5766 27.375 21.875V27.5C27.3751 27.7983 27.4936 28.0844 27.7046 28.2954L31.0796 31.6704C31.2918 31.8753 31.576 31.9887 31.871 31.9861C32.1659 31.9836 32.4481 31.8653 32.6567 31.6567C32.8653 31.4481 32.9836 31.1659 32.9861 30.871C32.9887 30.576 32.8753 30.2918 32.6704 30.0796L29.625 27.0343V21.875C29.625 21.5766 29.5065 21.2905 29.2955 21.0795C29.0845 20.8685 28.7984 20.75 28.5 20.75Z" fill="#22be0d"/>
                                </svg>
                            </span>
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
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <span>
                                <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle opacity="0.08" cx="27" cy="27" r="27" fill="#22be0d"/>
                                    <path d="M20.625 20.75C20.625 20.1279 21.129 19.625 21.75 19.625H25.125C25.746 19.625 26.25 20.1279 26.25 20.75C26.25 21.3721 25.746 21.875 25.125 21.875H21.75C21.129 21.875 20.625 21.3721 20.625 20.75Z" fill="#22be0d"/>
                                    <path d="M37.5 36.5C37.5 35.879 36.9949 35.375 36.375 35.375H24C23.3801 35.375 22.875 35.879 22.875 36.5V37.0625C22.875 37.6655 22.7378 38.2381 22.4948 38.75H35.8125C36.7429 38.75 37.5 37.9929 37.5 37.0625V36.5Z" fill="#22be0d"/>
                                </svg>
                            </span>
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
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <span>
                                <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle opacity="0.08" cx="27" cy="27" r="27" fill="#22be0d"/>
                                    <path d="M34.375 15.125H18.625C15.5234 15.125 13 17.6484 13 20.75V34.25C13 37.3516 15.5234 39.875 18.625 39.875H34.375C37.4766 39.875 40 37.3516 40 34.25V20.75C40 17.6484 37.4766 15.125 34.375 15.125ZM37.75 34.25C37.75 36.1108 36.2358 37.625 34.375 37.625H18.625C16.7642 37.625 15.25 36.1108 15.25 34.25V20.75C15.25 18.8892 16.7642 17.375 18.625 17.375H34.375C36.2358 17.375 37.75 18.8892 37.75 20.75V34.25Z" fill="#22be0d"/>
                                </svg>
                            </span>
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
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stat Cards Row 2 -->
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <span>
                                <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle opacity="0.08" cx="27" cy="27" r="27" fill="#22be0d"/>
                                    <path d="M36.625 41H34.375V35.3266C34.3741 34.4446 34.0233 33.599 33.3997 32.9753C32.776 32.3517 31.9304 32.0009 31.0484 32H21.9516C21.0696 32.0009 20.224 32.3517 19.6003 32.9753C18.9767 33.599 18.6259 34.4446 18.625 35.3266V41H16.375V35.3266C16.3768 33.8482 16.9649 32.4308 18.0103 31.3853C19.0558 30.3399 20.4732 29.7518 21.9516 29.75H31.0484C32.5268 29.7518 33.9442 30.3399 34.9897 31.3853C36.0351 32.4308 36.6232 33.8482 36.625 35.3266V41Z" fill="#22be0d"/>
                                </svg>
                            </span>
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
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <span>
                                <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle opacity="0.08" cx="27" cy="27" r="27" fill="#22be0d"/>
                                    <path d="M25.125 41H16.125C15.8266 41 15.5405 40.8815 15.3295 40.6705C15.1185 40.4595 15 40.1734 15 39.875C15 39.5766 15.1185 39.2905 15.3295 39.0795C15.5405 38.8685 15.8266 38.75 16.125 38.75H25.125C25.4234 38.75 25.7095 38.8685 25.9205 39.0795C26.1315 39.2905 26.25 39.5766 26.25 39.875C26.25 40.1734 26.1315 40.4595 25.9205 40.6705C25.7095 40.8815 25.4234 41 25.125 41Z" fill="#22be0d"/>
                                </svg>
                            </span>
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
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-12 mg-top-30">
                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                        <div class="flex-main">
                            <span>
                                <svg width="54" height="54" viewBox="0 0 54 54" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <circle opacity="0.08" cx="27" cy="27" r="27" fill="#22be0d"/>
                                    <path d="M20.625 20.75C20.625 20.1279 21.129 19.625 21.75 19.625H25.125C25.746 19.625 26.25 20.1279 26.25 20.75C26.25 21.3721 25.746 21.875 25.125 21.875H21.75C21.129 21.875 20.625 21.3721 20.625 20.75Z" fill="#22be0d"/>
                                </svg>
                            </span>
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
