@extends('deliveryman.master_layout')
@section('title')
    <title>{{ __('translate.Withdraw Detail') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Withdraw Detail') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Withdraw') }} >> {{ __('translate.Withdraw Detail') }}</p>
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
                                            <h4 class="crancy-product-card__title">{{ __('translate.Withdraw Detail') }}</h4>
                                            <a href="{{ route('deliveryman.my-withdraw.index') }}" class="crancy-btn"><i class="fa fa-list"></i> {{ __('translate.Withdraw List') }}</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- crancy Table -->
                                <div id="crancy-table__main_wrapper" class="dt-bootstrap5 no-footer">

                                    <table class="crancy-table__main crancy-table__main-v3 no-footer">

                                        <!-- crancy Table Body -->
                                        <tbody class="crancy-table__body review-detials">

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Delivery Man') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ $withdraw?->deliveryman?->fname . ' ' . $withdraw?->deliveryman?->lname }}</h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Total Amount') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ currency($withdraw->total_amount) }}</h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Withdraw Amount') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ currency($withdraw->withdraw_amount) }}</h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Withdraw Charge') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ currency($withdraw->charge_amount) }}</h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Created at') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">
                                                        {{ $withdraw->created_at->format('d F Y') }}
                                                    </h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Withdraw Method') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">
                                                        {{ $withdraw->withdraw_method_name }}
                                                    </h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Bank/Account Info') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{!! clean(nl2br(html_decode($withdraw->description))) !!}</h4>
                                                </td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ __('translate.Status') }}</h4>
                                                </td>

                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    @if ($withdraw->status == 'approved')
                                                        <span class="badge bg-success text-white">{{ __('translate.Approved') }}</span>
                                                    @elseif ($withdraw->status == 'rejected')
                                                        <span class="badge bg-danger text-white">{{ __('translate.Rejected') }}</span>
                                                    @else
                                                        <span class="badge bg-warning text-dark">{{ __('translate.Pending') }}</span>
                                                    @endif
                                                </td>
                                            </tr>

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

@endsection


