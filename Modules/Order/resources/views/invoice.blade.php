@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Order Invoice') }} #{{ $order->id }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Order Invoice') }} #{{ $order->id }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Order') }} >> {{ __('translate.Invoice') }}</p>
@endsection

@section('body-content')
    <section class="crancy-adashboard crancy-show mt-4">
        <div class="container container__bscreen">
            <div class="crancy-product-card p-4 p-md-5 bg-white rounded shadow-sm">
                <!-- Action Buttons -->
                <div class="d-flex justify-content-between align-items-center mb-4 no-print">
                    <a href="{{ route('admin.order.details', $order->id) }}" class="crancy-btn btn-secondary">
                        <i class="fas fa-arrow-left me-1"></i> {{ __('translate.Back to Order') }}
                    </a>
                    <button onclick="window.print()" class="crancy-btn btn-primary">
                        <i class="fas fa-print me-1"></i> {{ __('translate.Print Invoice') }}
                    </button>
                </div>

                <!-- Invoice Header -->
                <div class="row pb-4 border-bottom mb-4 align-items-center">
                    <div class="col-sm-6">
                        <img src="{{ asset($general_setting->logo ?? '') }}" alt="Logo" style="max-height: 55px;" class="mb-2">
                        <p class="text-muted mb-0">{{ $general_setting->app_name ?? config('app.name') }}</p>
                    </div>
                    <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">
                        <h3 class="text-primary mb-1">{{ __('translate.INVOICE') }}</h3>
                        <p class="mb-1"><strong>{{ __('translate.Order ID') }}:</strong> #{{ $order->id }}</p>
                        <p class="mb-1"><strong>{{ __('translate.Date') }}:</strong> {{ $order->created_at?->format('d M, Y h:i A') }}</p>
                        <p class="mb-0"><strong>{{ __('translate.Payment Status') }}:</strong> 
                            <span class="badge {{ $order->payment_status == 'success' ? 'bg-success' : 'bg-warning' }} text-white">
                                {{ ucfirst($order->payment_status ?? 'pending') }}
                            </span>
                        </p>
                    </div>
                </div>

                <!-- Addresses Row -->
                @php
                    $address = is_string($order->delivery_address) ? json_decode($order->delivery_address) : (object) ($order->delivery_address ?? []);
                @endphp
                <div class="row mb-4">
                    <div class="col-sm-4 mb-3 mb-sm-0">
                        <h5 class="text-dark mb-2">{{ __('translate.Customer Information') }}</h5>
                        <p class="mb-1"><strong>{{ $address?->contact_person_name ?? $order->user?->name ?? 'Guest' }}</strong></p>
                        <p class="mb-1 text-muted">{{ $address?->contact_person_email ?? $order->user?->email ?? '' }}</p>
                        <p class="mb-1 text-muted">{{ $address?->contact_person_number ?? $order->user?->phone ?? '' }}</p>
                        @if(!empty($address?->address))
                            <p class="mb-0 text-muted">{{ $address->address }}</p>
                        @endif
                    </div>
                    <div class="col-sm-4 mb-3 mb-sm-0">
                        <h5 class="text-dark mb-2">{{ __('translate.Restaurant') }}</h5>
                        <p class="mb-1"><strong>{{ $order->restaurant?->restaurant_name ?? 'N/A' }}</strong></p>
                        <p class="mb-1 text-muted">{{ $order->restaurant?->email ?? '' }}</p>
                        <p class="mb-1 text-muted">{{ $order->restaurant?->phone ?? '' }}</p>
                        <p class="mb-0 text-muted">{{ $order->restaurant?->address ?? '' }}</p>
                    </div>
                    <div class="col-sm-4">
                        <h5 class="text-dark mb-2">{{ __('translate.Order Details') }}</h5>
                        <p class="mb-1"><strong>{{ __('translate.Type') }}:</strong> {{ ucfirst($order->order_type ?? 'delivery') }}</p>
                        <p class="mb-1"><strong>{{ __('translate.Payment Method') }}:</strong> {{ ucfirst($order->payment_method ?? 'Cash') }}</p>
                        @if($order->deliveryman)
                            <p class="mb-0"><strong>{{ __('translate.Delivery Man') }}:</strong> {{ $order->deliveryman->fname }} {{ $order->deliveryman->lname }}</p>
                        @endif
                    </div>
                </div>

                <!-- Items Table -->
                <div class="table-responsive mb-4">
                    <table class="table table-bordered table-striped">
                        <thead class="bg-light">
                            <tr>
                                <th class="text-center" style="width: 50px;">#</th>
                                <th>{{ __('translate.Product') }}</th>
                                <th>{{ __('translate.Variant / Addons') }}</th>
                                <th class="text-end">{{ __('translate.Unit Price') }}</th>
                                <th class="text-center">{{ __('translate.Qty') }}</th>
                                <th class="text-end">{{ __('translate.Total') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php $calcSubtotal = 0; @endphp
                            @foreach($order->items ?? [] as $idx => $item)
                                @php
                                    $calcSubtotal += (float) ($item->total ?? 0);
                                    $product = Modules\Product\App\Models\Product::find($item->product_id ?? $item['product_id']);
                                    $sizes = !empty($item['size']) ? (json_decode($item['size'], true) ?: []) : [];
                                    $addons = !empty($item['addons']) ? (json_decode($item['addons'], true) ?: []) : [];
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $idx + 1 }}</td>
                                    <td>
                                        <strong>{{ $product?->name ?? $item->product_name ?? 'Item' }}</strong>
                                    </td>
                                    <td>
                                        @foreach($sizes as $sizeName => $sizePrice)
                                            <div><small class="text-muted">{{ __('translate.Size') }}: {{ $sizeName }} ({{ currency($sizePrice) }})</small></div>
                                        @endforeach
                                        @foreach($addons as $addonId => $addonQty)
                                            @php $addon = Modules\Addon\App\Models\Addon::find($addonId); @endphp
                                            @if($addon)
                                                <div><small class="text-muted">+ {{ $addon->name }} x {{ $addonQty }} ({{ currency($addon->price * (int)$addonQty) }})</small></div>
                                            @endif
                                        @endforeach
                                    </td>
                                    <td class="text-end">{{ currency($item->unit_price ?? $item->price ?? 0) }}</td>
                                    <td class="text-center">{{ $item->qty }}</td>
                                    <td class="text-end"><strong>{{ currency($item->total) }}</strong></td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <!-- Invoice Summary -->
                <div class="row justify-content-end">
                    <div class="col-md-5 col-lg-4">
                        <div class="border rounded p-3 bg-light">
                            <div class="d-flex justify-content-between mb-2">
                                <span>{{ __('translate.Subtotal') }}:</span>
                                <span>{{ currency($calcSubtotal) }}</span>
                            </div>
                            @if((float)($order->discount_amount ?? 0) > 0)
                                <div class="d-flex justify-content-between mb-2 text-danger">
                                    <span>{{ __('translate.Discount') }}:</span>
                                    <span>-{{ currency($order->discount_amount) }}</span>
                                </div>
                            @endif
                            <div class="d-flex justify-content-between mb-2">
                                <span>{{ __('translate.Delivery Charge') }}:</span>
                                <span>{{ currency($order->delivery_charge ?? 0) }}</span>
                            </div>
                            <hr class="my-2">
                            <div class="d-flex justify-content-between fs-5 fw-bold text-dark">
                                <span>{{ __('translate.Grand Total') }}:</span>
                                <span>{{ currency($order->grand_total ?? $calcSubtotal) }}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-5 text-center text-muted small border-top pt-3">
                    <p class="mb-0">{{ __('translate.Thank you for choosing') }} {{ $general_setting->app_name ?? config('app.name') }}.</p>
                </div>
            </div>
        </div>
    </section>

    <style>
        @media print {
            .no-print, .crancy-sidebar, .crancy-header, .crancy-footer, #preloader {
                display: none !important;
            }
            .crancy-adashboard {
                margin: 0 !important;
                padding: 0 !important;
            }
            body {
                background: #fff !important;
            }
        }
    </style>
@endsection
