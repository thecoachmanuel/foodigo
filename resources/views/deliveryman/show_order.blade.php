@extends('deliveryman.master_layout')
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

                    <div class="row mb-4">
                        <div class="col-lg-6 col-md-6 mb-4 mb-lg-0">
                            <div class="zum_icvoice_item_main h-100">
                                @if($order->order_type == 'delivery')
                                    <div class="zum_invoice_text">
                                        <h2>{{__('translate.Billing Address')}}</h2>
                                    </div>
                                    <div class="zum_icvoice_item">
                                        <ul class="zum_invoice_lixt">
                                            <li>{{__('translate.Full Name')}} : <span>{{$addressObj->contact_person_name ?? ($order->user->name ?? '')}}</span></li>
                                            <li>
                                                <a href="mailto:{{$addressObj->contact_person_email ?? ''}} ">
                                                    {{__('translate.Email')}} : <span> {{$addressObj->contact_person_email ?? ''}} </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="tel:{{$addressObj->contact_person_number ?? ''}}">
                                                    {{__('translate.Phone')}} : <span> {{$addressObj->contact_person_number ?? ''}}</span>
                                                </a>
                                            </li>
                                            <li>
                                                {{__('translate.Address')}} : <span> {{$order?->address?->address ?? ($addressObj->address ?? '')}} </span>
                                            </li>
                                        </ul>
                                    </div>
                                @endif
                                <div class="zum_icvoice_item">
                                    <h2>{{__('translate.Payment Information')}}:</h2>
                                    <ul class="zum_invoice_lixt">
                                        <li>{{__('translate.Method')}} : <span>{{$order->payment_method}}</span></li>
                                        <li>
                                            @if($order->payment_status == 'success')
                                                <a href="javascript:;">
                                                    {{__('translate.State')}} :<span class="tag">{{$order->payment_status}}</span>
                                                </a>
                                            @else
                                                <a href="javascript:;">
                                                    {{__('translate.State')}} :<span
                                                        class="tag denger">{{$order->payment_status}}</span>
                                                </a>
                                            @endif
                                        </li>
                                        <li>
                                            {{__('translate.Transaction')}} <span> {!! clean(nl2br($order->tnx_info)) !!}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            @if($order->order_type == 'pickup')
                                <p><strong>{{__('translate.Contact person name')}} : </strong> {{$addressObj->contact_person_name ?? ''}}</p>
                                <p><strong>{{__('translate.Contact person phone')}} : </strong> {{$addressObj->contact_person_number ?? ''}}</p>
                                <p><strong>{{__('translate.Contact person email')}} : </strong> {{$addressObj->contact_person_email ?? ''}}</p>
                            @endif
                        </div>

                        <div class="col-lg-6 col-md-6">
                            <div class="zum_icvoice_item_main h-100">
                                @if($order->order_type == 'delivery')
                                    <div class="zum_invoice_text">
                                        <h2>{{__('translate.Shipping Information')}}</h2>
                                    </div>
                                    <div class="zum_icvoice_item">
                                        <ul class="zum_invoice_lixt">
                                            <li>{{__('translate.Full Name')}} : <span>{{$addressObj->contact_person_name ?? ($order->user->name ?? '')}}</span></li>
                                            <li>
                                                <a href="mailto:{{$addressObj->contact_person_email ?? ''}}">
                                                    {{__('translate.Email')}} : <span> {{$addressObj->contact_person_email ?? ''}}</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="tel:{{$addressObj->contact_person_number ?? ''}}">
                                                    {{__('translate.Phone')}} : <span> {{$addressObj->contact_person_number ?? ''}} </span>
                                                </a>
                                            </li>
                                            <li>
                                                {{__('translate.Address')}} : <span>{{$order?->address?->address ?? ($addressObj->address ?? '')}}</span>
                                            </li>
                                        </ul>
                                    </div>
                                @endif
                                <div class="zum_icvoice_item">
                                    <h2>{{__('translate.Order Information')}}:</h2>
                                    <ul class="zum_invoice_lixt">
                                        <li>{{__('translate.Date')}} : <span>{{$order->created_at->format('F j, Y') }}</span></li>
                                        <li>
                                            {{__('translate.Shipping')}} : <span> {{__('translate.Fixed Shipping')}}</span>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                @if($order->order_status == 1)
                                                    {{__('translate.State')}} : <span class="badge bg-warning text-white">{{__('translate.Pending')}}</span>
                                                @elseif($order->order_status == 2)
                                                    {{__('translate.State')}} : <span
                                                        class="badge bg-success text-white">{{__('translate.Confirmed')}}</span>
                                                @elseif($order->order_status == 3)
                                                    {{__('translate.State')}} : <span
                                                        class="badge bg-warning text-white">{{__('translate.Processing')}}</span>
                                                @elseif($order->order_status == 4)
                                                    {{__('translate.State')}} : <span
                                                        class="badge bg-inprocees text-white">{{__('translate.Food on the way')}}</span>
                                                @elseif($order->order_status == 5)
                                                    {{__('translate.State')}} : <span
                                                        class="badge bg-success text-white">{{__('translate.Delivered')}}</span>
                                                @elseif($order->order_status == 6)
                                                    {{__('translate.State')}} : <span
                                                        class="badge bg-warning text-white">{{__('translate.Cancel')}}</span>
                                                @endif
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Delivery Completion & Status Card -->
                    <div class="row mb-4">
                        <div class="col-12">
                            @if($order->order_status == 5 || $order->order_request == 3)
                                <div class="card border-0 shadow-sm" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%); border-radius: 12px; color: #fff;">
                                    <div class="card-body p-3 p-md-4 d-flex align-items-center justify-content-between flex-wrap gap-3">
                                        <div class="d-flex align-items-center gap-3">
                                            <div style="background: rgba(255,255,255,0.2); width: 48px; height: 48px; min-width: 48px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 22px;">
                                                <i class="fas fa-check-double"></i>
                                            </div>
                                            <div>
                                                <h4 class="m-0 text-white fw-bold">{{ __('translate.Order Delivered Successfully!') }}</h4>
                                                <p class="m-0 text-white-50 small">{{ __('translate.Delivered on') }}: {{ $order->order_completed_date ?? $order->updated_at->format('M d, Y h:i A') }}</p>
                                            </div>
                                        </div>
                                        <span class="badge bg-white text-success px-3 py-2 fw-bold" style="font-size: 14px; border-radius: 8px;">
                                            <i class="fas fa-check-circle me-1"></i> {{ __('translate.Delivered & Completed') }}
                                        </span>
                                    </div>
                                </div>
                            @elseif($order->order_status == 6 || $order->order_request == 4)
                                <div class="card border-0 shadow-sm" style="background: #fef2f2; border: 1px solid #fecaca; border-radius: 12px;">
                                    <div class="card-body p-3 p-md-4 d-flex align-items-center justify-content-between flex-wrap gap-3">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="text-danger" style="background: #fee2e2; width: 48px; height: 48px; min-width: 48px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 20px;">
                                                <i class="fas fa-ban"></i>
                                            </div>
                                            <div>
                                                <h5 class="m-0 text-danger fw-bold">{{ __('translate.Order Cancelled') }}</h5>
                                                <p class="m-0 text-muted small">{{ __('translate.This delivery request was cancelled.') }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @else
                                <div class="card border-0 shadow-sm" style="background: #f8fafc; border: 1.5px solid #e2e8f0; border-radius: 12px;">
                                    <div class="card-body p-3 p-md-4 d-flex align-items-center justify-content-between flex-wrap gap-3">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="text-primary" style="background: #e0f2fe; width: 50px; height: 50px; min-width: 50px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 22px;">
                                                <i class="fas fa-motorcycle"></i>
                                            </div>
                                            <div>
                                                <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                                    <span class="badge bg-primary text-white" style="font-size: 11px;">
                                                        <i class="fas fa-route me-1"></i> {{ __('translate.Food on the way') }}
                                                    </span>
                                                    @if($order->payment_status == 'success')
                                                        <span class="badge bg-success text-white" style="font-size: 11px;">
                                                            <i class="fas fa-check me-1"></i> {{ __('translate.Paid Online') }}
                                                        </span>
                                                    @else
                                                        <span class="badge bg-warning text-dark fw-bold" style="font-size: 11px;">
                                                            <i class="fas fa-hand-holding-usd me-1"></i> {{ __('translate.Collect') }} {{ currency($order->grand_total) }}
                                                        </span>
                                                    @endif
                                                </div>
                                                <h5 class="m-0 fw-bold text-dark">{{ __('translate.Delivering to') }} {{ $addressObj->contact_person_name ?? ($order->user->name ?? 'Customer') }}</h5>
                                                <p class="m-0 text-muted small">{{ __('translate.Once you hand over the order to customer, tap below to mark delivered.') }}</p>
                                            </div>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-success btn-lg px-4 py-2 shadow-sm d-inline-flex align-items-center gap-2 fw-bold" style="border-radius: 8px; font-size: 15px;" data-bs-toggle="modal" data-bs-target="#Approvalcomplete">
                                                <i class="fas fa-check-circle fs-5"></i> {{ __('translate.Mark as Delivered') }}
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="zum_icvoice_item_main">
                                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-3">
                                    <div class="d-flex align-items-center gap-2">
                                        <h4 class="m-0" style="font-size: 16px; font-weight: 700;">
                                            <i class="fa fa-map-marked-alt text-primary me-2"></i> {{ __('translate.Live Turn-by-Turn Delivery Navigation') }}
                                        </h4>
                                        <span class="badge" id="driverRouteStatsBadge" style="background: #e0f2fe; color: #0284c7; font-weight: 600; font-size: 12px; padding: 5px 10px; border-radius: 6px;">
                                            <i class="fa fa-route me-1"></i> {{ __('translate.Calculating Route...') }}
                                        </span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 flex-wrap">
                                        @if($origLat != 0 && $origLng != 0)
                                            <a href="https://www.google.com/maps/dir/?api=1&destination={{ $origLat }},{{ $origLng }}" target="_blank" class="btn btn-sm btn-primary d-inline-flex align-items-center gap-1 shadow-sm" style="border-radius: 6px; padding: 6px 12px; font-weight:600;">
                                                <i class="fas fa-store"></i> {{ __('translate.Navigate to Restaurant') }}
                                            </a>
                                        @endif
                                        @if($destLat != 0 && $destLng != 0)
                                            <a href="https://www.google.com/maps/dir/?api=1&destination={{ $destLat }},{{ $destLng }}" target="_blank" class="btn btn-sm btn-success d-inline-flex align-items-center gap-1 shadow-sm" style="border-radius: 6px; padding: 6px 12px; font-weight:600;">
                                                <i class="fas fa-location-arrow"></i> {{ __('translate.Navigate to Customer') }}
                                            </a>
                                        @endif
                                        @if(!empty($order->restaurant?->phone))
                                            <a href="tel:{{ $order->restaurant?->phone }}" class="btn btn-sm btn-outline-info d-inline-flex align-items-center gap-1" style="border-radius: 6px; padding: 6px 12px;">
                                                <i class="fas fa-phone-alt"></i> {{ __('translate.Call Restaurant') }}
                                            </a>
                                        @endif
                                        @php
                                            $custPhone = $addressObj->contact_person_number ?? ($order->user->phone ?? '');
                                        @endphp
                                        @if(!empty($custPhone))
                                            <a href="tel:{{ $custPhone }}" class="btn btn-sm btn-outline-success d-inline-flex align-items-center gap-1" style="border-radius: 6px; padding: 6px 12px;">
                                                <i class="fas fa-phone"></i> {{ __('translate.Call Customer') }}
                                            </a>
                                        @endif
                                    </div>
                                </div>
                                <div id="order_delivery_map" style="height: 380px; width: 100%; border-radius: 12px; border: 1.5px solid #cbd5e1; z-index: 1;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="tabel_main">
                                <table class=" zum_tabel table table-striped">
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
                                            $product = Modules\Product\App\Models\Product::where('status', 'enable')->whereIn('id', [$order_item['product_id']])->first();
                                            $total += $order_item->total;
                                        @endphp
                                        <tr>
                                            <td>{{$key + 1}}</td>
                                            <td>{{$product->name}}</td>
                                            <td>
                                                <div class="tabel_modal_main">
                                                    @foreach (json_decode($order_item['size']) as $size => $price)
                                                        {{__('translate.Size')}} : {{ $size }}
                                                    @endforeach
                                                    @if(json_decode($order_item['addons']))
                                                    <span data-bs-toggle="modal" data-bs-target="#exampleModal{{$key}}">
                                                        {{__('translate.See more')}}
                                                    </span>
                                                    @endif
                                                </div>
                                            </td>
                                            <td>
                                                {{$order?->restaurant?->restaurant_name}}
                                            </td>
                                            <td>
                                                @foreach (json_decode($order_item['size']) as $size => $price)
                                                  {{(currency($price))}}
                                                @endforeach
                                            </td>
                                            <td>{{$order_item->qty}}</td>
                                            <td>{{currency($order_item->total)}}</td>
                                        </tr>

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
                                                            @foreach (json_decode($order_item['addons']) as $addonId => $quantity)
                                                                @php
                                                                    $addonsDb = Modules\Addon\App\Models\Addon::whereIn('id', [$addonId])->get();
                                                                    $calculate += ($addonsDb->first()->price * $quantity);
                                                                @endphp
                                                                @if ($addonsDb->isNotEmpty())
                                                                    <li> {{ $addonsDb->first()->name }}
                                                                        ({{ currency($addonsDb->first()->price) }}
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

                                @if ($order->order_request==0)
                                    <div class="crancy-table__column-2 crancy-table__data-2">

                                        <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#reviewApproval" class="crancy-btn approval_button"><i class="fas fa-check"></i> {{ __('translate.Make Approval') }}</a>

                                        <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#reviewRejected" class="crancy-btn delete_danger_btn"><i class="fas fa-check"></i> {{ __('translate.Make Reject') }}</a>

                                    </div>

                                @elseif ($order->order_request == 1 )
                                    <div class="crancy-table__column-2 crancy-table__data-2 d-flex align-items-center gap-2 mt-3">
                                        <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#Approvalcomplete"
                                           class="btn btn-success fw-bold d-inline-flex align-items-center gap-2 px-3 py-2" style="border-radius: 6px;">
                                            <i class="fas fa-check-circle"></i> {{ __('translate.Mark as Delivered') }}
                                        </a>

                                        <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#ApprovalCancel"
                                           class="btn btn-outline-danger fw-bold d-inline-flex align-items-center gap-1 px-3 py-2" style="border-radius: 6px;">
                                            <i class="fas fa-ban"></i> {{ __('translate.Cancel Delivery') }}
                                        </a>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>






    <!-- Approval Confirmation Modal -->
    <div class="modal fade" id="reviewApproval" tabindex="-1" aria-labelledby="reviewApprovalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reviewApprovalLabel">{{ __('translate.Accept Order Confirmation') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __('translate.Are you sure you want to accept this order for delivery?') }}</p>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('deliveryman.order-request-status', $order->id) }}" class="delet_modal_form" method="POST">
                        @csrf
                        <input type="text" name="order_request_status" value="1" hidden>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-primary">{{ __('translate.Yes, Accept Order') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Decline Confirmation Modal -->
    <div class="modal fade" id="reviewRejected" tabindex="-1" aria-labelledby="reviewRejectedLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reviewRejectedLabel">{{ __('translate.Decline Order Request') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __('translate.Are you sure you want to decline this delivery request?') }}</p>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('deliveryman.order-request-status', $order->id) }}" class="delet_modal_form" method="POST">
                        @csrf
                        <input type="text" name="order_request_status" value="2" hidden>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-danger">{{ __('translate.Yes, Decline') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Complete / Delivered Confirmation Modal -->
    <div class="modal fade" id="Approvalcomplete" tabindex="-1" aria-labelledby="ApprovalcompleteLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 14px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.15);">
                <div class="modal-header border-0 pb-0">
                    <h5 class="modal-title fw-bold" id="ApprovalcompleteLabel">
                        <i class="fas fa-check-circle text-success me-2"></i> {{ __('translate.Confirm Order Delivery') }}
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('deliveryman.order-request-status', $order->id) }}" class="delet_modal_form" method="POST">
                    @csrf
                    <input type="hidden" name="order_request_status" value="3">
                    <div class="modal-body py-3">
                        <p class="text-secondary mb-3">{{ __('translate.Are you sure you have delivered this order to the customer?') }}</p>

                        <div class="p-3 rounded-3 mb-3" style="background: #f8fafc; border: 1px solid #e2e8f0;">
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted small">{{ __('translate.Customer') }}:</span>
                                <strong class="text-dark">{{ $addressObj->contact_person_name ?? ($order->user->name ?? 'Customer') }}</strong>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted small">{{ __('translate.Drop-off Address') }}:</span>
                                <span class="text-dark small text-end text-truncate" style="max-width: 240px;">{{ $order?->address?->address ?? ($addressObj->address ?? 'N/A') }}</span>
                            </div>
                            <div class="d-flex justify-content-between pt-2 border-top">
                                <span class="text-muted small">{{ __('translate.Order Total') }}:</span>
                                <strong class="text-success fs-6">{{ currency($order->grand_total) }}</strong>
                            </div>
                        </div>

                        @if($order->payment_status != 'success')
                            <div class="alert alert-warning py-2 px-3 small d-flex align-items-center gap-2 mb-0" style="border-radius: 8px;">
                                <i class="fas fa-exclamation-circle text-warning fs-5"></i>
                                <div>
                                    <strong>{{ __('translate.Cash to Collect') }}:</strong> {{ currency($order->grand_total) }}.<br>
                                    {{ __('translate.Confirming delivery will mark payment as collected.') }}
                                </div>
                            </div>
                            <input type="hidden" name="payment_status" value="1">
                        @else
                            <div class="alert alert-success py-2 px-3 small d-flex align-items-center gap-2 mb-0" style="border-radius: 8px;">
                                <i class="fas fa-check-circle text-success fs-5"></i>
                                <div>{{ __('translate.Payment already confirmed online. Do not collect any cash.') }}</div>
                            </div>
                            <input type="hidden" name="payment_status" value="1">
                        @endif
                    </div>
                    <div class="modal-footer border-0 pt-0">
                        <button type="button" class="btn btn-secondary px-3" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-success px-4 fw-bold">
                            <i class="fas fa-check-circle me-1"></i> {{ __('translate.Yes, Mark Delivered') }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Cancel Confirmation Modal -->
    <div class="modal fade" id="ApprovalCancel" tabindex="-1" aria-labelledby="CancelLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="CancelLabel">{{ __('translate.Cancel Delivery Confirmation') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __('translate.Are you sure you want to cancel this delivery?') }}</p>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('deliveryman.order-request-status', $order->id) }}" class="delet_modal_form" method="POST">
                        @csrf
                        <input type="text" name="order_request_status" value="4" hidden>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="btn btn-danger">{{ __('translate.Yes, Cancel Delivery') }}</button>
                    </form>
                </div>
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
            width: 36px;
            height: 36px;
            background: #ea580c;
            border: 2.5px solid #ffffff;
            border-radius: 50% 50% 50% 0;
            transform: rotate(-45deg);
            box-shadow: 0 4px 12px rgba(0,0,0,0.35);
        }
        .foodigo-map-pin.pin-rest {
            background: #0284c7;
        }
        .foodigo-map-pin.pin-rider {
            background: #16a34a;
            border-radius: 50%;
            transform: none;
            box-shadow: 0 0 0 6px rgba(22, 163, 74, 0.25);
        }
        .foodigo-map-pin i {
            transform: rotate(45deg);
            color: #ffffff;
            font-size: 14px;
        }
        .foodigo-map-pin.pin-rider i {
            transform: none;
        }
    </style>
@endpush

@push('js_section')
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
    <script>
        "use strict";

        document.addEventListener("DOMContentLoaded", function() {
            const mapEl = document.getElementById('order_delivery_map');
            if (!mapEl) return;

            const destLat = parseFloat("{{ $destLat }}") || 0;
            const destLng = parseFloat("{{ $destLng }}") || 0;
            const origLat = parseFloat("{{ $origLat }}") || 0;
            const origLng = parseFloat("{{ $origLng }}") || 0;
            let riderLat = parseFloat("{{ $rider->latitude ?? 0 }}") || 0;
            let riderLng = parseFloat("{{ $rider->longitude ?? 0 }}") || 0;

            const initialLat = origLat || destLat || 7.4250;
            const initialLng = origLng || destLng || 3.9050;

            const map = L.map('order_delivery_map', {
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
                html: '<div class="foodigo-map-pin pin-rest"><i class="fa-solid fa-utensils"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 36],
                popupAnchor: [0, -36]
            });

            const riderPin = L.divIcon({
                className: 'foodigo-leaflet-div-icon',
                html: '<div class="foodigo-map-pin pin-rider"><i class="fa-solid fa-motorcycle"></i></div>',
                iconSize: [36, 36],
                iconAnchor: [18, 18],
                popupAnchor: [0, -18]
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

            let riderMarker = null;
            function addRiderPin(lat, lng) {
                if (riderMarker) map.removeLayer(riderMarker);
                riderMarker = L.marker([lat, lng], { icon: riderPin }).addTo(map);
                riderMarker.bindPopup(`<b>🛵 {{ __('translate.Your Current Location') }}</b>`);
                markers.push(riderMarker);
            }

            if (riderLat !== 0 && riderLng !== 0) {
                addRiderPin(riderLat, riderLng);
            } else if ("geolocation" in navigator) {
                navigator.geolocation.getCurrentPosition(function(pos) {
                    riderLat = pos.coords.latitude;
                    riderLng = pos.coords.longitude;
                    addRiderPin(riderLat, riderLng);
                    drawTurnByTurnRoute();
                }, function() {});
            }

            const statsBadge = document.getElementById('driverRouteStatsBadge');

            function drawFallbackDirectRoute() {
                if (origLat !== 0 && destLat !== 0) {
                    const points = [];
                    if (riderLat !== 0 && riderLng !== 0) points.push([riderLat, riderLng]);
                    points.push([origLat, origLng]);
                    points.push([destLat, destLng]);

                    const line = L.polyline(points, {
                        color: '#ea580c',
                        dashArray: '6, 8',
                        weight: 3.5,
                        opacity: 0.85
                    }).addTo(map);

                    const group = L.featureGroup(markers.concat(line));
                    map.fitBounds(group.getBounds().pad(0.2));

                    if (statsBadge) {
                        statsBadge.innerHTML = `<i class="fa-solid fa-route me-1"></i> {{ __('translate.Route Connected') }}`;
                    }
                } else if (markers.length === 1) {
                    map.setView(markers[0].getLatLng(), 15);
                }
            }

            let activePolylines = [];
            function drawTurnByTurnRoute() {
                if (origLat === 0 || destLat === 0) {
                    drawFallbackDirectRoute();
                    return;
                }

                // If rider position available, build 2-leg route: Rider -> Restaurant -> Customer
                let waypointStr = '';
                if (riderLat !== 0 && riderLng !== 0) {
                    waypointStr = `${riderLng},${riderLat};${origLng},${origLat};${destLng},${destLat}`;
                } else {
                    waypointStr = `${origLng},${origLat};${destLng},${destLat}`;
                }

                const osrmUrl = `https://router.project-osrm.org/route/v1/driving/${waypointStr}?overview=full&geometries=geojson`;

                fetch(osrmUrl)
                    .then(r => r.json())
                    .then(data => {
                        if (data && data.code === 'Ok' && data.routes && data.routes.length > 0) {
                            const route = data.routes[0];
                            const distKm = (route.distance / 1000).toFixed(1);
                            const durMin = Math.max(1, Math.round(route.duration / 60));

                            if (statsBadge) {
                                statsBadge.innerHTML = `<i class="fa-solid fa-motorcycle me-1"></i> ${distKm} km • ~${durMin} mins total`;
                                statsBadge.style.background = '#dcfce7';
                                statsBadge.style.color = '#15803d';
                            }

                            activePolylines.forEach(p => map.removeLayer(p));
                            activePolylines = [];

                            const routeCoords = route.geometry.coordinates.map(pt => [pt[1], pt[0]]);
                            const casing = L.polyline(routeCoords, { color: '#0369a1', weight: 6, opacity: 0.25 }).addTo(map);
                            const mainLine = L.polyline(routeCoords, { color: '#0284c7', weight: 4, opacity: 0.95 }).addTo(map);
                            activePolylines.push(casing, mainLine);

                            const group = L.featureGroup(markers.concat(mainLine));
                            map.fitBounds(group.getBounds().pad(0.2));
                        } else {
                            drawFallbackDirectRoute();
                        }
                    })
                    .catch(() => {
                        drawFallbackDirectRoute();
                    });
            }

            drawTurnByTurnRoute();

            setTimeout(() => { map.invalidateSize(); }, 300);
            window.addEventListener('resize', () => { map.invalidateSize(); });
        });
    </script>
@endpush

