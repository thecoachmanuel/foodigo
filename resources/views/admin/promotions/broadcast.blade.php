@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Broadcast & Promos') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Broadcast & Promos') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Promotion') }} >> {{ __('translate.Broadcast & Promos') }}</p>
@endsection

@section('body-content')
    <!-- crancy Dashboard -->
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <!-- Dashboard Inner -->
                        <div class="crancy-dsinner">
                            
                            <!-- Send Broadcast / Promo Notification Form -->
                            <div class="row">
                                <div class="col-12 mg-top-30">
                                    <div class="crancy-product-card">
                                        <div class="create_new_btn_inline_box">
                                            <h4 class="crancy-product-card__title">
                                                <i class="fa fa-bullhorn text-primary me-2"></i> {{ __('translate.Send Real-Time Notification & Promo') }}
                                            </h4>
                                        </div>

                                        <form action="{{ route('admin.broadcast-promos.store') }}" method="POST">
                                            @csrf
                                            <div class="row mg-top-20">
                                                <div class="col-md-6">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Notification Title') }} *</label>
                                                        <input class="crancy__item-input" type="text" name="title" id="title" placeholder="e.g. Weekend Flash Sale! 30% OFF 🍔" required>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Target Audience') }} *</label>
                                                        <select class="form-select crancy__item-input" name="target_type" id="target_type" required style="height: 48px; border-radius: 8px;">
                                                            <option value="all">{{ __('translate.All (Customers & Restaurants)') }}</option>
                                                            <option value="users" selected>{{ __('translate.Customers Only') }}</option>
                                                            <option value="restaurants">{{ __('translate.Restaurants Only') }}</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Notification Type') }} *</label>
                                                        <select class="form-select crancy__item-input" name="type" id="type" required style="height: 48px; border-radius: 8px;">
                                                            <option value="promo" selected>{{ __('translate.Promo / Discount Deal') }}</option>
                                                            <option value="broadcast">{{ __('translate.General Announcement') }}</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Message / Promo Text') }} *</label>
                                                        <textarea class="crancy__item-input crancy__item-textarea" name="message" id="message" rows="3" placeholder="Enter promo details or announcement message that will be delivered live to users and restaurants in the app..." required style="min-height: 90px; padding: 12px;"></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Action / Deep Link URL (Optional)') }}</label>
                                                        <input class="crancy__item-input" type="text" name="action_url" id="action_url" placeholder="e.g. /(user)/home/all-food or promo coupon code">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="crancy__item-form--group mg-top-form-20">
                                                        <label class="crancy__item-label">{{ __('translate.Image / Banner URL (Optional)') }}</label>
                                                        <input class="crancy__item-input" type="text" name="image" id="image" placeholder="https://example.com/promo-banner.jpg">
                                                    </div>
                                                </div>

                                                <div class="col-12 mg-top-30">
                                                    <button type="submit" class="crancy-btn crancy-btn__primary">
                                                        <i class="fa fa-paper-plane me-1"></i> {{ __('translate.Broadcast Live Notification') }}
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Past Sent Broadcasts Table -->
                            <div class="row mg-top-30">
                                <div class="col-12">
                                    <div class="crancy-product-card">
                                        <div class="create_new_btn_inline_box">
                                            <h4 class="crancy-product-card__title">{{ __('translate.Broadcast History & Past Promos') }}</h4>
                                        </div>

                                        <div class="table-responsive mg-top-20">
                                            <table class="crancy-table__main crancy-table__main-v3">
                                                <thead class="crancy-table__head">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>{{ __('translate.Title & Message') }}</th>
                                                        <th>{{ __('translate.Audience') }}</th>
                                                        <th>{{ __('translate.Type') }}</th>
                                                        <th>{{ __('translate.Date & Time') }}</th>
                                                        <th>{{ __('translate.Action') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="crancy-table__body">
                                                    @forelse($notifications as $index => $notif)
                                                        <tr>
                                                            <td>{{ $notifications->firstItem() + $index }}</td>
                                                            <td>
                                                                <div style="max-width: 320px;">
                                                                    <strong style="color: #1e293b; font-size: 14px;">{{ $notif->title }}</strong>
                                                                    <p style="margin: 2px 0 0; font-size: 12px; color: #64748b; line-height: 1.4;">{{ Str::limit($notif->message, 120) }}</p>
                                                                    @if($notif->action_url)
                                                                        <small class="text-primary"><i class="fa fa-link"></i> {{ $notif->action_url }}</small>
                                                                    @endif
                                                                </div>
                                                            </td>
                                                            <td>
                                                                @if($notif->target_type == 'all')
                                                                    <span class="badge bg-primary text-white" style="font-size: 11px; padding: 4px 8px;">{{ __('translate.All Users & Stores') }}</span>
                                                                @elseif($notif->target_type == 'users')
                                                                    <span class="badge bg-success text-white" style="font-size: 11px; padding: 4px 8px;">{{ __('translate.Customers') }}</span>
                                                                @elseif($notif->target_type == 'restaurants')
                                                                    <span class="badge bg-warning text-dark" style="font-size: 11px; padding: 4px 8px;">{{ __('translate.Restaurants') }}</span>
                                                                @endif
                                                            </td>
                                                            <td>
                                                                @if($notif->type == 'promo')
                                                                    <span class="badge bg-danger text-white" style="font-size: 11px; padding: 4px 8px;"><i class="fa fa-tag"></i> {{ __('translate.Promo') }}</span>
                                                                @else
                                                                    <span class="badge bg-info text-white" style="font-size: 11px; padding: 4px 8px;"><i class="fa fa-bullhorn"></i> {{ __('translate.Broadcast') }}</span>
                                                                @endif
                                                            </td>
                                                            <td>
                                                                <div style="font-size: 12px; font-weight: 600; color: #334155;">{{ $notif->created_at->format('M j, Y') }}</div>
                                                                <div style="font-size: 11px; color: #94a3b8;"><i class="fa fa-clock-o"></i> {{ $notif->created_at->format('g:i A') }}</div>
                                                            </td>
                                                            <td>
                                                                <form action="{{ route('admin.broadcast-promos.destroy', $notif->id) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this broadcast?');">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                    <button type="submit" class="crancy-btn crancy-btn__danger" style="padding: 4px 10px; font-size: 12px; height: 32px; border-radius: 6px;">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    @empty
                                                        <tr>
                                                            <td colspan="6" class="text-center py-4 text-muted">
                                                                <i class="fa fa-bell-slash-o fa-2x mb-2 d-block opacity-50"></i>
                                                                {{ __('translate.No broadcast notifications sent yet. Use the form above to send your first real-time broadcast or promo!') }}
                                                            </td>
                                                        </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                        </div>

                                        @if($notifications->hasPages())
                                            <div class="mg-top-20">
                                                {{ $notifications->links() }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
