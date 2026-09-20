@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Order List') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Order List') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Order') }} >> {{ __('translate.Order List') }}</p>
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
                                            <h4 class="crancy-product-card__title">{{ __('translate.Order List') }}</h4>
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
                                                {{ __('translate.Order Id') }}
                                            </th>

                                            <th class="crancy-table__column-2 crancy-table__h2 sorting" >
                                                {{ __('translate.Restaurant') }}
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
                                                    <h4 class="crancy-table__product-title">#{{ $order->id }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ $order?->restaurant?->restaurant_name }}</h4>
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
                                                        {{__('translate.State')}} :
                                                        @if($order->order_status == 1)
                                                            <span id="order-tag-{{ $order->id }}" class="tag denger">{{__('translate.Pending')}}</span>
                                                        @elseif($order->order_status == 2)
                                                            <span id="order-tag-{{ $order->id }}" class="tag">{{__('translate.Confirmed')}}</span>
                                                        @elseif($order->order_status == 3)
                                                            <span id="order-tag-{{ $order->id }}" class="tag">{{__('translate.Processing')}}</span>
                                                        @elseif($order->order_status == 4)
                                                            <span id="order-tag-{{ $order->id }}" class="tag">{{__('translate.Food on the way')}}</span>
                                                        @elseif($order->order_status == 5)
                                                            <span id="order-tag-{{ $order->id }}" class="tag">{{__('translate.Delivered')}}</span>
                                                        @elseif($order->order_status == 6)
                                                            <span id="order-tag-{{ $order->id }}" class="tag">{{__('translate.Canceled')}}</span>
                                                        @endif
                                                        </span>
                                                    </h4>
                                                    <div class="mt-1 mb-1">
                                                        <select class="form-select form-select-sm table-order-status-select" data-order-id="{{ $order->id }}" data-prev-status="{{ $order->order_status }}" style="font-size: 11px; font-weight: 700; padding: 2px 4px; height: 28px; width: 95px; max-width: 95px; border-radius: 6px; display: inline-block; cursor: pointer; color: #1e293b; background-color: #ffffff; border: 1px solid #cbd5e1;">
                                                            <option value="1" style="font-weight: 700;" {{ $order->order_status == 1 ? 'selected' : '' }}>{{ __('translate.Pending') }}</option>
                                                            <option value="2" style="font-weight: 700;" {{ $order->order_status == 2 ? 'selected' : '' }}>{{ __('translate.Confirmed') }}</option>
                                                            <option value="3" style="font-weight: 700;" {{ $order->order_status == 3 ? 'selected' : '' }}>{{ __('translate.Processing') }}</option>
                                                            <option value="4" style="font-weight: 700;" {{ $order->order_status == 4 ? 'selected' : '' }}>{{ __('translate.Food on the way') }}</option>
                                                            <option value="5" style="font-weight: 700;" {{ $order->order_status == 5 ? 'selected' : '' }}>{{ __('translate.Delivered') }}</option>
                                                            <option value="6" style="font-weight: 700;" {{ $order->order_status == 6 ? 'selected' : '' }}>{{ __('translate.Cancel') }}</option>
                                                        </select>
                                                    </div>
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

        $(document).on('change', '.table-order-status-select', function() {
            var $select = $(this);
            var orderId = $select.data('order-id');
            var prevStatus = $select.data('prev-status');
            var newStatus = $select.val();

            // Client-side instant optimistic status map for zero-latency real-time response
            var statusMap = {
                '1': { label: "{{ __('translate.Pending') }}", tagClass: 'tag denger' },
                '2': { label: "{{ __('translate.Confirmed') }}", tagClass: 'tag' },
                '3': { label: "{{ __('translate.Processing') }}", tagClass: 'tag' },
                '4': { label: "{{ __('translate.Food on the way') }}", tagClass: 'tag' },
                '5': { label: "{{ __('translate.Delivered') }}", tagClass: 'tag' },
                '6': { label: "{{ __('translate.Cancel') }}", tagClass: 'tag denger' }
            };

            // Immediately update the State tag in real-time
            if (statusMap[newStatus]) {
                $('#order-tag-' + orderId).attr('class', statusMap[newStatus].tagClass).text(statusMap[newStatus].label);
            }

            $.ajax({
                url: '{{ url("admin/order-status-change") }}/' + orderId,
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    order_status: newStatus
                },
                dataType: 'json',
                beforeSend: function() {
                    $select.prop('disabled', true);
                },
                success: function(res) {
                    $select.prop('disabled', false);
                    if (res && res.status === 'success') {
                        $select.data('prev-status', newStatus);
                        if (res.tag_class && res.state_label) {
                            $('#order-tag-' + orderId).attr('class', res.tag_class).text(res.state_label);
                        }
                        if (typeof toastr !== 'undefined') {
                            toastr.success(res.message);
                        }
                    } else {
                        if (typeof toastr !== 'undefined') {
                            toastr.error((res && res.message) ? res.message : 'Failed to update order status');
                        }
                        $select.val(prevStatus);
                        if (statusMap[prevStatus]) {
                            $('#order-tag-' + orderId).attr('class', statusMap[prevStatus].tagClass).text(statusMap[prevStatus].label);
                        }
                    }
                },
                error: function() {
                    $select.prop('disabled', false);
                    $select.val(prevStatus);
                    if (statusMap[prevStatus]) {
                        $('#order-tag-' + orderId).attr('class', statusMap[prevStatus].tagClass).text(statusMap[prevStatus].label);
                    }
                    if (typeof toastr !== 'undefined') {
                        toastr.error('Error updating order status. Please check your connection.');
                    }
                }
            });
        });
    </script>
@endpush
