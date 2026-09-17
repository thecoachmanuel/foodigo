@extends('deliveryman.master_layout')
@section('title')
    <title>{{ __('translate.Deliveryman || My Earnings') }}</title>
@endsection
@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Dashboard') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Dashboard') }} >> {{ __('translate.My Earnings') }}</p>
@endsection
@section('body-content')

    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <!-- Dashboard Inner -->
                        <div class="crancy-dsinner">
                            <div class="row">
                                <div class="col-lg-4 col-12 mg-top-30">
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
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-4 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Commission Deducted') }}</h4>
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
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-4 col-12 mg-top-30">
                                    <!-- Progress Card -->
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
                                    <!-- End Progress Card -->
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-12 mg-top-30">
                                    <!-- Progress Card -->
                                    <div class="crancy-ecom-card crancy-ecom-card__v2">
                                        <div class="flex-main">
                                            <div class="flex-1">
                                                <div class="crancy-ecom-card__heading">
                                                    <div class="crancy-ecom-card__icon">
                                                        <h4 class="crancy-ecom-card__title">{{ __('translate.Available Balance') }}</h4>
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
                                                        <path d="M24.5 12.8334V9.33337C24.5 8.04471 23.4553 7.00004 22.1667 7.00004H5.83333C4.54467 7.00004 3.5 8.04471 3.5 9.33337V18.6667C3.5 19.9554 4.54467 21 5.83333 21H14" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M21 24.5C23.4116 24.5 25.3667 22.5449 25.3667 20.1333C25.3667 17.7218 23.4116 15.7667 21 15.7667C18.5884 15.7667 16.6333 17.7218 16.6333 20.1333C16.6333 22.5449 18.5884 24.5 21 24.5Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M21 18.3834V20.1334L22.1667 21.3001" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M3.5 11.6666H24.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                                <div class="col-lg-4 col-12 mg-top-30">
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
                                                            <h3 class="crancy-ecom-card__amount">{{ currency($total_withdraw_amount) }}</h3>
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

                                <div class="col-lg-4 col-12 mg-top-30">
                                    <!-- Progress Card -->
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
                                                        <path d="M14 25.6667C20.4433 25.6667 25.6667 20.4433 25.6667 14C25.6667 7.55668 20.4433 2.33334 14 2.33334C7.55668 2.33334 2.33334 7.55668 2.33334 14C2.33334 20.4433 7.55668 25.6667 14 25.6667Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                        <path d="M14 7V14L18.6667 16.3333" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                    </svg>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>
                            </div>

                            <div class="crancy-table crancy-table--v3 mg-top-30">
                                <div class="crancy-customer-filter">
                                    <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between create_new_btn_box">
                                        <div class="crancy-header__form crancy-header__form--customer create_new_btn_inline_box">
                                            <h4 class="crancy-product-card__title">{{ __('translate.Withdraw List') }}</h4>
                                            <a href="{{ route('deliveryman.my-withdraw.create') }}" class="crancy-btn"><span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                                    <path d="M8 1V15" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M1 8H15" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                                </span> {{ __('translate.New Withdraw') }}</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- crancy Table -->
                                <div id="crancy-table__main_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer bg-white">
                                    <table class="crancy-table__main crancy-table__main-v3 dataTable no-footer" id="dataTable">
                                        <!-- crancy Table Head -->
                                        <thead class="crancy-table__head">
                                        <tr>
                                            <th class="crancy-table__column-2 crancy-table__h2 sorting">
                                                {{ __('translate.Serial') }}
                                            </th>
                                            <th class="crancy-table__column-2 crancy-table__h2 sorting">
                                                {{ __('translate.Withdraw Method') }}
                                            </th>
                                            <th class="crancy-table__column-2 crancy-table__h2 sorting">
                                                {{ __('translate.Total Amount') }}
                                            </th>
                                            <th class="crancy-table__column-2 crancy-table__h2 sorting">
                                                {{ __('translate.Withdraw Amount') }}
                                            </th>
                                            <th class="crancy-table__column-2 crancy-table__h2 sorting">
                                                {{ __('translate.Withdraw Charge') }}
                                            </th>
                                            <th class="crancy-table__column-2 crancy-table__h2 sorting">
                                                {{ __('translate.Status') }}
                                            </th>
                                            <th class="crancy-table__column-3 crancy-table__h3 sorting">
                                                {{ __('translate.Action') }}
                                            </th>
                                        </tr>
                                        </thead>
                                        <!-- crancy Table Body -->
                                        <tbody class="crancy-table__body">
                                        @forelse ($withdraw_list as $index => $withdraw)
                                            <tr class="odd">
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ ++$index }}</h4>
                                                </td>
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">
                                                        <a href="#">{{ $withdraw->withdraw_method_name }}</a>
                                                    </h4>
                                                </td>
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ currency($withdraw->total_amount) }}</h4>
                                                </td>
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ currency($withdraw->withdraw_amount) }}</h4>
                                                </td>
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <h4 class="crancy-table__product-title">{{ currency($withdraw->charge_amount) }}</h4>
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
                                                <td class="crancy-table__column-2 crancy-table__data-2">
                                                    <a data-bs-toggle="modal"
                                                       data-bs-target="#withdrawShow{{ $withdraw->id }}" class="crancy-btn"><i class="fas fa-eye"></i> {{ __('translate.View') }}</a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="7" class="text-center py-4 text-muted">{{ __('translate.No withdrawal requests found') }}</td>
                                            </tr>
                                        @endforelse
                                        </tbody>
                                        <!-- End crancy Table Body -->
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- End Dashboard Inner -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    @foreach ($withdraw_list as $index => $withdraw)
        <div class="modal fade" id="withdrawShow{{ $withdraw->id }}" tabindex="-1" aria-labelledby="exampleModalLabel{{ $withdraw->id }}"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel{{ $withdraw->id }}">{{ __('translate.Withdraw Details') }}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-striped">
                            <tbody>
                            <tr>
                                <td>{{ __('translate.Withdraw Method') }}</td>
                                <td>{{ $withdraw->withdraw_method_name }}</td>
                            </tr>
                            <tr>
                                <td>{{ __('translate.Total Amount') }}</td>
                                <td>{{ currency($withdraw->total_amount) }}</td>
                            </tr>
                            <tr>
                                <td>{{ __('translate.Withdraw Amount') }}</td>
                                <td>{{ currency($withdraw->withdraw_amount) }}</td>
                            </tr>
                            <tr>
                                <td>{{ __('translate.Charge Amount') }}</td>
                                <td>{{ currency($withdraw->charge_amount) }}</td>
                            </tr>
                            <tr>
                                <td>{{ __('translate.Status') }}</td>
                                <td>
                                    @if ($withdraw->status == 'approved')
                                        <span class="badge bg-success text-white">{{ __('translate.Approved') }}</span>
                                    @elseif ($withdraw->status == 'rejected')
                                        <span class="badge bg-danger text-white">{{ __('translate.Rejected') }}</span>
                                    @else
                                        <span class="badge bg-warning text-dark">{{ __('translate.Pending') }}</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <td>{{ __('translate.Bank/Account Info') }}</td>
                                <td>{!! clean(nl2br(html_decode($withdraw->description))) !!}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    @endforeach

@endsection
