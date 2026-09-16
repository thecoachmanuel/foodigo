@extends('frontend.layouts.master')

@section('title')
    <title>{{ $seo_setting->seo_title }}</title>
    <meta name="title" content="{{ $seo_setting->seo_title }}" />
    <meta name="description" content="{!! strip_tags(clean($seo_setting->seo_description)) !!}" />
@endsection

@section('content')
    <main class="search_V1_bg">
        <!-- inner_banner-part start  -->
        <div class="inner_banner">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-12">
                        <div class="banner_slick_main_item_box_main">
                            <form id="search-form" action="{{ route('search') }}" method="get">
                                <div class="banner_slick_main_item_box">
                                    <div class="form-control_main">
                                    <span class="icon">
                                        <svg width="24" height="25" viewBox="0 0 24 25" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="11.7659" cy="12.2666" r="8.98856" stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"></circle>
                                            <path d="M18.0176 18.9852L21.5416 22.5001" stroke-width="1.5"
                                                  stroke-linecap="round"
                                                  stroke-linejoin="round"></path>
                                        </svg>
                                    </span>
                                        <input type="text" class="form-control" id="search_input"
                                               placeholder="{{ __('translate.Food Title') }}" name="search_value" value="{{ request('search_value') }}" autocomplete="off">
                                    </div>
                                    <button type="submit" class="thm-btn">{{__('translate.Search now')}} !</button>
                                </div>
                            </form>
                        </div>

                        <ul class="popular_link">
                            <li>{{ __('translate.Popular') }}:</li>
                            @php
                                $tags = json_decode($home_translate->intro_tags, true) ?? [];
                                $tagsCount = count($tags);
                            @endphp
                            @foreach($tags as $index => $tag)
                                <li>
                                    <a href="{{ route('search', ['search_value' => $tag['value']]) }}">{{ $tag['value'] }}</a>
                                    @if ($index < $tagsCount - 1)
                                        ,
                                    @endif
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- inner_banner-part end -->


        <!-- offer part start -->

        <section class="offer">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-3 col-md-4">
                        <!-- Mobile Filter Toggle Button -->
                        <div class="d-md-none mb-3">
                            <button id="mobileFilterToggleBtn" class="thm-btn w-100 d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#mobileFilterCollapse" aria-expanded="false" aria-controls="mobileFilterCollapse" style="padding: 12px 18px; border-radius: 10px; font-weight: 600;">
                                <span>
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="me-2"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon></svg>
                                    {{__('translate.Filters')}}
                                </span>
                                <span class="d-flex align-items-center">
                                    <span class="badge bg-white text-dark rounded-pill px-2 py-1 me-2" id="activeFilterBadge" style="display:none; font-size: 12px;">0</span>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="filter-chevron"><polyline points="6 9 12 15 18 9"></polyline></svg>
                                </span>
                            </button>
                        </div>

                        <div class="collapse d-md-block" id="mobileFilterCollapse">
                            <div class="filter">

                                <div class="filter_txt">
                                    <h6>{{__('translate.Filters')}}</h6>
                                </div>

                                <div class="filter_item">
                                    <form id="search-filter-form" action="{{ route('search') }}" method="get">
                                        <div class="filter_inner">
                                            <div class="accordion" id="accordionPanelsStayOpenExample">
                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                                        <button class="accordion-button" type="button"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#panelsStayOpen-collapseOne"
                                                                aria-expanded="true"
                                                                aria-controls="panelsStayOpen-collapseOne">
                                                            {{__('translate.Sort by')}}
                                                        </button>
                                                    </h2>
                                                    <div id="panelsStayOpen-collapseOne"
                                                         class="accordion-collapse collapse show"
                                                         aria-labelledby="panelsStayOpen-headingOne">
                                                        <div class="accordion-body">
                                                            <div class="accordion_body_check_item">
                                                                <div class="form-check">
                                                                    <input class="form-check-input sort-filter"
                                                                           type="checkbox"
                                                                           name="sort" value="most_recent"
                                                                           id="sort-most-recent" {{ request('sort') == 'most_recent' ? 'checked' : '' }}>
                                                                    <label class="form-check-label" for="sort-most-recent">
                                                                        {{__('translate.Most recent')}}
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="filter_inner">
                                            <div class="accordion" id="accordionPanelsStayOpenExample_4">
                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="panelsStayOpen-headingfour">
                                                        <button class="accordion-button" type="button"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#panelsStayOpen-collapsefour"
                                                                aria-expanded="true"
                                                                aria-controls="panelsStayOpen-collapsefour">
                                                            {{__('translate.Select Cuisine')}}
                                                        </button>
                                                    </h2>
                                                    <div id="panelsStayOpen-collapsefour"
                                                         class="accordion-collapse collapse show"
                                                         aria-labelledby="panelsStayOpen-headingfour">
                                                        <div class="accordion-body">
                                                            <div class="accordion_body_check_item">
                                                                @forelse($cuisines as $cuisine)
                                                                    <div class="form-check">
                                                                        <input class="form-check-input cuisine-filter"
                                                                               type="checkbox" value="{{ $cuisine->id }}"
                                                                               id="cuisine-{{ $cuisine->id }}"
                                                                               name="cuisine[]" {{ in_array($cuisine->id, (array)request('cuisine', [])) ? 'checked' : '' }}>
                                                                        <label class="form-check-label"
                                                                               for="cuisine-{{ $cuisine->id }}">
                                                                            {{$cuisine->name}}
                                                                        </label>
                                                                    </div>
                                                                @empty
                                                                @endforelse
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="filter_inner">
                                            <div class="accordion" id="accordionPanelsStayOpenExample_5">
                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="panelsStayOpen-headingfive">
                                                        <button class="accordion-button" type="button"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#panelsStayOpen-collapsefive"
                                                                aria-expanded="true"
                                                                aria-controls="panelsStayOpen-collapsefive">
                                                            {{__('translate.Categories')}}
                                                        </button>
                                                    </h2>
                                                    <div id="panelsStayOpen-collapsefive"
                                                         class="accordion-collapse collapse show"
                                                         aria-labelledby="panelsStayOpen-headingfive">
                                                        <div class="accordion-body">
                                                            <div class="accordion_body_check_item">
                                                                @forelse($categories as $index => $category)
                                                                    <div class="form-check category-item"
                                                                         style="display: {{ $index < 5 ? 'block' : 'none' }};">
                                                                        <input class="form-check-input category-filter"
                                                                               {{ in_array($category->id, (array)request('categories', [])) ? 'checked' : '' }}
                                                                               type="checkbox" value="{{ $category->id }}"
                                                                               name="categories[]"
                                                                               id="category-{{ $category->id }}">
                                                                        <label class="form-check-label"
                                                                               for="category-{{ $category->id }}">
                                                                            {{$category->name}}
                                                                        </label>
                                                                    </div>
                                                                @empty
                                                                    <p>{{__('translate.No categories available')}}.</p>
                                                                @endforelse

                                                                <a href="#" id="show-more" class="form-check_btn">
                                                                    {{__('translate.Show more')}}
                                                                    <span>
                                                                        <svg width="12" height="6" viewBox="0 0 12 6"
                                                                             fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                                  d="M0.414376 0.531506C0.673133 0.20806 1.1451 0.155619 1.46855 0.414376L6.00003 4.03956L10.5315 0.414376C10.855 0.155619 11.3269 0.20806 11.5857 0.531506C11.8444 0.854953 11.792 1.32692 11.4685 1.58568L6.46855 5.58568C6.19464 5.80481 5.80542 5.80481 5.53151 5.58568L0.531506 1.58568C0.20806 1.32692 0.155619 0.854953 0.414376 0.531506Z"
                                                                                  fill="#F98C3B"/>
                                                                        </svg>
                                                                    </span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Price Range -->
                                        <div class="filter_item">
                                            <div class="filter_inner">
                                                <div class="accordion" id="accordionPrice">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="headingPrice">
                                                            <button class="accordion-button" type="button"
                                                                    data-bs-toggle="collapse"
                                                                    data-bs-target="#collapsePrice"
                                                                    aria-expanded="true" aria-controls="collapsePrice">
                                                                {{__('translate.Price Range')}}
                                                            </button>
                                                        </h2>
                                                        <div id="collapsePrice" class="accordion-collapse collapse show"
                                                             aria-labelledby="headingPrice">
                                                            <div class="accordion-body">
                                                                <span class="price">
                                                                    <span class="range-slider style-1">
                                                                        <span id="slider-tooltips"
                                                                              class="slider-range mb-3 noUi-target noUi-ltr noUi-horizontal noUi-txt-dir-ltr"></span>
                                                                        <span class="example-val_item">
                                                                            <span class="example-val" id="slider-margin-value-min">0</span>
                                                                            <span class="example-val" id="slider-margin-value-max">0</span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                                <input type="hidden" name="price_min" id="price_min" value="{{ request('price_min', 0) }}">
                                                                <input type="hidden" name="price_max" id="price_max" value="{{ request('price_max', $sliderMax ?? 30000) }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <button class="thm-btn mt-3 w-100" type="submit" id="btn-apply-filters">{{ __('translate.Find Products') }}</button>
                                        <button class="btn btn-outline-secondary mt-2 w-100 btn-sm" type="button" id="btn-reset-filters" style="border-radius: 8px; font-weight: 500; padding: 8px;">{{ __('translate.Reset Filters') }}</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xxl-9 col-md-8">
                        <div class="offer_top_ber">
                            <div class="offer_top_ber_left_item">

                                <!-- Food & Restaurants tab btn  -->
                                <ul class="nav nav-pills " id="pills-tab" role="tablist">
                                    <li class="nav-item food_paginate" role="presentation">
                                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                                data-bs-target="#pills-home" type="button" role="tab"
                                                aria-controls="pills-home" aria-selected="true">{{__('translate.Food')}} (<span id="total-foods-count">{{ $foods->total() }}</span>)
                                        </button>
                                    </li>
                                    <li class="nav-item restaurant_paginate" role="presentation">
                                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                                data-bs-target="#pills-profile" type="button" role="tab"
                                                aria-controls="pills-profile" aria-selected="false">{{__('translate.Restaurants')}} (<span id="total-restaurants-count">{{ $restaurants->count() }}</span>)
                                        </button>
                                    </li>
                                </ul>

                            </div>
                        </div>

                        <!-- Food & Restaurants tab item  -->
                        <div class="tab-content" id="pills-tabContent_1">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                                 aria-labelledby="pills-home-tab">
                                <!-- Perfect for lunch start  -->
                                <div class="row row g-4 position-relative" id="foods-section">
                                    @include('frontend.search.partials.foods')
                                </div>
                                <!-- Perfect for lunch end -->

                            </div>
                            <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                                 aria-labelledby="pills-profile-tab">
                                <section class="restaurant restaurant_two restaurantbg  ">
                                    <div class="container paddiing_0 ">
                                        <div class="row g-4 position-relative" id="restaurants-section">
                                            @include('frontend.search.partials.restaurants')
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>


                        <!-- pagination part start  -->
                        <div class="row food_pagination" id="pagination-section">
                            {{ $foods->links('frontend.layouts.partials.pagination') }}
                        </div>
                        <!-- pagination part end  -->
                    </div>
                </div>
            </div>
        </section>


        <!-- offer part end -->

        <!-- mobile app  part start -->
        @include('frontend.layouts.partials.mobile_app')
        <!-- mobile app  part end -->


    </main>
@endsection

@push('js_section')
    <script src="{{ asset('frontend/assets/js/nouislider.min.js') }}"></script>

    <script>
        "use strict";
        $(document).ready(function () {
            var currencyIcon = @json(session('currency_icon', '₦'));
            var currencyPos = @json(session('currency_position', 'before_price'));

            function formatPrice(value) {
                var num = Math.round(Number(value));
                var formatted = num.toLocaleString();
                return (currencyPos === 'after_price') ? (formatted + ' ' + currencyIcon) : (currencyIcon + formatted);
            }

            var sliderMax = {{ (int) ($sliderMax ?? 30000) }};
            var priceMin = {{ (int) request('price_min', 0) }};
            var priceMax = {{ (int) request('price_max', $sliderMax ?? 30000) }};
            if (priceMax <= 0 || priceMax > sliderMax) {
                priceMax = sliderMax;
            }

            var tooltipSlider = document.getElementById("slider-tooltips");
            var formatValues = [
                document.getElementById("slider-margin-value-min"),
                document.getElementById("slider-margin-value-max"),
            ];
            var priceMinInput = document.getElementById('price_min');
            var priceMaxInput = document.getElementById('price_max');

            if (tooltipSlider && typeof noUiSlider !== 'undefined') {
                noUiSlider.create(tooltipSlider, {
                    start: [priceMin, priceMax],
                    connect: true,
                    step: 100,
                    range: {
                        min: 0,
                        max: sliderMax,
                    },
                    format: {
                        to: function (numericValue) {
                            return Math.round(numericValue);
                        },
                        from: function (formattedValue) {
                            return Number(formattedValue);
                        }
                    }
                });

                formatValues[0].innerHTML = formatPrice(priceMin);
                formatValues[1].innerHTML = formatPrice(priceMax);
                priceMinInput.value = priceMin;
                priceMaxInput.value = priceMax;

                tooltipSlider.noUiSlider.on("update", function (values) {
                    formatValues[0].innerHTML = formatPrice(values[0]);
                    formatValues[1].innerHTML = formatPrice(values[1]);
                    priceMinInput.value = Math.round(values[0]);
                    priceMaxInput.value = Math.round(values[1]);
                });

                tooltipSlider.noUiSlider.on("change", function () {
                    triggerLiveFilter(1);
                });
            }

            function updateFilterBadge() {
                var count = 0;
                if ($('#sort-most-recent').is(':checked')) count++;
                count += $('.cuisine-filter:checked').length;
                count += $('.category-filter:checked').length;

                var curMin = parseInt($('#price_min').val() || 0);
                var curMax = parseInt($('#price_max').val() || sliderMax);
                if (curMin > 0 || (curMax > 0 && curMax < sliderMax)) {
                    count++;
                }

                if (count > 0) {
                    $('#activeFilterBadge').text(count).show();
                } else {
                    $('#activeFilterBadge').hide();
                }
            }
            updateFilterBadge();

            // Realtime Live Filter function
            var currentAjaxRequest = null;
            var searchDebounceTimer = null;

            function triggerLiveFilter(page) {
                updateFilterBadge();

                var searchValue = $.trim($('#search_input').val());
                var sort = $('#sort-most-recent').is(':checked') ? 'most_recent' : '';
                var cuisines = [];
                $('.cuisine-filter:checked').each(function () {
                    cuisines.push($(this).val());
                });
                var categories = [];
                $('.category-filter:checked').each(function () {
                    categories.push($(this).val());
                });
                var pMin = $('#price_min').val() || 0;
                var pMax = $('#price_max').val() || sliderMax;

                var requestData = {
                    search_value: searchValue,
                    sort: sort,
                    cuisine: cuisines,
                    categories: categories,
                    price_min: pMin,
                    price_max: pMax,
                    page: page || 1
                };

                // Visual loading cue
                $('#foods-section, #restaurants-section').css({
                    'opacity': '0.45',
                    'pointer-events': 'none',
                    'transition': 'opacity 0.2s ease'
                });

                if (currentAjaxRequest && currentAjaxRequest.readyState !== 4) {
                    currentAjaxRequest.abort();
                }

                currentAjaxRequest = $.ajax({
                    url: "{{ route('search') }}",
                    type: "GET",
                    data: requestData,
                    dataType: "json",
                    success: function (res) {
                        if (res.foods_html !== undefined) {
                            $('#foods-section').html(res.foods_html);
                        }
                        if (res.restaurants_html !== undefined) {
                            $('#restaurants-section').html(res.restaurants_html);
                        }
                        if (res.pagination_html !== undefined) {
                            $('#pagination-section').html(res.pagination_html);
                        }
                        if (res.total_foods !== undefined) {
                            $('#total-foods-count').text(res.total_foods);
                        }
                        if (res.total_restaurants !== undefined) {
                            $('#total-restaurants-count').text(res.total_restaurants);
                        }

                        // Update browser URL query string smoothly
                        try {
                            var params = new URLSearchParams();
                            if (searchValue) params.set('search_value', searchValue);
                            if (sort) params.set('sort', sort);
                            cuisines.forEach(function (c) { params.append('cuisine[]', c); });
                            categories.forEach(function (cat) { params.append('categories[]', cat); });
                            if (pMin > 0) params.set('price_min', pMin);
                            if (pMax > 0 && pMax < sliderMax) params.set('price_max', pMax);
                            if (page && page > 1) params.set('page', page);

                            var newUrl = window.location.pathname + (params.toString() ? ('?' + params.toString()) : '');
                            window.history.replaceState({}, '', newUrl);
                        } catch (e) {}
                    },
                    complete: function () {
                        $('#foods-section, #restaurants-section').css({
                            'opacity': '1',
                            'pointer-events': 'auto'
                        });
                    }
                });
            }

            // Real-time search input with 300ms debounce
            $('#search_input').on('input', function () {
                clearTimeout(searchDebounceTimer);
                searchDebounceTimer = setTimeout(function () {
                    triggerLiveFilter(1);
                }, 300);
            });

            // Prevent default form submit and use AJAX
            $('#search-form, #search-filter-form').on('submit', function (e) {
                e.preventDefault();
                clearTimeout(searchDebounceTimer);
                triggerLiveFilter(1);
            });

            // Checkbox and sort change listeners
            $(document).on('change', '.category-filter, .cuisine-filter, .sort-filter', function () {
                triggerLiveFilter(1);
            });

            // AJAX Pagination click handler
            $(document).on('click', '#pagination-section a', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                if (href && href !== 'javascript::void()' && href !== '#' && href.indexOf('javascript') === -1) {
                    var url = new URL(href, window.location.origin);
                    var page = url.searchParams.get('page') || 1;
                    triggerLiveFilter(page);
                    $('html, body').animate({
                        scrollTop: $('#pills-tab').offset().top - 100
                    }, 300);
                }
            });

            // Reset filters button
            $('#btn-reset-filters').on('click', function () {
                $('#search_input').val('');
                $('.sort-filter').prop('checked', false);
                $('.cuisine-filter').prop('checked', false);
                $('.category-filter').prop('checked', false);

                if (tooltipSlider && tooltipSlider.noUiSlider) {
                    tooltipSlider.noUiSlider.set([0, sliderMax]);
                }
                $('#price_min').val(0);
                $('#price_max').val(sliderMax);

                triggerLiveFilter(1);
            });

            // Category Show More button
            const showMoreButton = document.getElementById('show-more');
            const categoryItems = document.querySelectorAll('.category-item');
            const categoriesToShowInitially = 5;

            if (showMoreButton) {
                showMoreButton.addEventListener('click', function (event) {
                    event.preventDefault();
                    categoryItems.forEach((item, index) => {
                        if (index >= categoriesToShowInitially) {
                            item.style.display = 'block';
                        }
                    });
                    showMoreButton.style.display = 'none';
                });
            }

            // Food & Restaurant tab switching
            $(document).on("click", ".food_paginate", function () {
                $("#pagination-section").removeClass('d-none');
            });
            $(document).on("click", ".restaurant_paginate", function () {
                $("#pagination-section").addClass('d-none');
            });

            // Modal quantity decrement and increment handlers (delegated)
            $(document).on("click", ".btn-minus, .btn-plus", function (e) {
                e.preventDefault();
                var $modal = $(this).closest('.modal');
                var addonIndex = $(this).data("addon-index");
                var $quantityInput = $modal.find(".quantityUpdate_" + addonIndex);
                var $hiddenInput = $modal.find("#qtyInput_" + addonIndex);

                if ($(this).hasClass("btn-minus") && parseInt($hiddenInput.val()) === 1) {
                    return;
                }

                var currentQuantity = parseInt($quantityInput.val()) || 0;
                if ($(this).hasClass("btn-minus")) {
                    currentQuantity = Math.max(currentQuantity - 1, 0);
                } else if ($(this).hasClass("btn-plus")) {
                    currentQuantity++;
                }

                $quantityInput.val(currentQuantity);
                $hiddenInput.val(currentQuantity);
            });

            $(document).on("click", ".quantity_inc_dec_btn button.dec, .quantity_inc_dec_btn button.inc", function (e) {
                e.preventDefault();
                var container = $(this).closest(".quantity_inc_dec_btn");
                var quantityInput = container.find(".quantity_input");
                var currentQuantity = parseInt(quantityInput.val()) || 1;

                if ($(this).hasClass("dec")) {
                    currentQuantity = Math.max(currentQuantity - 1, 1);
                } else if ($(this).hasClass("inc")) {
                    currentQuantity++;
                }
                quantityInput.val(currentQuantity);
            });

            $(document).on("click", ".btn-minus2, .btn-plus2", function (e) {
                e.preventDefault();
                var $modal = $(this).closest('.modal');
                var addonIndex = $(this).data("addon-index2");
                var $quantityInput = $modal.find(".quantityUpdate2_" + addonIndex);
                var $hiddenInput = $modal.find("#qtyInput2_" + addonIndex);

                if ($(this).hasClass("btn-minus2") && parseInt($hiddenInput.val()) === 1) {
                    return;
                }

                var currentQuantity = parseInt($quantityInput.val()) || 0;
                if ($(this).hasClass("btn-minus2")) {
                    currentQuantity = Math.max(currentQuantity - 1, 0);
                } else if ($(this).hasClass("btn-plus2")) {
                    currentQuantity++;
                }

                $quantityInput.val(currentQuantity);
                $hiddenInput.val(currentQuantity);
            });

            $(document).on("click", ".quantity_inc_dec_btn button.dec2, .quantity_inc_dec_btn button.inc2", function (e) {
                e.preventDefault();
                var container = $(this).closest(".quantity_inc_dec_btn");
                var quantityInput = container.find(".quantity_input");
                var currentQuantity = parseInt(quantityInput.val()) || 1;

                if ($(this).hasClass("dec2")) {
                    currentQuantity = Math.max(currentQuantity - 1, 1);
                } else if ($(this).hasClass("inc2")) {
                    currentQuantity++;
                }
                quantityInput.val(currentQuantity);
            });
        });
    </script>

@endpush


