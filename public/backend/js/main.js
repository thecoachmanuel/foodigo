"use strict";

/* Full Screen */
const fullscreenButton = document.getElementById('crancy-header__full');
const htmlElement = document.documentElement;

if (fullscreenButton) {
    fullscreenButton.addEventListener('click', () => {
        if (document.fullscreenElement) {
            document.exitFullscreen();
        } else {
            htmlElement.requestFullscreen();
        }
    });
}

/* Universal Password Field Toggle */
document.addEventListener('DOMContentLoaded', function() {
    document.addEventListener('click', function(e) {
        const toggleBtn = e.target.closest('.toggle-password, .crancy-wc__toggle, .password_view, .password-toggle-btn, [id="toggle-icon"], [id="confirm-toggle-icon"]');
        if (!toggleBtn) return;

        // Try finding closest form input container
        const container = toggleBtn.closest('.position-relative, .form-group__input, .crancy__item-form--group, .edit_profile_form_inner, .change_password_form_inner, .form-group, div');
        let input = null;
        if (container) {
            input = container.querySelector('input[type="password"], input[type="text"][data-is-password="true"]');
        }

        // Fallbacks for ID-based toggles
        if (!input) {
            if (toggleBtn.id === 'toggle-icon' || toggleBtn.querySelector('#toggle-icon')) {
                input = document.getElementById('password-field');
            } else if (toggleBtn.id === 'confirm-toggle-icon' || toggleBtn.querySelector('#confirm-toggle-icon')) {
                input = document.getElementById('confirm-password-field');
            }
        }

        if (input) {
            const icon = toggleBtn.tagName === 'I' ? toggleBtn : toggleBtn.querySelector('i');
            if (input.type === 'password') {
                input.type = 'text';
                input.setAttribute('data-is-password', 'true');
                if (icon) {
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            } else {
                input.type = 'password';
                input.removeAttribute('data-is-password');
                if (icon) {
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                }
            }
        }
    });
});



// /* Crancy Options */
const cs_button = document.querySelectorAll("#crancy__sicon");
const cs_action = document.querySelectorAll(".crancy-smenu, .crancy-header, .crancy-adashboard");

cs_button.forEach(button => {
   button.addEventListener("click", function() {
        cs_action.forEach((el) => {
           el.classList.toggle("crancy-close");
        });
        localStorage.setItem("iscicon", cs_action[0].classList.contains("crancy-close"));
    });
 });

if (localStorage.getItem("iscicon") === "true") {
   cs_action.forEach((el) => {
       el.classList.add("crancy-close");
   });
}

jQuery(document).ready(function($) {

		$('#crancy-header__nav,.crancy-sidebarmenu__close').on( "click", function(){
			$('.crancy-sidebarmenu').toggleClass('active');
		});

        $('.crancy-filters-button').on( "click", function(){
			$('.crancy-table-filter-tables').toggleClass('active');
		});


});


// Get all elements with the class "crancy-toggle"
const toggleElements = document.querySelectorAll('.crancy-toggle');

// Add click event listeners to each ".crancy-toggle" element
toggleElements.forEach((toggleElement) => {
  toggleElement.addEventListener('click', (event) => {
    // Find the corresponding ".crancy-toggle__dropdown" element
    const dropdownElement = toggleElement.querySelector('.crancy-toggle__dropdown');

    // Toggle the "active" class on the clicked dropdownElement
    dropdownElement.classList.toggle('active');

    // Close other open dropdowns
    toggleElements.forEach((otherToggleElement) => {
      if (otherToggleElement !== toggleElement) {
        const otherDropdownElement = otherToggleElement.querySelector('.crancy-toggle__dropdown');
        otherDropdownElement.classList.remove('active');
      }
    });
  });
});



document.addEventListener("DOMContentLoaded", function() {
    const crancyDropdowns = document.querySelectorAll(".crancy__dropdown");

    crancyDropdowns.forEach((crancyDropdown, index) => {
        const observer = new MutationObserver(function(mutationsList) {
            const crancyDropdownHasShowClass = crancyDropdown.classList.contains("show");

            document.querySelectorAll(".admin-menu").forEach((adminMenuOne) => {
                adminMenuOne.classList.toggle("no-overflow", crancyDropdownHasShowClass);
            });
        });

        observer.observe(crancyDropdown, { attributes: true });
    });
});


