@forelse($restaurants as $restaurant)
    <div class="col-xxl-4 col-sm-6 col-lg-4" data-aos="fade-up" data-aos-delay="100">
        <div class="food_card_item">
            <div class="food_card_item_thumb_main">
                <div class="food_card_item_thumb">
                    <img src="{{ asset($restaurant->cover_image) }}" alt="{{ $restaurant->restaurant_name }}">
                </div>
                <div class="food_card_item_thumb_overlay">
                    @if ($restaurant->is_featured == 'enable')
                        <div class="badge">
                            <h6>{{ __('translate.Featured') }}</h6>
                        </div>
                    @endif

                    @php
                        $currentTime = now()->format('H:i');
                        $openingHour = $restaurant->opening_hour;
                        $closingHour = $restaurant->closing_hour;
                    @endphp

                    @if ($currentTime >= $openingHour && $currentTime <= $closingHour)
                        <a href="javascript:;" class="open_btn">
                            {{ __('translate.Open') }}
                        </a>
                    @else
                        <a href="javascript:;" class="open_btn closed_btn">
                            {{ __('translate.Closed') }}
                        </a>
                    @endif
                </div>
            </div>

            <div class="food_card_restaurant_logo_main">
                <div class="food_card_restaurant_logo">
                    <img src="{{ asset($restaurant->logo) }}" alt="logo">
                </div>
            </div>
            <a href="{{ route('single.restaurant', $restaurant->slug) }}" class="food_card_restaurant_name">
                <h5>
                    {{ $restaurant->restaurant_name }}
                    @if($restaurant->is_trusted == 1)
                        <span>
                            <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M17.1557 7.68198C16.8851 7.52464 16.6419 7.32423 16.4357 7.08865C16.4566 6.76066 16.5347 6.43885 16.6666 6.13781C16.9091 5.45365 17.1832 4.67865 16.7432 4.07615C16.3032 3.47365 15.4724 3.49281 14.7432 3.50948C14.421 3.54263 14.0955 3.52065 13.7807 3.44448C13.613 3.17157 13.4932 2.87197 13.4266 2.55865C13.2199 1.85448 12.9841 1.05865 12.2599 0.820313C11.5616 0.595313 10.9149 1.09031 10.3432 1.52531C10.0966 1.75058 9.81074 1.92879 9.4999 2.05115C9.18581 1.92979 8.89681 1.75153 8.6474 1.52531C8.0774 1.09281 7.43323 0.592813 6.73156 0.821147C6.00906 1.05615 5.77323 1.85448 5.5649 2.55865C5.49834 2.87095 5.37974 3.16984 5.21406 3.44281C4.89866 3.51878 4.57275 3.54131 4.2499 3.50948C3.51823 3.48948 2.69406 3.46781 2.2499 4.07615C1.80573 4.68448 2.08323 5.45365 2.32656 6.13698C2.46026 6.43757 2.53955 6.75951 2.56073 7.08781C2.35496 7.32371 2.11204 7.52441 1.84156 7.68198C1.23156 8.09865 0.539062 8.57281 0.539062 9.34281C0.539062 10.1128 1.23156 10.5853 1.84156 11.0036C2.11198 11.161 2.3549 11.3614 2.56073 11.597C2.54178 11.9252 2.46475 12.2474 2.33323 12.5486C2.09156 13.232 1.81823 14.007 2.2574 14.6095C2.69656 15.212 3.5249 15.1928 4.2574 15.1761C4.57987 15.143 4.90564 15.1649 5.22073 15.2411C5.38771 15.5143 5.50718 15.8139 5.57406 16.127C5.78073 16.8311 6.01656 17.627 6.74073 17.8653C6.85683 17.9025 6.97797 17.9217 7.0999 17.922C7.6859 17.8379 8.23055 17.5714 8.65656 17.1603C8.90324 16.935 9.18906 16.7568 9.4999 16.6345C9.81398 16.7558 10.103 16.9341 10.3524 17.1603C10.9232 17.5961 11.5699 18.0936 12.2691 17.8645C12.9916 17.6295 13.2274 16.8311 13.4357 16.1278C13.5025 15.8149 13.622 15.5157 13.7891 15.2428C14.1033 15.1663 14.4282 15.1438 14.7499 15.1761C15.4816 15.1936 16.3057 15.2178 16.7499 14.6095C17.1941 14.0011 16.9166 13.232 16.6732 12.5478C16.5404 12.2475 16.4612 11.9263 16.4391 11.5986C16.6449 11.3625 16.8882 11.1618 17.1591 11.0045C17.7691 10.5878 18.4616 10.1128 18.4616 9.34281C18.4616 8.57281 17.7666 8.09948 17.1557 7.68198Z" fill="#49ADF4"/>
                                <path d="M8.6667 11.6345C8.58462 11.6347 8.50332 11.6186 8.42751 11.5871C8.3517 11.5556 8.28288 11.5094 8.22504 11.4512L6.55837 9.78452C6.44797 9.66604 6.38787 9.50934 6.39072 9.34742C6.39358 9.1855 6.45917 9.03102 6.57368 8.91651C6.68819 8.802 6.84268 8.7364 7.0046 8.73354C7.16652 8.73069 7.32322 8.79079 7.4417 8.90119L8.72504 10.1845L11.625 8.00952C11.7576 7.91007 11.9243 7.86736 12.0884 7.89081C12.2525 7.91425 12.4006 8.00192 12.5 8.13452C12.5995 8.26713 12.6422 8.43382 12.6188 8.59791C12.5953 8.76201 12.5076 8.91007 12.375 9.00952L9.0417 11.5095C8.93349 11.5906 8.80192 11.6345 8.6667 11.6345Z" fill="white"/>
                            </svg>
                        </span>
                    @endif
                </h5>
            </a>
            <div class="food_card_item_inner">
                <div class="food_card_btm_item">
                    <p class="food_card_company_location">
                        <span>
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <ellipse cx="8" cy="7.33333" rx="2" ry="2" stroke-width="1.5"></ellipse>
                                <path d="M14 7.25926C14 10.5321 10.25 14.6667 8 14.6667C5.75 14.6667 2 10.5321 2 7.25926C2 3.98646 4.68629 1.33333 8 1.33333C11.3137 1.33333 14 3.98646 14 7.25926Z" stroke-width="1.5"></path>
                            </svg>
                        </span>
                        {{ \Illuminate\Support\Str::limit($restaurant?->address, 28) }}
                    </p>

                    <span class="dot"></span>

                    <div class="food_card_item_inner_top">
                        <p>
                            <span>
                                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.52461 1.45356C7.12812 0.182149 8.87187 0.182146 9.47539 1.45356L10.5184 3.65088C10.7581 4.15576 11.2213 4.5057 11.7572 4.58666L14.0895 4.93902C15.439 5.1429 15.9779 6.86716 15.0013 7.85681L13.3137 9.56719C12.9259 9.96019 12.749 10.5264 12.8405 11.0813L13.2389 13.4964C13.4694 14.8938 12.0587 15.9595 10.8517 15.2997L8.76562 14.1595C8.28631 13.8975 7.71369 13.8975 7.23438 14.1595L5.14832 15.2997C3.94129 15.9595 2.53057 14.8938 2.76109 13.4964L3.15949 11.0813C3.25103 10.5264 3.07408 9.96019 2.68631 9.56719L0.998656 7.85681C0.0221496 6.86716 0.560996 5.1429 1.9105 4.93902L4.24278 4.58666C4.77867 4.5057 5.24192 4.15576 5.48158 3.65088L6.52461 1.45356Z" fill="#F9C200"/>
                                </svg>
                            </span>
                            {{ round($restaurant->reviews_avg_rating ?? 0) }}
                            <span>({{ $restaurant->reviews_count }})</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@empty
    <div class="col-12 text-center">
        <div class="maintenance-item">
            <div class="maintenance-thumb">
                <img src="{{ asset(isset($general_setting) ? $general_setting->not_found : 'frontend/assets/images/not-found.png') }}" alt="not found">
            </div>
            <div class="maintenance-item-txt">
                <h2>{{ __('translate.Sorry!! Restaurant Not Found') }}</h2>
                <p>{{ __('translate.Whoops... this information is not available for a moment') }}</p>
            </div>
        </div>
    </div>
@endforelse
