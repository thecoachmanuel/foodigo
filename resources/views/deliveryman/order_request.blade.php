@extends('deliveryman.master_layout')
@section('title')
    <title>{{ __('translate.Order Request') }}</title>
@endsection

@push('style_section')
<style>
    .live-dispatch-banner {
        background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%);
        color: #ffffff;
        border-radius: 12px;
        padding: 16px 20px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 12px;
        box-shadow: 0 4px 14px rgba(2, 132, 199, 0.2);
    }
    .live-pulse-dot {
        width: 12px;
        height: 12px;
        min-width: 12px;
        background-color: #22c55e;
        border-radius: 50%;
        display: inline-block;
        box-shadow: 0 0 0 rgba(34, 197, 94, 0.7);
        animation: pulse-ring 1.8s infinite;
    }
    @keyframes pulse-ring {
        0% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.7); }
        70% { transform: scale(1); box-shadow: 0 0 0 8px rgba(34, 197, 94, 0); }
        100% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(34, 197, 94, 0); }
    }
    .distance-badge {
        display: inline-flex;
        align-items: center;
        gap: 4px;
        background: #f0fdf4;
        color: #166534;
        border: 1px solid #bbf7d0;
        font-weight: 600;
        font-size: 12px;
        padding: 4px 8px;
        border-radius: 6px;
    }
    .btn-claim {
        background: #16a34a !important;
        border-color: #16a34a !important;
        color: #ffffff !important;
        font-weight: 600;
        border-radius: 6px;
        padding: 7px 14px;
        font-size: 13px;
        transition: all 0.2s ease;
    }
    .btn-claim:hover {
        background: #15803d !important;
        transform: translateY(-1px);
        box-shadow: 0 3px 10px rgba(22, 163, 74, 0.3);
    }
    .btn-decline {
        background: #fff !important;
        border: 1px solid #ef4444 !important;
        color: #ef4444 !important;
        font-weight: 600;
        border-radius: 6px;
        padding: 7px 14px;
        font-size: 13px;
        transition: all 0.2s ease;
    }
    .btn-decline:hover {
        background: #ef4444 !important;
        color: #ffffff !important;
    }
    .restaurant-info-cell {
        display: flex;
        flex-direction: column;
        gap: 2px;
    }
    .restaurant-name {
        font-weight: 700;
        color: #1e293b;
        font-size: 14px;
    }
    .restaurant-address {
        font-size: 12px;
        color: #64748b;
        max-width: 220px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    /* Mobile Responsive Card Styles */
    .mobile-order-cards {
        display: none;
    }
    .mobile-request-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 14px;
        padding: 16px;
        margin-bottom: 16px;
        box-shadow: 0 2px 10px rgba(15, 23, 42, 0.04);
        position: relative;
        transition: transform 0.15s ease, box-shadow 0.15s ease;
    }
    .mobile-request-card:hover {
        box-shadow: 0 6px 18px rgba(15, 23, 42, 0.08);
    }
    .mobile-card-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
        padding-bottom: 10px;
        border-bottom: 1px dashed #e2e8f0;
    }
    .mobile-order-id-badge {
        background: #0f172a;
        color: #ffffff;
        font-weight: 700;
        font-size: 13px;
        padding: 4px 10px;
        border-radius: 6px;
    }
    .mobile-step-container {
        display: flex;
        flex-direction: column;
        gap: 12px;
        margin-bottom: 14px;
        position: relative;
        padding-left: 28px;
    }
    .mobile-step-line {
        position: absolute;
        left: 11px;
        top: 14px;
        bottom: 14px;
        width: 2px;
        background: #cbd5e1;
    }
    .mobile-step-point {
        position: relative;
    }
    .mobile-step-dot {
        position: absolute;
        left: -28px;
        top: 2px;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 11px;
    }
    .dot-pickup {
        background: #e0f2fe;
        color: #0284c7;
        border: 2px solid #38bdf8;
    }
    .dot-delivery {
        background: #fef2f2;
        color: #ef4444;
        border: 2px solid #f87171;
    }
    .mobile-info-pill-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #f8fafc;
        border: 1px solid #f1f5f9;
        border-radius: 10px;
        padding: 10px 14px;
        margin-bottom: 14px;
    }
    .mobile-action-bar {
        display: grid;
        grid-template-columns: 1fr 1fr auto;
        gap: 8px;
    }
    .mobile-action-bar .btn-claim,
    .mobile-action-bar .btn-decline {
        min-height: 44px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        border-radius: 8px;
        width: 100%;
    }

    @media (max-width: 991.98px) {
        .desktop-order-table {
            display: none !important;
        }
        .mobile-order-cards {
            display: block !important;
        }
        .live-dispatch-banner {
            padding: 14px 16px;
        }
    }
    @media (max-width: 575.98px) {
        .live-dispatch-banner {
            flex-direction: column;
            align-items: flex-start;
        }
        .live-dispatch-banner .btn {
            width: 100%;
        }
        .mobile-action-bar {
            grid-template-columns: 1fr 1fr 44px;
        }
    }
</style>
@endpush

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Order Request') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Order') }} >> {{ __('translate.Order Request') }}</p>
@endsection

@section('body-content')
    <!-- crancy Dashboard -->
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <div class="crancy-dsinner">

                            <!-- Live Dispatch Banner -->
                            <div class="live-dispatch-banner">
                                <div class="d-flex align-items-center gap-3">
                                    <span class="live-pulse-dot"></span>
                                    <div>
                                        <h5 class="m-0 text-white" style="font-weight:700; font-size:15px;">
                                            <i class="fas fa-broadcast-tower me-1"></i> {{ __('translate.Live Order Dispatch Radar') }}
                                        </h5>
                                        <p class="m-0 text-white-50" style="font-size:12px;">
                                            {{ __('translate.First delivery partner to accept claims the order. Once accepted, it immediately leaves the pool and moves to Running Orders.') }}
                                        </p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <button class="btn btn-sm btn-light text-dark fw-bold" onclick="location.reload();">
                                        <i class="fas fa-sync-alt me-1"></i> {{ __('translate.Refresh Radar') }}
                                    </button>
                                </div>
                            </div>

                            <div class="crancy-table crancy-table--v3 mg-top-10">

                                <div class="crancy-customer-filter mb-3">
                                    <div class="crancy-customer-filter__single d-flex items-center justify-between">
                                        <div class="crancy-header__form">
                                            <h4 class="crancy-product-card__title">
                                                {{ __('translate.Available Orders for Pickup') }}
                                                <span class="badge bg-primary text-white ms-2">{{ $orders->count() }}</span>
                                            </h4>
                                        </div>
                                    </div>
                                </div>

                                <!-- DESKTOP VIEW (Table: >= 992px) -->
                                <div class="desktop-order-table">
                                    <div id="crancy-table__main_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
                                        <div class="table-responsive">
                                            <table class="crancy-table__main crancy-table__main-v3 dataTable no-footer w-100" id="dataTable">
                                                <thead class="crancy-table__head">
                                                <tr>
                                                    <th>{{ __('translate.SN') }}</th>
                                                    <th>{{ __('translate.Order ID') }}</th>
                                                    <th>{{ __('translate.Restaurant (Pickup)') }}</th>
                                                    <th>{{ __('translate.Customer (Drop-off)') }}</th>
                                                    <th>{{ __('translate.Distance') }}</th>
                                                    <th>{{ __('translate.Amount') }}</th>
                                                    <th>{{ __('translate.Payment') }}</th>
                                                    <th>{{ __('translate.Action') }}</th>
                                                </tr>
                                                </thead>
                                                <tbody class="crancy-table__body">
                                                @forelse ($orders as $index => $order)
                                                    @php
                                                        $addressObj = is_string($order->delivery_address) ? json_decode($order->delivery_address) : (object) ($order->delivery_address ?? []);
                                                        $customerName = $addressObj->contact_person_name ?? ($order->user->name ?? 'Customer');
                                                        $customerAddr = $order?->address?->address ?? ($addressObj->address ?? 'N/A');
                                                    @endphp
                                                    <tr class="odd order-row-{{ $order->id }}">
                                                        <td class="crancy-table__column-2 crancy-table__data-2">
                                                            <h4 class="crancy-table__product-title">{{ $index + 1 }}</h4>
                                                        </td>

                                                        <td class="crancy-table__column-2 crancy-table__data-2">
                                                            <span class="badge bg-dark text-white fw-bold">#{{ $order->id }}</span>
                                                            <div class="text-muted" style="font-size:11px;">{{ $order->created_at->diffForHumans() }}</div>
                                                        </td>

                                                        <td>
                                                            <div class="restaurant-info-cell">
                                                                <div class="restaurant-name">
                                                                    <i class="fas fa-store text-primary me-1"></i> {{ $order->restaurant?->restaurant_name ?? ($order->restaurant?->name ?? 'Restaurant') }}
                                                                </div>
                                                                <div class="restaurant-address">
                                                                    <i class="fas fa-map-marker-alt text-muted me-1"></i> {{ $order->restaurant?->address ?? 'N/A' }}
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <td>
                                                            <div class="restaurant-info-cell">
                                                                <div class="fw-bold text-dark" style="font-size:13px;">
                                                                    <i class="fas fa-user text-secondary me-1"></i> {{ $customerName }}
                                                                </div>
                                                                <div class="restaurant-address">
                                                                    <i class="fas fa-location-arrow text-muted me-1"></i> {{ $customerAddr }}
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <td>
                                                            @if ($order->distance_km !== null)
                                                                <span class="distance-badge">
                                                                    <i class="fas fa-motorcycle"></i> {{ $order->distance_km }} km
                                                                </span>
                                                            @else
                                                                <span class="badge bg-light text-secondary">
                                                                    <i class="fas fa-map-pin"></i> Nearby
                                                                </span>
                                                            @endif
                                                        </td>

                                                        <td class="crancy-table__column-2 crancy-table__data-2">
                                                            <span class="fw-bold text-success" style="font-size:15px;">{{ currency($order->grand_total) }}</span>
                                                        </td>

                                                        <td>
                                                            @if($order->payment_status == 'success')
                                                                <span class="badge bg-success text-white">{{ __('translate.Paid') }}</span>
                                                            @else
                                                                <span class="badge bg-warning text-dark">{{ __('translate.COD / Pending') }}</span>
                                                            @endif
                                                        </td>

                                                        <td>
                                                            <div class="d-flex align-items-center gap-2">
                                                                <!-- 1-Click Atomic Claim & Accept -->
                                                                <form action="{{ route('deliveryman.order-request-status', $order->id) }}" method="POST" class="m-0" onsubmit="return confirmClaim(event, this)">
                                                                    @csrf
                                                                    <input type="hidden" name="order_request_status" value="1">
                                                                    <button type="submit" class="btn btn-claim d-inline-flex align-items-center gap-1">
                                                                        <i class="fas fa-check-circle"></i> {{ __('translate.Accept') }}
                                                                    </button>
                                                                </form>

                                                                <!-- 1-Click Isolated Reject -->
                                                                <form action="{{ route('deliveryman.order-request-status', $order->id) }}" method="POST" class="m-0" onsubmit="return confirmDecline(event, this)">
                                                                    @csrf
                                                                    <input type="hidden" name="order_request_status" value="2">
                                                                    <button type="submit" class="btn btn-decline d-inline-flex align-items-center gap-1">
                                                                        <i class="fas fa-times"></i> {{ __('translate.Decline') }}
                                                                    </button>
                                                                </form>

                                                                <!-- View Details & Navigation Map -->
                                                                <a href="{{ route('deliveryman.order-show', $order->id) }}" class="btn btn-sm btn-outline-primary d-inline-flex align-items-center gap-1" style="border-radius:6px; padding:6px 10px; font-size:13px;" title="{{ __('translate.View Map & Info') }}">
                                                                    <i class="fas fa-map-marked-alt"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                @empty
                                                    <tr>
                                                        <td colspan="8" class="text-center py-5">
                                                            <div class="py-4">
                                                                <i class="fas fa-radar fa-3x text-muted mb-3 d-block" style="opacity:0.4;"></i>
                                                                <h5 class="text-secondary">{{ __('translate.No Pending Order Requests Nearby') }}</h5>
                                                                <p class="text-muted small">{{ __('translate.Keep this page open. New incoming delivery requests will appear here with an instant chime.') }}</p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                @endforelse
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!-- MOBILE & TABLET CARDS VIEW (< 992px) -->
                                <div class="mobile-order-cards">
                                    @forelse ($orders as $index => $order)
                                        @php
                                            $addressObj = is_string($order->delivery_address) ? json_decode($order->delivery_address) : (object) ($order->delivery_address ?? []);
                                            $customerName = $addressObj->contact_person_name ?? ($order->user->name ?? 'Customer');
                                            $customerAddr = $order?->address?->address ?? ($addressObj->address ?? 'N/A');
                                        @endphp
                                        <div class="mobile-request-card order-row-{{ $order->id }}">
                                            <!-- Top Header: ID, Time, Distance -->
                                            <div class="mobile-card-header">
                                                <div class="d-flex align-items-center gap-2">
                                                    <span class="mobile-order-id-badge">#{{ $order->id }}</span>
                                                    <span class="text-muted small">{{ $order->created_at->diffForHumans() }}</span>
                                                </div>
                                                <div>
                                                    @if ($order->distance_km !== null)
                                                        <span class="distance-badge">
                                                            <i class="fas fa-motorcycle"></i> {{ $order->distance_km }} km away
                                                        </span>
                                                    @else
                                                        <span class="badge bg-light text-secondary">
                                                            <i class="fas fa-map-pin"></i> Nearby
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            <!-- Steps: Restaurant (Pickup) -> Customer (Delivery) -->
                                            <div class="mobile-step-container">
                                                <div class="mobile-step-line"></div>
                                                
                                                <!-- Step 1: Restaurant -->
                                                <div class="mobile-step-point">
                                                    <div class="mobile-step-dot dot-pickup">
                                                        <i class="fas fa-store"></i>
                                                    </div>
                                                    <div>
                                                        <div class="fw-bold text-dark" style="font-size: 14px;">
                                                            {{ $order->restaurant?->restaurant_name ?? ($order->restaurant?->name ?? 'Restaurant') }}
                                                        </div>
                                                        <div class="text-muted small text-truncate" style="max-width: 260px;">
                                                            {{ $order->restaurant?->address ?? 'N/A' }}
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Step 2: Customer Drop-off -->
                                                <div class="mobile-step-point">
                                                    <div class="mobile-step-dot dot-delivery">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </div>
                                                    <div>
                                                        <div class="fw-bold text-dark" style="font-size: 14px;">
                                                            {{ $customerName }}
                                                        </div>
                                                        <div class="text-muted small text-truncate" style="max-width: 260px;">
                                                            {{ $customerAddr }}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Financials & Payment Status -->
                                            <div class="mobile-info-pill-row">
                                                <div>
                                                    <span class="text-muted small d-block" style="font-size: 11px;">{{ __('translate.Order Total') }}</span>
                                                    <strong class="text-success" style="font-size: 16px;">{{ currency($order->grand_total) }}</strong>
                                                </div>
                                                <div>
                                                    @if($order->payment_status == 'success')
                                                        <span class="badge bg-success text-white py-1 px-2" style="font-size: 11px;">
                                                            <i class="fas fa-check me-1"></i> {{ __('translate.Paid Online') }}
                                                        </span>
                                                    @else
                                                        <span class="badge bg-warning text-dark py-1 px-2" style="font-size: 11px;">
                                                            <i class="fas fa-hand-holding-usd me-1"></i> {{ __('translate.Cash on Delivery') }}
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            <!-- Mobile Action Bar (Touch-friendly 44px buttons) -->
                                            <div class="mobile-action-bar">
                                                <!-- Accept & Claim -->
                                                <form action="{{ route('deliveryman.order-request-status', $order->id) }}" method="POST" class="m-0" onsubmit="return confirmClaim(event, this)">
                                                    @csrf
                                                    <input type="hidden" name="order_request_status" value="1">
                                                    <button type="submit" class="btn btn-claim shadow-sm">
                                                        <i class="fas fa-check-circle me-1"></i> {{ __('translate.Accept') }}
                                                    </button>
                                                </form>

                                                <!-- Decline (Isolated) -->
                                                <form action="{{ route('deliveryman.order-request-status', $order->id) }}" method="POST" class="m-0" onsubmit="return confirmDecline(event, this)">
                                                    @csrf
                                                    <input type="hidden" name="order_request_status" value="2">
                                                    <button type="submit" class="btn btn-decline">
                                                        <i class="fas fa-times me-1"></i> {{ __('translate.Decline') }}
                                                    </button>
                                                </form>

                                                <!-- View Map -->
                                                <a href="{{ route('deliveryman.order-show', $order->id) }}" class="btn btn-outline-primary d-flex align-items-center justify-content-center" style="border-radius: 8px; width: 44px; min-width: 44px; height: 44px;" title="{{ __('translate.View Map & Info') }}">
                                                    <i class="fas fa-map-marked-alt"></i>
                                                </a>
                                            </div>
                                        </div>
                                    @empty
                                        <div class="bg-white rounded-3 p-4 text-center border shadow-sm my-3">
                                            <i class="fas fa-radar fa-3x text-muted mb-3 d-block" style="opacity:0.35;"></i>
                                            <h5 class="text-secondary fw-bold">{{ __('translate.No Pending Order Requests Nearby') }}</h5>
                                            <p class="text-muted small mb-0">{{ __('translate.Keep this page open. When a restaurant confirms an order, it will appear here with an instant chime alert.') }}</p>
                                        </div>
                                    @endforelse
                                </div>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- End crancy Dashboard -->
@endsection

@push('js_section')
    <script>
        "use strict";

        // Web Audio API Chime generator (No external file needed)
        function playChimeAlert() {
            try {
                const AudioContext = window.AudioContext || window.webkitAudioContext;
                if (!AudioContext) return;
                const ctx = new AudioContext();

                // Tone 1
                const osc1 = ctx.createOscillator();
                const gain1 = ctx.createGain();
                osc1.type = 'sine';
                osc1.frequency.setValueAtTime(587.33, ctx.currentTime); // D5
                osc1.frequency.exponentialRampToValueAtTime(880, ctx.currentTime + 0.15); // A5
                gain1.gain.setValueAtTime(0.3, ctx.currentTime);
                gain1.gain.exponentialRampToValueAtTime(0.01, ctx.currentTime + 0.5);
                osc1.connect(gain1);
                gain1.connect(ctx.destination);
                osc1.start();
                osc1.stop(ctx.currentTime + 0.5);

                // Tone 2
                setTimeout(() => {
                    const osc2 = ctx.createOscillator();
                    const gain2 = ctx.createGain();
                    osc2.type = 'sine';
                    osc2.frequency.setValueAtTime(880, ctx.currentTime); // A5
                    osc2.frequency.exponentialRampToValueAtTime(1174.66, ctx.currentTime + 0.2); // D6
                    gain2.gain.setValueAtTime(0.3, ctx.currentTime);
                    gain2.gain.exponentialRampToValueAtTime(0.01, ctx.currentTime + 0.6);
                    osc2.connect(gain2);
                    gain2.connect(ctx.destination);
                    osc2.start();
                    osc2.stop(ctx.currentTime + 0.6);
                }, 180);
            } catch (e) {
                // Audio context blocked or unsupported
            }
        }

        function confirmClaim(e, form) {
            const btn = form.querySelector('button[type="submit"]');
            btn.innerHTML = '<i class="fas fa-spinner fa-spin me-1"></i> {{ __("translate.Claiming...") }}';
            btn.disabled = true;
            return true;
        }

        function confirmDecline(e, form) {
            if (!confirm("{{ __('translate.Decline this delivery request? It will be removed from your radar.') }}")) {
                e.preventDefault();
                return false;
            }
            return true;
        }

        // Listen for new orders triggered by the global background poller in master_layout
        $(document).on('newOrderRequestArrived', function(event, data) {
            playChimeAlert();
            toastr.success("🛵 {{ __('translate.New delivery request available! Updating radar...') }}");
            setTimeout(function() {
                location.reload();
            }, 1200);
        });
    </script>
@endpush
