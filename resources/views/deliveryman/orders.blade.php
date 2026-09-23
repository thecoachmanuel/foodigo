@extends('deliveryman.master_layout')

@section('title')
    <title>{{ __('translate.Running Order') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Running Order') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Order') }} >> {{ __('translate.Running Order') }}</p>
@endsection

@section('body-content')
    <!-- crancy Dashboard -->
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <div class="crancy-dsinner">

                            <div class="crancy-table crancy-table--v3 mg-top-30">

                                <div class="crancy-customer-filter">
                                    <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between create_new_btn_box">
                                        <div class="crancy-header__form crancy-header__form--customer create_new_btn_inline_box">
                                            <h4 class="crancy-product-card__title">{{ __('translate.Running Order') }}</h4>
                                        </div>
                                    </div>
                                </div>

                                 <!-- crancy Table -->
                                 <div id="crancy-table__main_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">

                                    <table class="crancy-table__main crancy-table__main-v3 dataTable no-footer" id="dataTable">
                                        <!-- crancy Table Head -->
                                        <thead class="crancy-table__head">
                                        <tr>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.SN') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Customer') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Order Id') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Date') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Amount') }}
                                            </th>

                                            <th class="crancy-table__column-3 crancy-table__h3 sorting">
                                                {{ __('translate.Order Status') }}
                                            </th>
                                            <th class="crancy-table__column-3 crancy-table__h3 sorting">
                                                {{ __('translate.Payment') }}
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
                                                    <h4 class="crancy-table__product-title">
                                                        <a href="#">{{ $order->user->name }}</a>
                                                    </h4>
                                                </td>


                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ $order->id }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ $order->created_at->format('d F, Y') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ round($order->total) }}</h4>
                                                </td>

                                                <td>

                                                    @php $status = (int) $order->order_request; @endphp

                                                    @if ($status == 1)
                                                        <span class="badge bg-warning text-white">{{ __('translate.Progress') }}</span>
                                                    @elseif ($status == 2)
                                                        <span class="badge bg-info text-white">{{ __('translate.Ignored by me') }}</span>
                                                    @elseif ($status == 3)
                                                        <span class="badge bg-success text-white">{{ __('translate.Completed') }}</span>
                                                    @elseif ($status == 4)
                                                        <span class="badge bg-danger text-white">{{ __('translate.Declined') }}</span>
                                                    @else
                                                        <span class="badge bg-secondary text-white">{{ __('translate.Pending') }}</span>
                                                    @endif

                                                </td>

                                                <td>
                                                    @if($order->payment_status == 'success')
                                                        <span class="badge bg-success text-white">{{ __('translate.Success') }}</span>
                                                        @else
                                                        <span class="badge bg-warning text-white">{{ __('translate.Pending') }}</span>
                                                    @endif
                                                </td>


                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <div class="d-flex align-items-center gap-2">
                                                        <a href="{{ route('deliveryman.order-show',$order->id) }}" class="crancy-btn"><i class="fas fa-eye" aria-hidden="true"></i> {{ __('translate.Details') }}</a>
                                                        @if ($order->order_request == 1)
                                                            <button type="button" class="btn btn-sm btn-success fw-bold d-inline-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#markDeliveredModal{{ $order->id }}" style="padding: 7px 12px; border-radius: 6px; font-size: 13px;">
                                                                <i class="fas fa-check-circle"></i> {{ __('translate.Deliver') }}
                                                            </button>
                                                        @endif
                                                    </div>

                                                    @if ($order->order_request == 1)
                                                    <!-- Quick Deliver Modal for Order {{ $order->id }} -->
                                                    <div class="modal fade" id="markDeliveredModal{{ $order->id }}" tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content" style="border-radius: 14px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.15);">
                                                                <div class="modal-header border-0 pb-0">
                                                                    <h5 class="modal-title fw-bold text-success">
                                                                        <i class="fas fa-check-circle me-1"></i> {{ __('translate.Confirm Delivery') }} #{{ $order->id }}
                                                                    </h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <form action="{{ route('deliveryman.order-request-status', $order->id) }}" method="POST">
                                                                    @csrf
                                                                    <input type="hidden" name="order_request_status" value="3">
                                                                    <div class="modal-body py-3">
                                                                        <p class="text-secondary mb-3">{{ __('translate.Are you sure you have delivered this order to the customer?') }}</p>
                                                                        <div class="p-3 rounded-3 mb-3" style="background: #f8fafc; border: 1px solid #e2e8f0; font-size: 14px;">
                                                                            <div class="d-flex justify-content-between mb-2">
                                                                                <span class="text-muted">{{ __('translate.Customer') }}:</span>
                                                                                <strong class="text-dark">{{ $order->user->name ?? 'Customer' }}</strong>
                                                                            </div>
                                                                            <div class="d-flex justify-content-between mb-2">
                                                                                <span class="text-muted">{{ __('translate.Total Amount') }}:</span>
                                                                                <strong class="text-success">{{ currency($order->grand_total ?? $order->total) }}</strong>
                                                                            </div>
                                                                            <div class="d-flex justify-content-between">
                                                                                <span class="text-muted">{{ __('translate.Payment Method') }}:</span>
                                                                                <span class="badge {{ $order->payment_status == 'success' ? 'bg-success' : 'bg-warning text-dark' }}">{{ strtoupper($order->payment_method ?? 'COD') }}</span>
                                                                            </div>
                                                                        </div>
                                                                        @if($order->payment_method == 'cash_on_delivery' && $order->payment_status != 'success')
                                                                            <div class="alert alert-warning py-2 px-3 small mb-0 d-flex align-items-center gap-2" style="border-radius: 8px;">
                                                                                <i class="fas fa-coins text-warning fs-5"></i>
                                                                                <div><strong>{{ __('translate.Cash On Delivery') }}:</strong> {{ __('translate.Please collect payment before completing delivery.') }}</div>
                                                                            </div>
                                                                        @endif
                                                                    </div>
                                                                    <div class="modal-footer border-0 pt-0">
                                                                        <button type="button" class="btn btn-secondary px-3 py-2" data-bs-dismiss="modal">{{ __('translate.Cancel') }}</button>
                                                                        <button type="submit" class="btn btn-success fw-bold px-4 py-2">
                                                                            <i class="fas fa-check-circle me-1"></i> {{ __('translate.Yes, Mark Delivered') }}
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach

                                        </tbody>
                                        <!-- End crancy Table Body -->
                                    </table>
                                </div>
                                </div>
                                <!-- End crancy Table -->

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
        "use strict"
        function itemDeleteConfrimation(id){
            $("#item_delect_confirmation").attr("action",'{{ url("admin/restaurant/product/") }}'+"/"+id)
        }
    </script>
@endpush
