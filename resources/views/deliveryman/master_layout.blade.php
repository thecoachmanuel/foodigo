<!DOCTYPE html>
<html class="no-js" lang="zxx">
	<head>
		<!-- Meta Tags -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="keywords" content="Site keywords here">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="csrf-token" content="{{ csrf_token() }}">

		<!-- Site Title -->
		@yield('title')

		<!-- Fav Icon -->
		<link rel="icon" href="{{ asset($general_setting->favicon) }}">

		<!--  Stylesheet -->
		<link rel="stylesheet" href="{{ asset('backend/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('global/datatable/dataTables.bootstrap4.min.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/slick.min.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/font-awesome-all.min.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/nice-select.min.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/reset.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/style.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/overview.css') }}">
		<link rel="stylesheet" href="{{ asset('backend/css/dev.css') }}">
        <link rel="stylesheet" href="{{ asset('global/toastr/toastr.min.css') }}">
        <style>
            @keyframes foodigoRadarPulse {
                0% { transform: scale(0.97); opacity: 0.85; box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.7); }
                70% { transform: scale(1.03); opacity: 1; box-shadow: 0 0 0 8px rgba(239, 68, 68, 0); }
                100% { transform: scale(0.97); opacity: 0.85; box-shadow: 0 0 0 0 rgba(239, 68, 68, 0); }
            }
            .foodigo-incoming-backdrop {
                backdrop-filter: blur(4px);
            }
        </style>

        @stack('style_section')
	</head>
	<body id="crancy-dark-light">

		<div class="crancy-body-area ">
			<!-- crancy Admin Menu -->
			<div class="crancy-smenu" id="CrancyMenu">
				<!-- Admin Menu -->
				<div class="admin-menu">

					<!-- Logo -->
					<div class="logo crancy-sidebar-padding pd-right-0">
						<a class="crancy-logo" href="{{ route('deliveryman.dashboard') }}">
							<img src="{{ asset($general_setting->logo) }}" alt="">
						</a>
						<div id="crancy__sicon" class="crancy__sicon close-icon">
					<span>
					<svg width="6" height="12" viewBox="0 0 6 12" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M5 1L1 6.00489L5 11.0098" stroke="#fff" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
					</svg>

					</span>
						</div>
					</div>

					@include('deliveryman.sidebar')


				</div>
				<!-- End Admin Menu -->
			</div>
			<!-- End crancy Admin Menu -->

			<!-- Start Header -->
			<header class="crancy-header">
				<div class="container g-0">
					<div class="row g-0">
						<div class="col-12">
							<!-- Dashboard Header -->
							<div class="crancy-header__inner">
								<div class="crancy-header__middle">
									<div id="crancy__sicon" class="crancy__sicon close-icon d-none">
										<span>
										<svg width="6" height="12" viewBox="0 0 6 12" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M1 1L5 6.00489L1 11.0098" stroke="#fff" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
										</svg>

										</span>
									</div>

									<div class="crancy-header__heading">
                                        @yield('body-header')

									</div>


									<div class="crancy-header__right">
										<div class="crancy-header__group">
											<div class="crancy-header__group-two">
												<div class="crancy-header__right">



													<!-- Header Option Group -->
													<div class="crancy-header__options">

                                                        <!-- Header Notifications -->
														<div class="crancy-header__single">
															<a target="_blank" class="crancy-header__blink" href="{{ route('home') }}">
                                                                <svg width="23" height="24" viewBox="0 0 23 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																	<path d="M6.23906 13.088H10.8018V21.9011C8.18661 19.6481 6.5623 16.4866 6.23906 13.088ZM1.26377 13.088H5.0559C5.33373 16.2604 6.65222 19.2489 8.80075 21.5931C6.20017 20.9283 3.93124 19.2859 2.55053 16.9106C1.85862 15.7141 1.42959 14.4139 1.26377 13.088ZM8.80293 2.07124C6.36942 4.72595 4.9943 8.20355 4.99617 11.8401C4.99617 11.8644 4.99742 11.8887 4.99928 11.9145H1.18724C1.17262 10.134 1.6259 8.35102 2.5527 6.75501C3.93155 4.37999 6.20204 2.73577 8.80417 2.07124H8.80293ZM10.8018 1.76573V11.9145H6.17715C6.17715 11.8887 6.1759 11.8644 6.1759 11.8401C6.17217 7.97084 7.86337 4.29568 10.7999 1.76573H10.8018ZM11.392 0.506348C11.3743 0.506348 11.3581 0.507903 11.3416 0.509459C7.29279 0.526881 3.55604 2.68101 1.53008 6.16981C-0.503029 9.67355 -0.503029 13.9936 1.53008 17.4967C3.55728 20.9877 7.29902 23.1428 11.35 23.1574C11.3646 23.1593 11.3774 23.1593 11.392 23.1593C14.7224 23.1593 17.8889 21.7051 20.0508 19.1855C20.2836 18.9412 20.2624 18.5542 20.0054 18.3364C19.7491 18.1177 19.362 18.1585 19.1555 18.4251C17.7738 20.0335 15.9373 21.1539 13.9163 21.6669C14.8204 20.7031 15.5911 19.6198 16.2024 18.4447C16.5353 17.7587 15.5242 17.2398 15.1536 17.9065C14.3637 19.4263 13.2863 20.7793 11.9806 21.8949V13.088H13.2779C13.6049 13.088 13.8697 12.8242 13.8697 12.5009C13.8697 12.1767 13.6046 11.9129 13.2779 11.9145H11.9806V1.7287C13.5934 3.10444 14.8528 4.8423 15.6561 6.79888C15.7746 7.1075 16.124 7.25808 16.4314 7.13333C16.7369 7.00764 16.8797 6.65639 16.7481 6.3543C16.0901 4.75208 15.1505 3.2855 13.9786 2.01773C17.1177 2.83595 19.7407 5.10581 20.9325 8.21973C21.0352 8.54017 21.3877 8.70817 21.7031 8.5887C22.0205 8.46924 22.1698 8.11021 22.0332 7.80315C20.3517 3.41181 16.1156 0.506348 11.392 0.506348Z" fill="currentColor"/>
																	<path d="M16.6765 8.97825C16.7428 8.98168 16.7951 8.99785 16.8424 9.02399L21.5286 11.7577L19.7239 12.1314C19.3306 12.2138 19.134 12.6547 19.3356 13.0003L20.6292 15.2322C20.6892 15.3374 20.6603 15.4444 20.5564 15.5057L19.6946 15.9997C19.5888 16.0598 19.479 16.0315 19.4187 15.9263L18.1244 13.7C17.9244 13.3519 17.4422 13.3021 17.1734 13.6011L15.9526 14.9622L15.9187 9.55599C15.9168 9.41194 16.0291 9.23119 16.2475 9.10643C16.2525 9.10488 16.2537 9.10332 16.2572 9.0999C16.2634 9.0971 16.2699 9.09554 16.2749 9.09056C16.4118 9.00936 16.5661 8.97234 16.6765 8.97825ZM16.7416 7.80505C15.7771 7.80505 14.7601 8.5679 14.7386 9.56407L14.7725 14.9948C14.7763 15.5169 14.9237 15.9938 15.3615 16.2411C15.797 16.4866 16.3415 16.2909 16.6308 15.9714L17.51 14.9864L18.3979 16.5127C18.7747 17.1648 19.6296 17.3926 20.2835 17.0171L21.1463 16.5205C21.8002 16.1456 22.0292 15.2951 21.6518 14.6455L20.763 13.116L22.07 12.8475C22.494 12.7601 22.9345 12.3887 22.9376 11.889C22.9408 11.3909 22.601 11.0238 22.1477 10.7603L17.4384 8.01194V8.01474C17.2256 7.89185 16.9948 7.8063 16.7416 7.8063V7.80505Z" fill="currentColor"/>
																	</svg>

															</a>
															</a>

														</div>
														<!-- End Notifications -->


													</div>
													<!-- End Header Option Group-->

                                                    @php
                                                        $auth_admin = Auth::guard('deliveryman')->user();
                                                    @endphp

													<!-- Header Author -->
													<div class="crancy-header__single">
														<a href="{{ route('deliveryman.my-profile') }}"><div class="crancy-header__author-img"><img src="{{ asset($auth_admin->man_image) }}" alt="#"></div></a>
														<!-- crancy Profile Hover -->

														<!-- Dropdown List -->
														<div class="crancy-dropdown crancy-dropdown--acount">
															<div class="crancy-dropdown__hover--inner">
																<ul class="crancy-dmenu">
																	<li>
																		<a href="{{ route('deliveryman.deliveryman-edit', $auth_admin->id) }}">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																				<path d="M12.1202 12.78C12.0502 12.77 11.9602 12.77 11.8802 12.78C10.1202 12.72 8.72021 11.28 8.72021 9.50998C8.72021 7.69998 10.1802 6.22998 12.0002 6.22998C13.8102 6.22998 15.2802 7.69998 15.2802 9.50998C15.2702 11.28 13.8802 12.72 12.1202 12.78Z"  stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
																				<path d="M18.7398 19.3801C16.9598 21.0101 14.5998 22.0001 11.9998 22.0001C9.39977 22.0001 7.03977 21.0101 5.25977 19.3801C5.35977 18.4401 5.95977 17.5201 7.02977 16.8001C9.76977 14.9801 14.2498 14.9801 16.9698 16.8001C18.0398 17.5201 18.6398 18.4401 18.7398 19.3801Z"  stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
																				<path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z"  stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
																			</svg>
																			{{ __('translate.My Profile') }}
																		</a>
																	</li>

                                                                    <li>
																		<a href="{{ route('deliveryman.edit-password') }}">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																				<path d="M12.1202 12.78C12.0502 12.77 11.9602 12.77 11.8802 12.78C10.1202 12.72 8.72021 11.28 8.72021 9.50998C8.72021 7.69998 10.1802 6.22998 12.0002 6.22998C13.8102 6.22998 15.2802 7.69998 15.2802 9.50998C15.2702 11.28 13.8802 12.72 12.1202 12.78Z"  stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
																				<path d="M18.7398 19.3801C16.9598 21.0101 14.5998 22.0001 11.9998 22.0001C9.39977 22.0001 7.03977 21.0101 5.25977 19.3801C5.35977 18.4401 5.95977 17.5201 7.02977 16.8001C9.76977 14.9801 14.2498 14.9801 16.9698 16.8001C18.0398 17.5201 18.6398 18.4401 18.7398 19.3801Z"  stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
																				<path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z"  stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
																			</svg>
																			{{ __('translate.Change Password') }}
																		</a>
																	</li>




																	<li>
																		<a href="{{ route('deliveryman.logout') }}">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																				<path d="M15 10L13.7071 11.2929C13.3166 11.6834 13.3166 12.3166 13.7071 12.7071L15 14M14 12L22 12M6 20C3.79086 20 2 18.2091 2 16V8C2 5.79086 3.79086 4 6 4M6 20C8.20914 20 10 18.2091 10 16V8C10 5.79086 8.20914 4 6 4M6 20H14C16.2091 20 18 18.2091 18 16M6 4H14C16.2091 4 18 5.79086 18 8" stroke-width="1.5" stroke-linecap="round"/>
																			</svg>
																			{{ __('translate.Logout') }}
																		</a>


																	</li>
																</ul>

															</div>
														</div>
														<!-- End Dropdown List -->
													</div>
													<!-- End Header Author -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<!-- End Header -->

            @yield('body-content')

		</div>

		<!-- Real-time Incoming Delivery Pop-up Modal (Uber Eats / DoorDash Style) -->
		<div class="modal fade foodigo-incoming-backdrop" id="foodigoIncomingDeliveryModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="foodigoIncomingDeliveryLabel" aria-hidden="true" style="z-index: 1060;">
			<div class="modal-dialog modal-dialog-centered" style="max-width: 480px;">
				<div class="modal-content" style="border-radius: 20px; border: none; box-shadow: 0 25px 70px rgba(0,0,0,0.35); overflow: hidden; background: #ffffff;">
					<!-- Radar Alert Header Banner -->
					<div class="p-3 text-white d-flex align-items-center justify-content-between" style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);">
						<div class="d-flex align-items-center gap-2">
							<span class="badge" style="background: #ef4444; color: #fff; font-size: 11px; font-weight: 700; padding: 6px 12px; border-radius: 20px; animation: foodigoRadarPulse 1.4s infinite;">
								<i class="fas fa-satellite-dish me-1"></i> {{ __('translate.NEW ORDER READY') }}
							</span>
							<span id="incomingOrderElapsed" class="text-white-50 small"></span>
						</div>
						<div class="d-flex align-items-center gap-2">
							<button type="button" id="btnTogglePopupAudio" class="btn btn-sm btn-outline-light py-1 px-2" style="font-size: 12px; border-radius: 6px;" title="Mute/Unmute sound">
								<i class="fas fa-volume-up" id="iconPopupAudio"></i>
							</button>
							<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" id="btnDismissIncomingModalX"></button>
						</div>
					</div>

					<!-- Countdown Progress Bar -->
					<div class="progress" style="height: 5px; border-radius: 0; background: #e2e8f0;">
						<div id="incomingOrderCountdownBar" class="progress-bar bg-danger" style="width: 100%; transition: width 1s linear;"></div>
					</div>

					<div class="modal-body p-4">
						<!-- Financial & Order Header -->
						<div class="d-flex align-items-center justify-content-between mb-3 pb-3 border-bottom">
							<div>
								<div class="text-muted small fw-semibold text-uppercase tracking-wider" style="font-size: 11px;">{{ __('translate.Order Number') }}</div>
								<h3 class="fw-bold m-0 text-dark" id="incomingOrderIdDisplay" style="font-size: 22px;">#000</h3>
							</div>
							<div class="text-end">
								<div class="text-muted small fw-semibold text-uppercase" style="font-size: 11px;">{{ __('translate.Total Amount') }}</div>
								<div id="incomingOrderTotal" class="fw-bolder text-success fs-4">$0.00</div>
								<span id="incomingOrderPaymentBadge" class="badge bg-light text-dark border">COD</span>
							</div>
						</div>

						<!-- Two-Stop Journey Route Card -->
						<div class="rounded-3 p-3 mb-3" style="background: #f8fafc; border: 1px solid #e2e8f0;">
							<!-- Stop 1: Restaurant Pickup -->
							<div class="d-flex align-items-start gap-3 mb-2">
								<div class="rounded-circle d-flex align-items-center justify-content-center text-white flex-shrink-0" style="width: 36px; height: 36px; background: #0284c7; font-size: 14px;">
									<i class="fas fa-store"></i>
								</div>
								<div class="flex-grow-1">
									<div class="d-flex align-items-center justify-content-between">
										<strong class="text-dark" id="incomingOrderRestName" style="font-size: 15px;">Restaurant Name</strong>
										<span id="incomingOrderDistanceBadge" class="badge" style="background: #dbeafe; color: #1e40af; font-size: 11px;">🛵 0.0 km</span>
									</div>
									<div class="text-muted small text-truncate" id="incomingOrderRestAddress" style="max-width: 280px;">Pickup Address</div>
								</div>
							</div>

							<!-- Route Connector -->
							<div style="border-left: 2px dashed #94a3b8; height: 16px; margin-left: 17px; margin-top: -6px; margin-bottom: 2px;"></div>

							<!-- Stop 2: Customer Drop-off -->
							<div class="d-flex align-items-start gap-3">
								<div class="rounded-circle d-flex align-items-center justify-content-center text-white flex-shrink-0" style="width: 36px; height: 36px; background: #ea580c; font-size: 14px;">
									<i class="fas fa-map-marker-alt"></i>
								</div>
								<div class="flex-grow-1">
									<div class="text-muted small fw-semibold" style="font-size: 11px;">{{ __('translate.Customer Drop-off') }}</div>
									<div class="text-dark small fw-medium" id="incomingOrderDropAddress" style="line-height: 1.35;">Customer Address</div>
								</div>
							</div>
						</div>

						<!-- Expiration Warning Notice -->
						<div class="d-flex align-items-center justify-content-between text-muted small px-1 mb-3">
							<span><i class="fas fa-stopwatch me-1 text-danger"></i> {{ __('translate.Acceptance Window') }}:</span>
							<strong class="text-danger"><span id="incomingOrderSecondsRemaining">60</span>s {{ __('translate.left') }}</strong>
						</div>

						<!-- Action Buttons -->
						<div class="d-flex flex-column gap-2">
							<button type="button" id="btnClaimIncomingOrder" class="btn btn-success btn-lg w-100 fw-bold shadow-sm d-flex align-items-center justify-content-center gap-2 py-3" style="border-radius: 12px; font-size: 16px;">
								<i class="fas fa-check-circle fs-5"></i>
								<span id="btnClaimIncomingOrderText">{{ __('translate.ACCEPT & CLAIM DELIVERY') }}</span>
							</button>

							<div class="d-flex gap-2">
								<button type="button" id="btnDeclineIncomingOrder" class="btn btn-outline-danger w-50 py-2 fw-semibold" style="border-radius: 8px; font-size: 13px;">
									<i class="fas fa-times me-1"></i> {{ __('translate.Decline') }}
								</button>
								<a href="#" id="linkViewIncomingOrder" class="btn btn-outline-secondary w-50 py-2 fw-semibold" style="border-radius: 8px; font-size: 13px;" target="_blank">
									<i class="fas fa-map-marked-alt me-1"></i> {{ __('translate.Preview') }}
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--  Scripts -->
		<script src="{{ asset('global/js/jquery-3.7.1.min.js') }}"></script>
        <script src="{{ asset('global/datatable/jquery.dataTables.min.js') }}"></script>
		<script src="{{ asset('global/datatable/dataTables.bootstrap4.min.js') }}"></script>
		<script src="{{ asset('backend/js/jquery-migrate.js') }}"></script>
		<script src="{{ asset('backend/js/popper.min.js') }}"></script>
		<script src="{{ asset('backend/js/bootstrap.min.js') }}"></script>

		<script src="{{ asset('backend/js/nice-select.min.js') }}"></script>

		<script src="{{ asset('backend/js/main.js') }}"></script>
        <script src="{{ asset('global/toastr/toastr.min.js') }}"></script>
        <script src="{{ asset('global/toastr/swipe-toast.js') }}"></script>


        <script>
            (function($) {
                "use strict"
                $(document).ready(function () {

                    const session_notify_message = @json(Session::get('message'));
                    const demo_mode_message = @json(Session::get('demo_mode'));

                    if(session_notify_message != null){
                        const session_notify_type = @json(Session::get('alert-type', 'info'));
                        switch (session_notify_type) {
                            case 'info':
                                toastr.info(session_notify_message);
                                break;
                            case 'success':
                                toastr.success(session_notify_message);
                                break;
                            case 'warning':
                                toastr.warning(session_notify_message);
                                break;
                            case 'error':
                                toastr.error(session_notify_message);
                                break;
                        }
                    }

                    if(demo_mode_message != null){
                        toastr.warning("{{ __('translate.All Language keywords are not implemented in the demo mode') }}");
                        toastr.info("{{ __('translate.Admin can translate every word from the admin panel') }}");
                    }

                    const validation_errors = @json($errors->all());

                    if (validation_errors.length > 0) {
                        validation_errors.forEach(error => toastr.error(error));
                    }

                    $('#dataTable').DataTable({
                        "order": []
                    });

                    // Live Geolocation Ping for Delivery Partner
                    if ("geolocation" in navigator) {
                        function syncRiderLocation() {
                            navigator.geolocation.getCurrentPosition(function(pos) {
                                const lat = pos.coords.latitude;
                                const lng = pos.coords.longitude;
                                window.riderCurrentLat = lat;
                                window.riderCurrentLng = lng;

                                $.ajax({
                                    url: "{{ route('deliveryman.update.lat-long') }}",
                                    type: "POST",
                                    headers: {
                                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                    },
                                    data: {
                                        latitude: lat,
                                        longitude: lng
                                    },
                                    success: function() {
                                        // Location synchronized
                                    }
                                });
                            }, function() {}, { enableHighAccuracy: true, timeout: 8000, maximumAge: 10000 });
                        }

                        syncRiderLocation();
                        setInterval(syncRiderLocation, 35000); // sync every 35s
                    }

                    // Web Audio API Chime Synthesizer
                    window.foodigoAudioMuted = false;
                    let chimeInterval = null;

                    function playIncomingOrderChime() {
                        if (window.foodigoAudioMuted) return;
                        try {
                            const AudioCtx = window.AudioContext || window.webkitAudioContext;
                            if (!AudioCtx) return;
                            const ctx = new AudioCtx();
                            if (ctx.state === 'suspended') {
                                ctx.resume();
                            }
                            const now = ctx.currentTime;

                            // Tone 1: High alert ping (880 Hz - A5)
                            const osc1 = ctx.createOscillator();
                            const gain1 = ctx.createGain();
                            osc1.type = 'sine';
                            osc1.frequency.setValueAtTime(880, now);
                            gain1.gain.setValueAtTime(0.3, now);
                            gain1.gain.exponentialRampToValueAtTime(0.001, now + 0.3);
                            osc1.connect(gain1);
                            gain1.connect(ctx.destination);
                            osc1.start(now);
                            osc1.stop(now + 0.3);

                            // Tone 2: Harmonious ascending bell (1174.66 Hz - D6)
                            const osc2 = ctx.createOscillator();
                            const gain2 = ctx.createGain();
                            osc2.type = 'sine';
                            osc2.frequency.setValueAtTime(1174.66, now + 0.15);
                            gain2.gain.setValueAtTime(0.35, now + 0.15);
                            gain2.gain.exponentialRampToValueAtTime(0.001, now + 0.6);
                            osc2.connect(gain2);
                            gain2.connect(ctx.destination);
                            osc2.start(now + 0.15);
                            osc2.stop(now + 0.6);

                            // Tone 3: Rich closing bell (1318.51 Hz - E6)
                            const osc3 = ctx.createOscillator();
                            const gain3 = ctx.createGain();
                            osc3.type = 'sine';
                            osc3.frequency.setValueAtTime(1318.51, now + 0.32);
                            gain3.gain.setValueAtTime(0.3, now + 0.32);
                            gain3.gain.exponentialRampToValueAtTime(0.001, now + 0.9);
                            osc3.connect(gain3);
                            gain3.connect(ctx.destination);
                            osc3.start(now + 0.32);
                            osc3.stop(now + 0.9);
                        } catch (e) {
                            console.warn('Web Audio chime notice:', e);
                        }
                    }

                    function startChimeLoop() {
                        stopChimeLoop();
                        playIncomingOrderChime();
                        chimeInterval = setInterval(playIncomingOrderChime, 3500);
                    }

                    function stopChimeLoop() {
                        if (chimeInterval) {
                            clearInterval(chimeInterval);
                            chimeInterval = null;
                        }
                    }

                    $('#btnTogglePopupAudio').on('click', function() {
                        window.foodigoAudioMuted = !window.foodigoAudioMuted;
                        if (window.foodigoAudioMuted) {
                            $('#iconPopupAudio').removeClass('fa-volume-up').addClass('fa-volume-mute');
                            $(this).removeClass('btn-outline-light').addClass('btn-danger');
                            stopChimeLoop();
                        } else {
                            $('#iconPopupAudio').removeClass('fa-volume-mute').addClass('fa-volume-up');
                            $(this).removeClass('btn-danger').addClass('btn-outline-light');
                            playIncomingOrderChime();
                        }
                    });

                    // Real-time Incoming Popup Management
                    let activePopupOrderId = null;
                    let countdownTimer = null;
                    let secondsLeft = 60;
                    const dismissedOrdersKey = 'foodigo_dismissed_orders';

                    function getDismissedOrders() {
                        try {
                            const raw = sessionStorage.getItem(dismissedOrdersKey);
                            return raw ? JSON.parse(raw) : [];
                        } catch (e) {
                            return [];
                        }
                    }

                    function addDismissedOrder(orderId) {
                        const list = getDismissedOrders();
                        if (!list.includes(orderId)) {
                            list.push(orderId);
                            try {
                                sessionStorage.setItem(dismissedOrdersKey, JSON.stringify(list));
                            } catch (e) {}
                        }
                    }

                    function showIncomingOrderModal(order) {
                        if (activePopupOrderId === order.id) return;
                        activePopupOrderId = order.id;

                        $('#incomingOrderIdDisplay').text(order.order_id_display || ('#' + order.id));
                        $('#incomingOrderTotal').text(order.formatted_total || ('$' + order.grand_total));
                        $('#incomingOrderPaymentBadge').text(order.payment_method || 'COD')
                            .attr('class', order.is_cod ? 'badge bg-warning text-dark border' : 'badge bg-success text-white border');
                        $('#incomingOrderRestName').text(order.restaurant_name || 'Restaurant');
                        $('#incomingOrderRestAddress').text(order.restaurant_address || 'Pickup Location');
                        $('#incomingOrderDropAddress').text(order.dropoff_address || 'Customer Location');
                        $('#incomingOrderElapsed').text(order.created_at || 'Just now');

                        if (order.distance_display) {
                            $('#incomingOrderDistanceBadge').text('🛵 ' + order.distance_display).show();
                        } else {
                            $('#incomingOrderDistanceBadge').hide();
                        }

                        $('#linkViewIncomingOrder').attr('href', order.show_url || '#');

                        // Reset countdown
                        secondsLeft = 60;
                        $('#incomingOrderSecondsRemaining').text(secondsLeft);
                        $('#incomingOrderCountdownBar').css('width', '100%');

                        if (countdownTimer) clearInterval(countdownTimer);
                        countdownTimer = setInterval(function() {
                            secondsLeft--;
                            $('#incomingOrderSecondsRemaining').text(secondsLeft);
                            const pct = Math.max(0, (secondsLeft / 60) * 100);
                            $('#incomingOrderCountdownBar').css('width', pct + '%');

                            if (secondsLeft <= 0) {
                                clearInterval(countdownTimer);
                                closeIncomingOrderModal();
                                addDismissedOrder(order.id);
                            }
                        }, 1000);

                        // Show modal & start sound chime
                        const modalEl = document.getElementById('foodigoIncomingDeliveryModal');
                        if (modalEl && typeof bootstrap !== 'undefined' && bootstrap.Modal) {
                            const bsModal = bootstrap.Modal.getOrCreateInstance(modalEl);
                            bsModal.show();
                            startChimeLoop();
                        }
                    }

                    function closeIncomingOrderModal() {
                        stopChimeLoop();
                        if (countdownTimer) {
                            clearInterval(countdownTimer);
                            countdownTimer = null;
                        }
                        const modalEl = document.getElementById('foodigoIncomingDeliveryModal');
                        if (modalEl && typeof bootstrap !== 'undefined' && bootstrap.Modal) {
                            const bsModal = bootstrap.Modal.getInstance(modalEl);
                            if (bsModal) bsModal.hide();
                        }
                        activePopupOrderId = null;
                    }

                    $('#btnDismissIncomingModalX').on('click', function() {
                        if (activePopupOrderId) addDismissedOrder(activePopupOrderId);
                        closeIncomingOrderModal();
                    });

                    // Claim button inside popup
                    $('#btnClaimIncomingOrder').on('click', function() {
                        if (!activePopupOrderId) return;
                        const $btn = $(this);
                        const orderId = activePopupOrderId;

                        $btn.prop('disabled', true);
                        $('#btnClaimIncomingOrderText').text('Claiming...');
                        stopChimeLoop();

                        $.ajax({
                            url: "{{ url('deliveryman/order-request-status') }}/" + orderId,
                            type: 'POST',
                            data: {
                                _token: $('meta[name="csrf-token"]').attr('content'),
                                order_request_status: 1
                            },
                            dataType: 'json',
                            success: function(res) {
                                if (res && res.status === 'success') {
                                    closeIncomingOrderModal();
                                    toastr.success(res.message || 'Order Claimed!');
                                    setTimeout(function() {
                                        window.location.href = res.redirect_url || "{{ route('deliveryman.orders') }}";
                                    }, 600);
                                } else {
                                    $btn.prop('disabled', false);
                                    $('#btnClaimIncomingOrderText').text("{{ __('translate.ACCEPT & CLAIM DELIVERY') }}");
                                    toastr.error((res && res.message) ? res.message : 'Could not claim order.');
                                }
                            },
                            error: function(xhr) {
                                closeIncomingOrderModal();
                                addDismissedOrder(orderId);
                                const msg = (xhr.responseJSON && xhr.responseJSON.message) ? xhr.responseJSON.message : 'Order already claimed by another partner.';
                                toastr.warning(msg);
                            }
                        });
                    });

                    // Decline button inside popup
                    $('#btnDeclineIncomingOrder').on('click', function() {
                        if (!activePopupOrderId) return;
                        const orderId = activePopupOrderId;
                        addDismissedOrder(orderId);
                        closeIncomingOrderModal();

                        $.ajax({
                            url: "{{ url('deliveryman/order-request-status') }}/" + orderId,
                            type: 'POST',
                            data: {
                                _token: $('meta[name="csrf-token"]').attr('content'),
                                order_request_status: 2
                            },
                            dataType: 'json',
                            success: function() {
                                toastr.info('Order request declined.');
                            }
                        });
                    });

                    // Background Live Order Requests Poller
                    let lastKnownOrderCount = null;
                    function checkLiveOrderRequests() {
                        const params = {};
                        if (window.riderCurrentLat && window.riderCurrentLng) {
                            params.latitude = window.riderCurrentLat;
                            params.longitude = window.riderCurrentLng;
                        }

                        $.get("{{ route('deliveryman.order-request-poll') }}", params, function(res) {
                            if (res && typeof res.count !== 'undefined') {
                                const badge = $('.live-request-badge');
                                if (res.count > 0) {
                                    badge.text(res.count).show();
                                } else {
                                    badge.hide();
                                }

                                if (res.count > 0 && res.orders && res.orders.length > 0) {
                                    const dismissed = getDismissedOrders();
                                    // Find newest order not dismissed by rider
                                    const freshOrder = res.orders.find(o => !dismissed.includes(o.id));
                                    if (freshOrder && (!activePopupOrderId || activePopupOrderId !== freshOrder.id)) {
                                        showIncomingOrderModal(freshOrder);
                                    }
                                }

                                if (lastKnownOrderCount !== null && res.count > lastKnownOrderCount) {
                                    $(document).trigger('newOrderRequestArrived', [res]);
                                }
                                lastKnownOrderCount = res.count;
                            }
                        });
                    }

                    checkLiveOrderRequests();
                    setInterval(checkLiveOrderRequests, 8000); // poll every 8s
                });
            })(jQuery);

        </script>


        @stack('js_section')

	</body>
</html>

