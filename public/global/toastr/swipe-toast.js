/**
 * Foodigo Swipeable & Dismissable Toast Notifications
 * Enables touch swipe gestures (mobile) and click/drag dismissal (desktop) on all Toastr alerts.
 */
(function ($) {
    "use strict";

    if (typeof toastr !== "undefined") {
        toastr.options = {
            closeButton: true,
            debug: false,
            newestOnTop: true,
            progressBar: true,
            positionClass: "toast-top-right",
            preventDuplicates: false,
            onclick: null,
            showDuration: "300",
            hideDuration: "300",
            timeOut: "4500",
            extendedTimeOut: "1500",
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "fadeIn",
            hideMethod: "fadeOut",
            tapToDismiss: true
        };
    }

    // Inject styles for swipe-friendly toasts
    var style = document.createElement("style");
    style.innerHTML = `
        #toast-container {
            z-index: 9999999 !important;
            pointer-events: none;
        }
        #toast-container > .toast {
            pointer-events: auto !important;
            cursor: grab !important;
            user-select: none !important;
            -webkit-user-select: none !important;
            touch-action: pan-y !important;
            transition: transform 0.18s cubic-bezier(0.2, 0.9, 0.3, 1), opacity 0.18s ease !important;
            border-radius: 10px !important;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.15), 0 8px 10px -6px rgba(0, 0, 0, 0.1) !important;
            opacity: 0.98 !important;
            font-family: inherit !important;
        }
        #toast-container > .toast:active {
            cursor: grabbing !important;
        }
        #toast-container > .toast.toast-swiping {
            transition: none !important;
        }
        #toast-container > .toast .toast-close-button {
            top: -4px !important;
            right: 2px !important;
            font-size: 20px !important;
            font-weight: 700 !important;
            opacity: 0.75 !important;
            transition: opacity 0.15s ease !important;
        }
        #toast-container > .toast .toast-close-button:hover {
            opacity: 1 !important;
        }
        @media (max-width: 576px) {
            #toast-container {
                width: 92% !important;
                left: 4% !important;
                right: 4% !important;
                top: 15px !important;
            }
            #toast-container > .toast {
                width: 100% !important;
                margin-bottom: 8px !important;
            }
        }
    `;
    document.head.appendChild(style);

    // Global delegation for swipe-to-dismiss
    $(document).on("touchstart mousedown", "#toast-container .toast", function (e) {
        var $toast = $(this);
        if ($(e.target).hasClass("toast-close-button")) {
            return;
        }

        var isTouch = e.type === "touchstart";
        var pointerEvent = isTouch ? e.originalEvent.touches[0] : e;
        var startX = pointerEvent.clientX;
        var startY = pointerEvent.clientY;
        var startTime = Date.now();
        var deltaX = 0;
        var deltaY = 0;
        var isSwiping = false;

        $toast.addClass("toast-swiping");

        function onMove(moveEvent) {
            var movePointer = isTouch ? moveEvent.touches[0] : moveEvent;
            if (!movePointer) return;

            deltaX = movePointer.clientX - startX;
            deltaY = movePointer.clientY - startY;

            // Only consider horizontal swipes if horizontal motion dominates
            if (Math.abs(deltaX) > Math.abs(deltaY) && Math.abs(deltaX) > 8) {
                isSwiping = true;
                if (moveEvent.cancelable && isTouch) {
                    moveEvent.preventDefault();
                }
                var damp = 1 - Math.min(Math.abs(deltaX) / 300, 0.65);
                $toast.css({
                    transform: "translateX(" + deltaX + "px)",
                    opacity: damp
                });
            }
        }

        function onEnd() {
            $toast.removeClass("toast-swiping");
            $(document).off(isTouch ? "touchmove" : "mousemove", onMove);
            $(document).off(isTouch ? "touchend touchcancel" : "mouseup", onEnd);

            var elapsed = Date.now() - startTime;
            var isQuickFlick = elapsed < 250 && Math.abs(deltaX) > 30;
            var isLongSwipe = Math.abs(deltaX) > 50;

            if (isSwiping && (isQuickFlick || isLongSwipe)) {
                // Animate completely out of the viewport
                var flyOutX = deltaX > 0 ? $(window).width() : -$(window).width();
                $toast.css({
                    transform: "translateX(" + flyOutX + "px)",
                    opacity: 0,
                    transition: "transform 0.22s ease-out, opacity 0.22s ease-out"
                });

                setTimeout(function () {
                    $toast.remove();
                    if ($("#toast-container .toast").length === 0) {
                        $("#toast-container").remove();
                    }
                }, 220);
            } else {
                // Spring back
                $toast.css({
                    transform: "translateX(0px)",
                    opacity: 0.98,
                    transition: "transform 0.18s cubic-bezier(0.2, 0.9, 0.3, 1), opacity 0.18s ease"
                });
            }
        }

        $(document).on(isTouch ? "touchmove" : "mousemove", onMove);
        $(document).on(isTouch ? "touchend touchcancel" : "mouseup", onEnd);
    });

})(jQuery);
