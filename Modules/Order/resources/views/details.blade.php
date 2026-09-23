@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Order Details') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Order Details') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Order') }} >> {{ __('translate.Order Details') }}</p>
@endsection

@section('body-content')

    <section class="crancy-adashboard crancy-show mt-5">
        <div class="zum_icvoice">
            <div class="container container__bscreen">
                <div class="crancy-product-card">
                    <div class="create_new_btn_inline_box mb-4">
                        <h4 class="crancy-product-card__title">{{ __('translate.Order Details') }}</h4>

                        <a href="{{ route('admin.order.index') }}" class="crancy-btn "><i
                                class="fa fa-list"></i> {{ __('translate.Order List') }}</a>
                    </div>

                    
                    {{-- Special Instructions / Kitchen Note Card --}}
                    @php
                        $specialNote = $order->order_note ?? $address?->delivery_instructions ?? $address?->additional_notes ?? null;
                    @endphp
                    @if(!empty($specialNote))
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="alert alert-warning border-warning d-flex align-items-center gap-3 p-3 shadow-sm rounded-3" role="alert" style="background-color: #fff9db; border-left: 5px solid #f59f00; margin-bottom: 0;">
                                    <div class="fs-4 text-warning" style="font-size: 24px;">
                                        <i class="fa fa-clipboard-list"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h5 class="alert-heading mb-1 text-dark fw-bold" style="font-size: 15px;">
                                            <i class="fa fa-exclamation-circle text-warning me-1"></i> {{ __('translate.Customer Special Instructions / Kitchen Note') }}
                                        </h5>
                                        <p class="mb-0 text-dark fw-semibold" style="font-size: 14px; line-height: 1.5; color: #1e293b;">
                                            {{ $specialNote }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif

                    <div class="row mb-5">
                        <div class="col-lg-4 col-md-6">
                            <div class="zum_icvoice_item_main">

                                @php
                                    $address = is_string($order->delivery_address) ? json_decode($order->delivery_address) : (object) ($order->delivery_address ?? []);
                                @endphp

                                @if($order->order_type == 'delivery')
                                    <div class="zum_invoice_text">
                                        <h2>{{__('translate.Billing Address')}}</h2>
                                    </div>
                                    <div class="zum_icvoice_item">
                                        <ul class="zum_invoice_lixt  d-flex flex-column gap-3">
                                            <li>{{__('translate.Full Name')}} : <span>{{$address?->contact_person_name ?? $order->user?->name ?? ''}}</span></li>
                                            <li>
                                                <a href="mailto:{{$address?->contact_person_email ?? $order->user?->email ?? ''}} ">
                                                    {{__('translate.Email')}} : <span> {{$address?->contact_person_email ?? $order->user?->email ?? ''}} </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="tel:{{$address?->contact_person_number ?? $order->user?->phone ?? ''}}">
                                                    {{__('translate.Phone')}} : <span> {{$address?->contact_person_number ?? $order->user?->phone ?? ''}}</span>
                                                </a>
                                            </li>
                                            <li>
                                                {{__('translate.Address')}} : <span> {{$address?->address ?? ''}} </span>
                                            </li>
                                        </ul>
                                    </div>
                                @endif
                                <div class="zum_icvoice_item">
                                    <h2>{{__('translate.Payment Information')}}:</h2>
                                    <ul class="zum_invoice_lixt  d-flex flex-column gap-3">
                                        <li>{{__('translate.Method')}} : <span>{{$order->payment_method}}</span></li>
                                        <li>
                                            @if($order->payment_status == 'success')
                                                <a href="javascript:;">
                                                    {{__('translate.State')}} :<span class="badge bg-success text-white">{{$order->payment_status}}</span>
                                                </a>
                                            @else
                                                <a href="javascript:;">
                                                    {{__('translate.State')}} :<span
                                                        class="badge bg-danger text-white">{{$order->payment_status}}</span>
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            {{__('translate.Transaction')}} :<span> {!! clean(nl2br($order->tnx_info ?? '')) !!}</span>
                                        </li>

                                    </ul>
                                </div>

                            </div>

                            @if($order->order_type == 'pickup')
                                <p><strong>{{__('translate.Contact person name')}} : </strong> {{$address?->contact_person_name ?? $order->user?->name ?? ''}}</p>
                                <p><strong>{{__('translate.Contact person phone')}} : </strong> {{$address?->contact_person_number ?? $order->user?->phone ?? ''}}</p>
                                <p><strong>{{__('translate.Contact person email')}} : </strong> {{$address?->contact_person_email ?? $order->user?->email ?? ''}}</p>
                            @endif



                            @if ($order->deliveryman)
                                <div class="row">
                                    <div class="col-md-12">
                                        <address class="zum_icvoice_item_main p-3">
                                            <strong>{{__('translate.Delivery Man Information')}}:</strong><br>
                                            <div class="zum_invoice_lixt">
                                                {{__('translate.Name')}}: {{ $order->deliveryman?->fname }} {{ $order->deliveryman?->lname }}<br>
                                                {{__('translate.Status')}} :
                                                <span class="tag {{ $order->order_request == 1 ? 'success' : ($order->order_request == 2 ? 'warning' : 'danger') }}">
                                                    {{ $order->order_request == 1 ? __('Accepted') : ($order->order_request == 2 ? __('Ignored') : __('No response')) }}
                                                </span>
                                            </div>
                                        </address>
                                    </div>
                                </div>
                            @endif

                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="zum_icvoice_item_main">
                                @if($order->order_type == 'delivery')
                                    <div class="zum_invoice_text ">
                                        <h2>{{__('translate.Shipping Information')}}</h2>


                                    </div>
                                    <div class="zum_icvoice_item  d-flex flex-column gap-3">
                                        <ul class="zum_invoice_lixt  d-flex flex-column gap-3">
                                            <li>{{__('translate.Full Name')}} : <span>{{$address?->contact_person_name ?? $order->user?->name ?? ''}}</span></li>
                                            <li>
                                                <a href="mailto:{{$address?->contact_person_email ?? $order->user?->email ?? ''}}">
                                                    {{__('translate.Email')}} : <span> {{$address?->contact_person_email ?? $order->user?->email ?? ''}}</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="tel:{{$address?->contact_person_number ?? $order->user?->phone ?? ''}}">
                                                    {{__('translate.Phone')}} : <span> {{$address?->contact_person_number ?? $order->user?->phone ?? ''}} </span>
                                                </a>
                                            </li>
                                            <li>
                                                {{__('translate.Address')}} : <span>{{$address?->address ?? ''}}</span>
                                            </li>
                                        </ul>
                                    </div>
                                @endif
                                <div class="zum_icvoice_item">
                                    <h2>{{__('translate.Order Information')}}:</h2>
                                    <ul class="zum_invoice_lixt d-flex flex-column gap-3">
                                        <li>{{__('translate.Date')}} : <span>{{$order->created_at->format('F j, Y') }}</span></li>
                                        <li>{{__('translate.Time')}} : <span style="font-weight: 600;">{{$order->created_at->format('g:i A') }}</span></li>

                                        <li>
                                            {{__('translate.Shipping')}} : <span> {{__('translate.Fixed Shipping')}}</span>
                                        </li>

                                        <li>
                                            <a href="javascript:;">
                                                @if($order->order_status == 1)
                                                    {{__('translate.State')}} : <span id="orderStatusDisplayBadge" class="badge bg-warning text-white">{{__('translate.Pending')}}</span>
                                                @elseif($order->order_status == 2)
                                                    {{__('translate.State')}} : <span id="orderStatusDisplayBadge" class="badge bg-success text-white">{{__('translate.Confirmed')}}</span>
                                                @elseif($order->order_status == 3)
                                                    {{__('translate.State')}} : <span id="orderStatusDisplayBadge" class="badge bg-warning text-white">{{__('translate.Processing')}}</span>
                                                @elseif($order->order_status == 4)
                                                    {{__('translate.State')}} : <span id="orderStatusDisplayBadge" class="badge bg-inprocees text-white">{{__('translate.Food on the way')}}</span>
                                                @elseif($order->order_status == 5)
                                                    {{__('translate.State')}} : <span id="orderStatusDisplayBadge" class="badge bg-success text-white">{{__('translate.Delivered')}}</span>
                                                @elseif($order->order_status == 6)
                                                    {{__('translate.State')}} : <span id="orderStatusDisplayBadge" class="badge bg-warning text-white">{{__('translate.Cancel')}}</span>
                                                @endif
                                            </a>
                                        </li>

                                    </ul>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="order_status_box">
                                <form class="order_status">
                                    <div class="order_status_item">
                                        <div class="order_status_inner">
                                            <label for="paymentStatusSelect" class="form-label">{{__('translate.Payment status')}}</label>
                                            <select id="paymentStatusSelect" class="form-select" data-current-status="{{ $order->payment_status }}" aria-label="Payment status" onchange="handlePaymentStatusChange({{ $order->id }}, this.value)">
                                                @if($order->payment_status == 'pending')
                                                <option value="pending" {{ $order->payment_status == 'pending' ? 'selected' : '' }}>{{ __('translate.Pending') }}</option>
                                                <option value="success" {{ $order->payment_status == 'success' ? 'selected' : '' }}>{{ __('translate.Success') }}</option>
                                                @elseif($order->payment_status == 'success')
                                                    <option value="success" {{ $order->payment_status == 'success' ? 'selected' : '' }}>{{ __('translate.Success') }}</option>
                                                @else
                                                    <option>{{ucfirst($order->payment_status)}}</option>
                                                @endif
                                            </select>
                                        </div>
                                    </div>
                                    <div class="order_status_item">
                                        <div class="order_status_inner">
                                            <label for="orderStatusSelect" class="form-label">{{__('translate.Order status')}}</label>
                                            <select id="orderStatusSelect" class="form-select" data-current-status="{{ $order->order_status }}" aria-label="Order status" onchange="handleOrderStatusChange({{ $order->id }}, this.value)" name="order_status">
                                                <option value="1" {{ $order->order_status == 1 ? 'selected' : '' }}>{{ __('translate.Pending') }}</option>
                                                <option value="2" {{ $order->order_status == 2 ? 'selected' : '' }}>{{ __('translate.Confirmed') }}</option>
                                                <option value="3" {{ $order->order_status == 3 ? 'selected' : '' }}>{{ __('translate.Processing') }}</option>
                                                <option value="4" {{ $order->order_status == 4 ? 'selected' : '' }}>{{ __('translate.Food On The Way') }}</option>
                                                <option value="5" {{ $order->order_status == 5 ? 'selected' : '' }}>{{ __('translate.Delivered') }}</option>
                                                <option value="6" {{ $order->order_status == 6 ? 'selected' : '' }}>{{ __('translate.Cancel') }}</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="order_status_item">
                                        <div class="order_status_inner">
                                            <div class="form-group">
                                                <div class="d-flex align-items-center justify-content-between mb-1">
                                                    <label for="deliveryManSelect" class="form-label m-0">{{__('translate.Assign Delivery Man')}}</label>
                                                    @if($order->deliveryman)
                                                        <span class="badge bg-success small" style="font-size: 11px;">Assigned</span>
                                                    @else
                                                        <span class="badge bg-warning text-dark small" style="font-size: 11px;">Unassigned</span>
                                                    @endif
                                                </div>
                                                <select name="delivery_man_id" id="deliveryManSelect" class="form-control select2" onchange="showDeliveryManModal({{ $order->id }}, this.value)">
                                                    <option value="0" {{ $order->delivery_man_id == 0 ? 'selected' : '' }}>-- {{ __('translate.Unassigned (Open Pool)') }} --</option>
                                                    @foreach ($deliverymans as $deliveryman)
                                                    <option value="{{ $deliveryman->id }}" {{ $order->delivery_man_id == $deliveryman->id ? 'selected' : '' }}>
                                                        {{ $deliveryman->fname }} {{ $deliveryman->lname }}
                                                        @if($deliveryman->distance_km !== null)
                                                            ({{ $deliveryman->distance_km }} km)
                                                        @endif
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                    </div>

                    @php
                        $addressObj = is_string($order->delivery_address) ? json_decode($order->delivery_address) : (object) ($order->delivery_address ?? []);
                        $destLat = (float)($order?->address?->latitude ?? ($order?->address?->lat ?? ($addressObj?->latitude ?? ($addressObj?->lat ?? 0))));
                        $destLng = (float)($order?->address?->longitude ?? ($order?->address?->lon ?? ($addressObj?->longitude ?? ($addressObj?->lon ?? ($addressObj?->lng ?? 0)))));
                        if ($destLat == 0 && $destLng == 0 && $order->address_id) {
                            $fallbackAddr = \App\Models\UserAddress::find($order->address_id);
                            if ($fallbackAddr) {
                                $destLat = (float)($fallbackAddr->lat ?? 0);
                                $destLng = (float)($fallbackAddr->lon ?? 0);
                            }
                        }
                        $origLat = (float)($order->restaurant?->latitude ?? 0);
                        $origLng = (float)($order->restaurant?->longitude ?? 0);
                        if ($origLat == 0 && $origLng == 0 && $order->restaurant_id) {
                            $fallbackRest = \Modules\Restaurant\Entities\Restaurant::withoutGlobalScopes()->find($order->restaurant_id);
                            if ($fallbackRest) {
                                $origLat = (float)($fallbackRest->latitude ?? 0);
                                $origLng = (float)($fallbackRest->longitude ?? 0);
                            }
                        }
                        $navUrl = ($origLat != 0 && $destLat != 0) 
                            ? "https://www.google.com/maps/dir/?api=1&origin={$origLat},{$origLng}&destination={$destLat},{$destLng}"
                            : ($destLat != 0 ? "https://www.google.com/maps/search/?api=1&query={$destLat},{$destLng}" : "https://www.google.com/maps/search/?api=1&query=" . urlencode($order?->address?->address ?? ($addressObj?->address ?? '')));
                    @endphp

                    <!-- Nearby Delivery Partners Dispatch Panel -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="card shadow-sm border-0" style="border-radius: 14px; overflow: hidden; background: #ffffff;">
                                <div class="card-header bg-white py-3 px-4 d-flex align-items-center justify-content-between flex-wrap gap-2 border-bottom">
                                    <div class="d-flex align-items-center gap-2">
                                        <span class="rounded-circle d-flex align-items-center justify-content-center text-white" style="width: 34px; height: 34px; background: #0284c7;">
                                            <i class="fas fa-motorcycle" style="font-size: 15px;"></i>
                                        </span>
                                        <div>
                                            <h4 class="m-0 fw-bold" style="font-size: 16px; color: #1e293b;">
                                                {{ __('translate.Nearby Delivery Partners (Proximity to Restaurant)') }}
                                            </h4>
                                            <div class="text-muted small">
                                                {{ __('translate.Sorted by real-time distance from pickup restaurant') }}: <strong>{{ $order->restaurant?->restaurant_name ?? ($order->restaurant?->name ?? 'Restaurant') }}</strong>
                                            </div>
                                        </div>
                                    </div>

                                    @if($order->deliveryman)
                                        <div class="d-flex align-items-center gap-2">
                                            <span class="badge bg-success py-2 px-3 fw-bold" style="font-size: 13px;">
                                                <i class="fas fa-check-circle me-1"></i> Assigned: {{ $order->deliveryman->fname }} {{ $order->deliveryman->lname }}
                                            </span>
                                            <a href="tel:{{ $order->deliveryman->phone }}" class="btn btn-sm btn-outline-success py-1 px-2 fw-semibold" style="font-size: 12px; border-radius: 6px;">
                                                <i class="fas fa-phone me-1"></i> {{ $order->deliveryman->phone }}
                                            </a>
                                        </div>
                                    @else
                                        <span class="badge bg-warning text-dark py-2 px-3 fw-bold" style="font-size: 13px; border-radius: 6px;">
                                            <i class="fas fa-satellite-dish me-1"></i> {{ __('translate.Unassigned - Open Broadcast Pool') }}
                                        </span>
                                    @endif
                                </div>

                                <div class="card-body p-3" style="background: #f8fafc;">
                                    <div class="row g-3">
                                        @forelse ($deliverymans as $dm)
                                            <div class="col-xl-4 col-md-6">
                                                <div class="p-3 bg-white rounded-3 h-100 d-flex flex-column justify-content-between shadow-sm position-relative" style="border: {{ $dm->is_assigned ? '2px solid #16a34a' : '1px solid #e2e8f0' }}; border-radius: 12px;">
                                                    @if($dm->is_assigned)
                                                        <span class="badge bg-success position-absolute top-0 end-0 m-2" style="font-size: 11px;">
                                                            <i class="fas fa-check me-1"></i> Assigned
                                                        </span>
                                                    @endif

                                                    <div>
                                                        <div class="d-flex align-items-start gap-3 mb-2">
                                                            <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold flex-shrink-0" style="width: 44px; height: 44px; background: {{ $dm->is_assigned ? '#16a34a' : '#0284c7' }}; font-size: 16px;">
                                                                {{ strtoupper(substr($dm->fname ?? 'D', 0, 1)) }}{{ strtoupper(substr($dm->lname ?? 'M', 0, 1)) }}
                                                            </div>
                                                            <div class="flex-grow-1 min-w-0">
                                                                <h5 class="m-0 fw-bold text-dark text-truncate" style="font-size: 15px;">
                                                                    {{ $dm->fname }} {{ $dm->lname }}
                                                                </h5>
                                                                <div class="text-muted small mt-1">
                                                                    <a href="tel:{{ $dm->phone }}" class="text-decoration-none text-muted">
                                                                        <i class="fas fa-phone-alt me-1 text-primary"></i> {{ $dm->phone ?? 'N/A' }}
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex align-items-center flex-wrap gap-2 my-2">
                                                            <!-- Distance Badge -->
                                                            @if($dm->distance_km !== null)
                                                                <span class="badge" style="background: #e0f2fe; color: #0369a1; font-weight: 600; font-size: 12px;">
                                                                    <i class="fas fa-motorcycle me-1"></i> {{ $dm->distance_km }} km to pickup
                                                                </span>
                                                            @else
                                                                <span class="badge bg-light text-muted border" style="font-size: 11px;">
                                                                    <i class="fas fa-map-marker-alt me-1"></i> Location pending
                                                                </span>
                                                            @endif

                                                            <!-- Workload / Status Badge -->
                                                            @if($dm->active_orders_count > 0)
                                                                <span class="badge bg-warning text-dark" style="font-size: 11px;">
                                                                    <i class="fas fa-box me-1"></i> {{ $dm->active_orders_count }} on delivery
                                                                </span>
                                                            @else
                                                                <span class="badge bg-success text-white" style="font-size: 11px;">
                                                                    <i class="fas fa-circle me-1" style="font-size: 8px;"></i> Available
                                                                </span>
                                                            @endif

                                                            @if($dm->is_online)
                                                                <span class="badge bg-success-subtle text-success border border-success-subtle" style="font-size: 11px;">Active</span>
                                                            @endif
                                                        </div>
                                                    </div>

                                                    <div class="mt-2 pt-2 border-top">
                                                        @if($dm->is_assigned)
                                                            <button type="button" class="btn btn-outline-danger btn-sm w-100 fw-bold" onclick="showDeliveryManModal({{ $order->id }}, 0, 'Unassigned Pool')">
                                                                <i class="fas fa-user-minus me-1"></i> {{ __('translate.Unassign Partner') }}
                                                            </button>
                                                        @else
                                                            <button type="button" class="btn btn-sm btn-primary w-100 fw-bold d-flex align-items-center justify-content-center gap-1" onclick="showDeliveryManModal({{ $order->id }}, {{ $dm->id }}, '{{ addslashes($dm->fname . ' ' . $dm->lname) }}')">
                                                                <i class="fas fa-user-check"></i>
                                                                <span>{{ $order->deliveryman ? __('translate.Reassign to this Partner') : __('translate.Assign to this Partner') }}</span>
                                                            </button>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        @empty
                                            <div class="col-12 text-center py-4 text-muted">
                                                <i class="fas fa-motorcycle fs-3 mb-2"></i>
                                                <p class="m-0">{{ __('translate.No delivery partners registered in the system yet.') }}</p>
                                            </div>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="zum_icvoice_item_main">
                                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-3">
                                    <div class="d-flex align-items-center gap-2">
                                        <h4 class="m-0" style="font-size: 16px; font-weight: 700;">
                                            <i class="fa fa-map-marked-alt text-primary me-2"></i> {{ __('translate.Live Delivery Route & Location Map') }}
                                        </h4>
                                        <span class="badge" id="adminRouteStatsBadge" style="background: #e0f2fe; color: #0284c7; font-weight: 600; font-size: 12px; padding: 5px 10px; border-radius: 6px;">
                                            <i class="fa fa-route me-1"></i> {{ __('translate.Calculating Route...') }}
                                        </span>
                                    </div>
                                    <a href="{{ $navUrl }}" target="_blank" class="crancy-btn btn-sm d-inline-flex align-items-center gap-1" style="background: #ea580c; color: #fff; text-decoration: none; padding: 6px 14px; font-size: 13px; border-radius: 6px;">
                                        <i class="fa fa-location-arrow"></i> {{ __('translate.Open in Navigation') }}
                                    </a>
                                </div>
                                <div id="admin_order_details_map" style="height: 300px; width: 100%; border-radius: 12px; border: 1.5px solid #cbd5e1; z-index: 1;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="tabel_main mb-3 overflow-x-auto">
                                <table class="crancy-table__main crancy-table__main-v3">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>{{__('translate.Product')}}</th>
                                        <th>{{__('translate.Variant')}}</th>
                                        <th>{{__('translate.Restaurant')}}</th>
                                        <th>{{__('translate.Unit Price')}}</th>
                                        <th>{{__('translate.Quantity')}}</th>
                                        <th>{{__('translate.Total')}}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @php
                                        $total = 0;
                                        $calculate = 0;
                                    @endphp
                                    @foreach($order->items ?? [] as $key => $order_item)
                                        @php
                                            $product = Modules\Product\App\Models\Product::find($order_item->product_id ?? $order_item['product_id']);
                                            $total += (float) ($order_item->total ?? 0);
                                            $sizes = [];
                                            if (!empty($order_item['size'])) {
                                                $decodedSize = json_decode($order_item['size'], true);
                                                $sizes = is_array($decodedSize) ? $decodedSize : [];
                                            }
                                            $addonsList = [];
                                            if (!empty($order_item['addons'])) {
                                                $decodedAddons = json_decode($order_item['addons'], true);
                                                $addonsList = is_array($decodedAddons) ? $decodedAddons : [];
                                            }
                                        @endphp
                                        <tr>
                                            <td>{{$key + 1}}</td>
                                            <td>
                                                @if($product)
                                                    <a target="_blank" href="{{ route('admin.product.edit', ['product' => $product->id, 'lang_code' => admin_lang()] ) }}">{{$product->name}}</a>
                                                @else
                                                    <span>{{ $order_item->product_name ?? 'Product #' . ($order_item->product_id ?? '') }}</span>
                                                @endif
                                            </td>
                                            <td>
                                                <div class="tabel_modal_main">
                                                    @foreach ($sizes as $size => $price)
                                                        {{__('translate.Size')}} : {{ $size }}
                                                    @endforeach
                                                    @if(!empty($addonsList))
                                                    <span data-bs-toggle="modal" data-bs-target="#exampleModal{{$key}}">
                                                        {{__('translate.See more')}}
                                                    </span>
                                                    @endif
                                                </div>
                                            </td>
                                            <td>
                                                {{$order?->restaurant?->restaurant_name ?? ''}}
                                            </td>
                                            <td>
                                                @if(!empty($sizes))
                                                    @foreach ($sizes as $size => $price)
                                                        {{(currency($price))}}
                                                    @endforeach
                                                @else
                                                    {{ currency($order_item->unit_price ?? $order_item->price ?? 0) }}
                                                @endif
                                            </td>
                                            <td>{{$order_item->qty}}</td>
                                            <td>{{currency($order_item->total)}}</td>
                                        </tr>

                                        @if(!empty($addonsList))
                                        <!-- Modal 2 -->
                                        <div class="modal adon_modal_main fade" id="exampleModal{{$key}}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">{{__('translate.See Addon')}}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <ul class="modal_adon">
                                                            @foreach ($addonsList as $addonId => $quantity)
                                                                @php
                                                                    $addon = Modules\Addon\App\Models\Addon::find($addonId);
                                                                    if ($addon) {
                                                                        $calculate += ($addon->price * (int)$quantity);
                                                                    }
                                                                @endphp
                                                                @if ($addon)
                                                                    <li> {{ $addon->name }}
                                                                        ({{ currency($addon->price) }}
                                                                        * {{ $quantity }})</li>
                                                                @endif

                                                            @endforeach
                                                        </ul>
                                                    </div>
                                                    <div class="modal_btn_main">
                                                        <button type="button" data-bs-dismiss="modal" aria-label="Close" class="modal_btn">{{__('translate.Close')}}</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        @endif
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="tabel_btm">
                                <ul class="tabel_btm_list">
                                    <li><span>{{__('translate.Subtotal')}} : </span>{{currency($total)}}</li>
                                    <li><span>{{__('translate.Discount')}} (-) </span>: {{currency($order->discount_amount)}}</li>
                                    <li><span>{{__('translate.Delivery Charge')}} :</span> {{currency($order->delivery_charge)}}</li>
                                    <li>{{__('translate.Total')}} : {{currency($order->grand_total)}}</li>
                                </ul>

                                <div class="tabel_btm_btn_main">

                                    <a onclick="itemDeleteConfrimation({{ $order->id }})" href="javascript:;" data-bs-toggle="modal" data-bs-target="#deleteModal" class="crancy-btn delete_danger_btn"><i class="fas fa-trash"></i> {{ __('translate.Delete') }}</a>




                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

    <!-- Modal -->
    <div class="modal fade" id="deleteModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">{{ __('translate.Status Change Confirmation') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __('translate.Are you sure you want to change the status of this item?') }}</p>
                </div>
                <div class="modal-footer">
                    <form action="" id="item_delect_confirmation1" class="delet_modal_form" method="POST">
                        @csrf
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-primary">{{ __('translate.Yes, Change') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div class="modal fade" id="paymentConfirmationModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentModalLabel">{{ __('translate.Payment Status Change Confirmation') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __('translate.Are you sure you want to change the payment status of this order?') }}</p>
                </div>
                <div class="modal-footer">
                    <form action="" id="paymentConfirmationForm" class="delet_modal_form" method="POST">
                        @csrf
                        <input type="hidden" name="payment_status" id="newPaymentStatus">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-primary">{{ __('translate.Yes, Change') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delivery Partner Assignment Confirmation Modal -->
    <div class="modal fade" id="showDeliveryManModal" tabindex="-1" aria-labelledby="showDeliveryManModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 14px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.15);">
                <div class="modal-header border-0 pb-0">
                    <h5 class="modal-title fw-bold" id="showDeliveryManModalLabel">
                        <i class="fas fa-motorcycle text-primary me-2"></i> {{ __('translate.Assign Delivery Partner') }}
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" id="showDeliveryManForm" class="delet_modal_form" method="POST">
                    @csrf
                    <input type="hidden" name="delivery_man_id" id="newDelivery_id">
                    <div class="modal-body py-3">
                        <p class="text-secondary mb-3">{{ __('translate.Are you sure you want to assign this order to') }}:</p>
                        <div class="p-3 rounded-3 mb-2" style="background: #f8fafc; border: 1px solid #e2e8f0;">
                            <div class="d-flex align-items-center gap-2">
                                <span class="rounded-circle d-flex align-items-center justify-content-center text-white" style="width: 32px; height: 32px; background: #0284c7;">
                                    <i class="fas fa-user"></i>
                                </span>
                                <strong class="text-dark fs-6" id="modalRiderName">Selected Partner</strong>
                            </div>
                        </div>
                        <small class="text-muted"><i class="fas fa-info-circle me-1"></i> {{ __('translate.The rider will be notified in real-time and this order will appear in their running orders.') }}</small>
                    </div>
                    <div class="modal-footer border-0 pt-0">
                        <button type="button" class="btn btn-secondary px-3" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-primary px-4 fw-bold">{{ __('translate.Yes, Confirm Assignment') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


@endsection

@push('style_section')
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
    <style>
        .foodigo-leaflet-div-icon {
            background: none !important;
            border: none !important;
        }
        .foodigo-map-pin {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            background: #ea580c;
            border: 2px solid #ffffff;
            border-radius: 50% 50% 50% 0;
            transform: rotate(-45deg);
            box-shadow: 0 4px 10px rgba(0,0,0,0.35);
        }
        .foodigo-map-pin.pin-rest {
            background: #0284c7;
        }
        .foodigo-map-pin i {
            transform: rotate(45deg);
            color: #ffffff;
            font-size: 14px;
        }
    </style>
@endpush

@push('js_section')
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
    <script>
        "use strict";

        function itemDeleteConfrimation(id){
            $("#item_delect_confirmation").attr("action",'{{ url("admin/order-delete/") }}'+"/"+id)
        }

        document.addEventListener("DOMContentLoaded", function() {
            const mapEl = document.getElementById('admin_order_details_map');
            if (!mapEl) return;

            const destLat = parseFloat("{{ $destLat }}") || 0;
            const destLng = parseFloat("{{ $destLng }}") || 0;
            const origLat = parseFloat("{{ $origLat }}") || 0;
            const origLng = parseFloat("{{ $origLng }}") || 0;
            const orderStatus = parseInt("{{ $order->order_status }}") || 1;
            const hasDeliveryman = {{ $order->deliveryman ? 'true' : 'false' }};
            const riderName = "{{ addslashes($order->deliveryman ? ($order->deliveryman->fname . ' ' . $order->deliveryman->lname) : '') }}";
            const riderPhone = "{{ addslashes($order->deliveryman?->phone ?? '') }}";

            const initialLat = origLat || destLat || 7.4250;
            const initialLng = origLng || destLng || 3.9050;

            const map = L.map('admin_order_details_map', {
                center: [initialLat, initialLng],
                zoom: 14,
                zoomControl: true,
                attributionControl: false
            });

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19
            }).addTo(map);

            const destPin = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin"><i class="fa-solid fa-location-dot"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            const restPin = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin pin-rest" style="background:#0284c7;"><i class="fa-solid fa-utensils"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            const riderPin = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin pin-rider" style="background:#16a34a;"><i class="fa-solid fa-motorcycle"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            const nearbyRiderPin = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin pin-rider" style="background:#0284c7;"><i class="fa-solid fa-motorcycle"></i></div>',
                iconSize: [32, 32],
                iconAnchor: [16, 32],
                popupAnchor: [0, -32]
            });

            const markers = [];

            if (origLat !== 0 && origLng !== 0) {
                const restMarker = L.marker([origLat, origLng], { icon: restPin }).addTo(map);
                restMarker.bindPopup(`<b>🏪 {{ addslashes($order->restaurant?->restaurant_name ?? __('translate.Restaurant')) }}</b><br><small>{{ addslashes($order->restaurant?->address ?? '') }}</small>`);
                markers.push(restMarker);
            }

            if (destLat !== 0 && destLng !== 0) {
                const destMarker = L.marker([destLat, destLng], { icon: destPin }).addTo(map);
                destMarker.bindPopup(`<b>📍 {{ __('translate.Delivery Destination') }}</b><br><small>{{ addslashes($order?->address?->address ?? ($addressObj?->address ?? '')) }}</small>`).openPopup();
                markers.push(destMarker);
            }

            // Plot nearby delivery partners on the map
            const nearbyRidersData = @json($deliverymans->map(function($dm) {
                return [
                    'id' => $dm->id,
                    'name' => $dm->fname . ' ' . $dm->lname,
                    'phone' => $dm->phone,
                    'latitude' => (float)$dm->latitude,
                    'longitude' => (float)$dm->longitude,
                    'distance_km' => $dm->distance_km,
                    'active_orders_count' => $dm->active_orders_count,
                    'is_online' => $dm->is_online,
                    'is_assigned' => $dm->is_assigned
                ];
            }));

            nearbyRidersData.forEach(function(rider) {
                if (rider.latitude && rider.longitude && rider.latitude !== 0 && rider.longitude !== 0) {
                    const pin = rider.is_assigned ? riderPin : nearbyRiderPin;
                    const marker = L.marker([rider.latitude, rider.longitude], { icon: pin }).addTo(map);

                    let popupHtml = '<div style="min-width: 180px; padding: 2px;">' +
                        '<div style="font-weight: 700; font-size: 14px;">🛵 ' + rider.name + '</div>';
                    if (rider.distance_km !== null) {
                        popupHtml += '<span class="badge" style="background: #e0f2fe; color: #0284c7; font-size: 11px; margin: 4px 0;">' + rider.distance_km + ' km to pickup</span><br>';
                    }
                    if (rider.phone) {
                        popupHtml += '<small><a href="tel:' + rider.phone + '" style="color: #0284c7; text-decoration: none;">📞 ' + rider.phone + '</a></small><br>';
                    }
                    if (rider.is_assigned) {
                        popupHtml += '<span class="badge bg-success text-white mt-1 py-1 px-2 d-inline-block">Assigned to this Order</span>';
                    } else {
                        popupHtml += '<button type="button" class="btn btn-sm btn-primary w-100 mt-2 py-1 fw-bold" style="font-size: 12px;" onclick="showDeliveryManModal({{ $order->id }}, ' + rider.id + ', \'' + rider.name.replace(/'/g, "\\'") + '\')">Assign Order</button>';
                    }
                    popupHtml += '</div>';

                    marker.bindPopup(popupHtml);
                    markers.push(marker);
                }
            });

            const statsBadge = document.getElementById('adminRouteStatsBadge');

            function drawFallbackDirectRoute() {
                if (origLat !== 0 && destLat !== 0) {
                    const line = L.polyline([[origLat, origLng], [destLat, destLng]], {
                        color: '#ea580c',
                        dashArray: '6, 8',
                        weight: 3.5,
                        opacity: 0.85
                    }).addTo(map);

                    if (hasDeliveryman && orderStatus === 4) {
                        const midLat = (origLat + destLat) / 2;
                        const midLng = (origLng + destLng) / 2;
                        const riderMarker = L.marker([midLat, midLng], { icon: riderPin }).addTo(map);
                        riderMarker.bindPopup(`<b>🛵 {{ __('translate.Delivery Partner') }}:</b> ${riderName}<br><small><a href="tel:${riderPhone}">📞 ${riderPhone}</a></small><br><span class="badge bg-success text-white mt-1">{{ __('translate.Food on the way') }}</span>`);
                        markers.push(riderMarker);
                    }

                    const group = L.featureGroup(markers.concat(line));
                    map.fitBounds(group.getBounds().pad(0.2));

                    if (statsBadge) {
                        statsBadge.innerHTML = `<i class="fa-solid fa-route me-1"></i> {{ __('translate.Live Route Connected') }}`;
                    }
                } else if (markers.length === 1) {
                    map.setView(markers[0].getLatLng(), 15);
                }
            }

            if (origLat !== 0 && origLng !== 0 && destLat !== 0 && destLng !== 0) {
                const osrmUrl = `https://router.project-osrm.org/route/v1/driving/${origLng},${origLat};${destLng},${destLat}?overview=full&geometries=geojson`;
                fetch(osrmUrl)
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.code === 'Ok' && data.routes && data.routes.length > 0) {
                            const route = data.routes[0];
                            const distKm = (route.distance / 1000).toFixed(1);
                            const durMin = Math.max(1, Math.round(route.duration / 60));

                            if (statsBadge) {
                                statsBadge.innerHTML = `<i class="fa-solid fa-car me-1"></i> ${distKm} km • ~${durMin} mins`;
                                statsBadge.style.background = '#dcfce7';
                                statsBadge.style.color = '#15803d';
                            }

                            const routeCoords = route.geometry.coordinates.map(pt => [pt[1], pt[0]]);
                            
                            // Road casing (glow outline)
                            L.polyline(routeCoords, { color: '#c2410c', weight: 6, opacity: 0.3 }).addTo(map);
                            // Main vibrant route line
                            const routeLine = L.polyline(routeCoords, { color: '#ea580c', weight: 4, opacity: 0.95 }).addTo(map);

                            // Add Delivery Rider marker on route
                            if (hasDeliveryman && orderStatus === 4 && routeCoords.length > 2) {
                                const midIdx = Math.floor(routeCoords.length / 2);
                                const riderMarker = L.marker(routeCoords[midIdx], { icon: riderPin }).addTo(map);
                                riderMarker.bindPopup(`<b>🛵 {{ __('translate.Delivery Partner') }}:</b> ${riderName}<br><small><a href="tel:${riderPhone}">📞 ${riderPhone}</a></small><br><span class="badge bg-success text-white mt-1">{{ __('translate.Food on the way') }}</span>`);
                                markers.push(riderMarker);
                            }

                            const group = L.featureGroup(markers.concat(routeLine));
                            map.fitBounds(group.getBounds().pad(0.2));
                        } else {
                            drawFallbackDirectRoute();
                        }
                    })
                    .catch(() => {
                        drawFallbackDirectRoute();
                    });
            } else {
                drawFallbackDirectRoute();
            }

            setTimeout(() => { map.invalidateSize(); }, 300);
            window.addEventListener('resize', () => { map.invalidateSize(); });
        });

        function handleOrderStatusChange(orderId, selectedValue) {
            var $select = $('#orderStatusSelect');
            var prevStatus = $select.data('current-status');

            $.ajax({
                url: '{{ url("admin/order-status-change") }}/' + orderId,
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    order_status: selectedValue
                },
                dataType: 'json',
                beforeSend: function() {
                    $select.prop('disabled', true);
                },
                success: function(res) {
                    $select.prop('disabled', false);
                    if(res && res.status === 'success') {
                        $select.data('current-status', selectedValue);
                        var badgeText = $select.find('option:selected').text();
                        var badgeClass = (selectedValue == 2 || selectedValue == 5) ? 'badge bg-success text-white' : ((selectedValue == 4) ? 'badge bg-inprocees text-white' : 'badge bg-warning text-white');
                        var $badge = $('#orderStatusDisplayBadge');
                        if($badge.length) {
                            $badge.attr('class', badgeClass).text(badgeText);
                        }
                        toastr.success(res.message);
                    } else {
                        toastr.error((res && res.message) ? res.message : 'Failed to update order status');
                        $select.val(prevStatus);
                    }
                },
                error: function() {
                    $select.prop('disabled', false);
                    $select.val(prevStatus);
                    toastr.error('Error updating order status. Please check your connection.');
                }
            });
        }

        function handlePaymentStatusChange(orderId, selectedValue) {
            var $select = $('#paymentStatusSelect');
            var prevStatus = $select.data('current-status');

            $.ajax({
                url: '{{ url("admin/payment-status-change") }}/' + orderId,
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    payment_status: selectedValue
                },
                dataType: 'json',
                beforeSend: function() {
                    $select.prop('disabled', true);
                },
                success: function(res) {
                    $select.prop('disabled', false);
                    if(res && res.status === 'success') {
                        $select.data('current-status', selectedValue);
                        toastr.success(res.message);
                    } else {
                        toastr.error((res && res.message) ? res.message : 'Failed to update payment status');
                        $select.val(prevStatus);
                    }
                },
                error: function() {
                    $select.prop('disabled', false);
                    $select.val(prevStatus);
                    toastr.error('Error updating payment status.');
                }
            });
        }

        function showConfirmationModal(orderId, selectedValue) {
            handleOrderStatusChange(orderId, selectedValue);
        }

        function showPaymentConfirmationModal(orderId, selectedValue) {
            handlePaymentStatusChange(orderId, selectedValue);
        }

        function showDeliveryManModal(orderId, selectedValue, riderName) {
            $("#showDeliveryManForm").attr("action", '{{ url("admin/deliveryman/") }}' + "/" + orderId);
            $("#newDelivery_id").val(selectedValue);
            if (riderName) {
                $("#modalRiderName").text(riderName);
            } else {
                const optText = $("#deliveryManSelect option[value='" + selectedValue + "']").text();
                $("#modalRiderName").text(optText || "Selected Partner");
            }
            $('#showDeliveryManModal').modal('show');
        }
    </script>
@endpush
