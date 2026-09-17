<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $privacyHtml = <<<'HTML'
<p><strong>Effective Date:</strong> September 17, 2026</p>
<p>Welcome to <strong>Nectar</strong> ("we", "our", or "us"). Nectar is an on-demand multi-restaurant online food ordering and delivery marketplace platform accessible via our web interface, mobile progressive web application (PWA), and related digital services. We are dedicated to protecting the personal privacy and data security of all customers, restaurant partners, and delivery personnel who interact with our platform.</p>
<p>This Privacy Policy details how Nectar collects, uses, shares, processes, and protects your personal data when you visit our website, register for an account, browse restaurant menus, place food delivery or pickup orders, or communicate with our support team. By accessing or using Nectar, you acknowledge and consent to the data practices outlined in this policy.</p>

<h4>1. Information We Collect</h4>
<p>To provide you with seamless food discovery, fast order fulfillment, and live delivery updates, Nectar collects several categories of information:</p>
<ul>
    <li><strong>Account and Contact Information:</strong> When you register an account or place an order, we collect your full name, email address, mobile phone number, delivery addresses (including street name, apartment or suite number, entry codes, and specific drop-off notes), and password credentials.</li>
    <li><strong>Order and Culinary Preferences:</strong> Details of meals, side dishes, dietary selections, restaurant choices, order dates and times, total transaction amounts, invoices, and any special preparation instructions you provide to restaurant kitchens.</li>
    <li><strong>Payment and Financial Data:</strong> When you pay online using a credit card, debit card, or digital wallet, your payment details are processed directly by our certified PCI-DSS compliant third-party payment gateways. <em>Nectar does not store full credit card numbers or security CVV codes on our servers.</em> If you choose Cash on Delivery (COD), order totals and currency amounts are recorded to verify transaction settlement.</li>
    <li><strong>Geolocation and Map Data:</strong> With your permission, we collect precise or approximate geolocation data from your mobile device or web browser (via GPS, Wi-Fi networks, and IP address). This information is necessary to show available restaurants within your delivery radius, calculate accurate delivery fees and estimated arrival times (ETA), and provide live courier tracking on interactive maps.</li>
    <li><strong>Device and Technical Usage Data:</strong> We automatically collect information about how you interact with Nectar, including your IP address, browser type, operating system version, device hardware model, screen resolution, referral URLs, browsing history on our site, and system error logs.</li>
    <li><strong>Customer Support and Communications:</strong> Records of messages sent through our in-app chat, support tickets, emails, and any ratings or reviews you submit regarding restaurants or food items.</li>
</ul>

<h4>2. How We Use Your Information</h4>
<p>Nectar uses the information collected for legitimate operational, commercial, and legal purposes, including:</p>
<ul>
    <li><strong>Facilitating and Delivering Your Food Orders:</strong> Transmitting your order selections and special cooking instructions to the chosen restaurant kitchen, and dispatching nearby couriers to pick up and deliver your meals.</li>
    <li><strong>Real-Time Navigation and Live Tracking:</strong> Calculating optimal delivery routes and rendering live order progression on the delivery map from pickup to drop-off.</li>
    <li><strong>Payment Processing and Fraud Prevention:</strong> Authenticating payment authorizations, processing refunds, verifying One-Time Passwords (OTPs), detecting unauthorized transactions, and mitigating platform abuse.</li>
    <li><strong>Customer Service and Dispute Resolution:</strong> Addressing order delays, missing items, damaged packaging, or cancellation and refund requests promptly.</li>
    <li><strong>Personalization and Platform Enhancements:</strong> Recommending top-rated nearby restaurants, highlighting trending cuisines, and optimizing our user interface for mobile and desktop screens.</li>
    <li><strong>Transactional and Promotional Notifications:</strong> Sending essential order status updates, kitchen acceptance alerts, out-for-delivery notifications, receipts, and (where opted in) exclusive deals, discounts, and culinary promotions.</li>
</ul>

<h4>3. How We Share Your Information</h4>
<p>We respect your privacy and <strong>do not sell, rent, or trade your personal information to third parties</strong>. We share your information solely as necessary to operate our food marketplace:</p>
<ul>
    <li><strong>With Restaurant Partners:</strong> When you place an order, the fulfilling restaurant receives your first name, ordered menu items, food customization requests, delivery address (or pickup code), and any special prep notes needed to prepare your meal safely.</li>
    <li><strong>With Delivery Couriers:</strong> Assigned couriers receive your delivery address, drop-off instructions, and phone contact information (or masked call relay) to ensure timely and accurate doorstep delivery.</li>
    <li><strong>With Trusted Service Providers:</strong> We engage reputable third-party vendors to assist with cloud hosting, database management, SMS and email dispatch, digital mapping and geocoding services (such as OpenStreetMap and Leaflet), and secure payment processing. These providers only access the minimum data required to perform their functions under strict confidentiality terms.</li>
    <li><strong>For Legal and Safety Compliance:</strong> We may disclose information if required by applicable law, governmental regulation, court order, or to protect the safety, rights, and security of Nectar users, delivery couriers, restaurant personnel, or the public.</li>
</ul>

<h4>4. Geolocation Services and Map Tracking</h4>
<p>Accurate location data is fundamental to an on-demand food delivery service. We use location services to identify restaurants delivering to your exact location, determine realistic travel times, and render live courier movement on the delivery map.</p>
<p>You can grant or revoke location permissions at any time through your web browser or device operating system settings. If you choose not to share real-time GPS location, you may still place orders on Nectar by manually searching and selecting your street address on the map.</p>

<h4>5. Cookies, PWA, and Offline Storage</h4>
<p>Nectar uses browser cookies, local web storage, and service worker caching to deliver an intuitive and responsive user experience:</p>
<ul>
    <li><strong>Essential Cookies:</strong> Required to keep you authenticated, remember the contents of your shopping cart, and preserve your session across browsing sessions.</li>
    <li><strong>Service Worker and PWA Caching:</strong> Stores necessary application assets (stylesheets, fonts, and UI components) locally to enable instantaneous page loads, smooth transitions, and reliable performance even on intermittent mobile connections.</li>
    <li><strong>Analytics and Preferences:</strong> Helps us understand how users navigate our catalog, optimize search algorithms, and save your preferred language and location settings.</li>
</ul>
<p>You may adjust cookie preferences through your web browser; however, disabling essential cookies may impact your ability to add items to your cart or finalize order checkout.</p>

<h4>6. Data Security and Safeguards</h4>
<p>We implement comprehensive administrative, technical, and physical security measures to protect your personal data from unauthorized access, loss, misuse, or alteration. All web and API traffic between your device and Nectar is encrypted using Transport Layer Security (TLS/HTTPS). Critical payment details are processed through encrypted, certified third-party payment gateways.</p>
<p>While we maintain rigorous security protocols, no internet transmission or electronic storage medium is completely impenetrable. You are responsible for safeguarding your login password and OTP codes, and you should never share your account credentials with anyone.</p>

<h4>7. Data Retention</h4>
<p>Nectar retains your personal information for as long as your account remains active or as necessary to fulfill the purposes described in this Privacy Policy. We also retain order receipts, invoices, and transaction logs to comply with statutory legal, tax, accounting, and anti-fraud regulations. When data is no longer needed, it is securely deleted or irreversibly anonymized.</p>

<h4>8. Your Rights and Choices</h4>
<p>Depending on your jurisdiction, you have specific rights regarding your personal information, including:</p>
<ul>
    <li><strong>Access and Update:</strong> You can view, review, and modify your personal profile information, saved addresses, and contact numbers at any time from your Nectar Account Dashboard.</li>
    <li><strong>Account Deletion:</strong> You may request the permanent deletion of your account and associated personal data by contacting our support team.</li>
    <li><strong>Marketing Communications:</strong> You may opt out of receiving marketing emails or SMS promotions at any time by clicking the "Unsubscribe" link in our communications or adjusting your profile notification preferences.</li>
    <li><strong>Data Portability:</strong> You may request a copy of the personal data you have provided to Nectar in a structured, machine-readable format.</li>
</ul>

<h4>9. Children's Privacy</h4>
<p>Nectar is intended for use by individuals who are at least 16 years of age (or the legal age of majority in your jurisdiction). We do not knowingly collect personal data from children under 16 without verifiable parental consent. If we become aware that a child under 16 has submitted personal information to Nectar, we will take immediate steps to remove the data and deactivate the account.</p>

<h4>10. Updates to This Privacy Policy</h4>
<p>We may periodically update this Privacy Policy to reflect enhancements to our marketplace features, operational adjustments, or evolving legal requirements. Any revisions will be published on this page with an updated "Effective Date". We encourage you to review this page periodically to stay informed about our data practices.</p>

<h4>11. Contact Nectar</h4>
<p>If you have questions, feedback, or data privacy requests regarding this policy, please reach out to our team via our platform <a href="/contact-us">Contact Us</a> page or email us directly at <strong>support@nectar.app</strong>.</p>
HTML;

        $termsHtml = <<<'HTML'
<p><strong>Effective Date:</strong> September 17, 2026</p>
<p>Welcome to <strong>Nectar</strong>. These Terms of Service ("Terms") constitute a legally binding agreement between you ("Customer", "User", or "you") and Nectar ("Nectar", "we", "us", or "our"). These Terms govern your access to and use of the Nectar website, mobile progressive web application (PWA), APIs, and all associated food ordering and delivery marketplace services.</p>
<p>By registering an account, browsing menus, or placing an order through Nectar, you acknowledge that you have read, understood, and agreed to be bound by these Terms and our <a href="/privacy-policy">Privacy Policy</a>. If you do not agree with these Terms, you must discontinue using Nectar immediately.</p>

<h4>1. The Nectar Marketplace Platform</h4>
<p>Nectar provides an online marketplace software platform that facilitates connections between hungry customers, independent restaurant kitchen partners ("Restaurants"), and delivery couriers ("Couriers"):</p>
<ul>
    <li><strong>Independent Restaurant Partners:</strong> Restaurants featured on Nectar operate as independent commercial food service businesses. Each Restaurant is exclusively responsible for its culinary preparation, ingredient sourcing, hygienic packaging, compliance with food safety and sanitary regulations, menu descriptions, and the accuracy of allergen disclosures.</li>
    <li><strong>Delivery Couriers:</strong> Delivery Couriers operate as independent contractors or assigned logistics partners responsible for picking up prepared meals from Restaurants and safely transporting them to customer delivery locations.</li>
    <li><strong>Nectar’s Role:</strong> Nectar acts as a technology intermediary and communications facilitator. Unless explicitly stated otherwise, Nectar does not prepare food, operate commercial kitchens, or sell culinary goods directly.</li>
</ul>

<h4>2. User Accounts and Eligibility</h4>
<p>To access certain features of Nectar, including placing orders and tracking deliveries, you must create a user account:</p>
<ul>
    <li><strong>Eligibility:</strong> You must be at least 18 years old (or the legal age of majority in your jurisdiction) and legally capable of entering into binding contracts.</li>
    <li><strong>Account Accuracy:</strong> You agree to provide true, accurate, current, and complete personal and contact details during registration, and to keep your delivery addresses and phone numbers updated.</li>
    <li><strong>Account Security:</strong> You are solely responsible for maintaining the confidentiality of your account credentials, login passwords, and One-Time Passwords (OTPs). You agree to accept full responsibility for all activities, orders, and financial charges incurred under your account. Notify Nectar immediately if you suspect unauthorized access.</li>
</ul>

<h4>3. Ordering, Pricing, and Menu Availability</h4>
<p>Placing an order through Nectar represents a binding offer to purchase the selected items from the chosen Restaurant partner:</p>
<ul>
    <li><strong>Order Acceptance:</strong> An order is officially accepted once the Restaurant kitchen confirms the order. The Restaurant reserves the right to decline any order due to high kitchen volume, ingredient unavailability, or operational limitations.</li>
    <li><strong>Prices and Transparent Fees:</strong> Menu item prices are determined by each Restaurant. At checkout, Nectar displays a clear itemized breakdown of your total cost, including menu item prices, applicable municipal/state taxes, delivery fees, and any platform service charges.</li>
    <li><strong>Out-of-Stock Items and Substitutions:</strong> If a dish or ingredient is unavailable after you place an order, the Restaurant or Nectar support will attempt to contact you to arrange a suitable substitution. If a substitution cannot be agreed upon, the unavailable item will be removed from your order and refunded accordingly.</li>
</ul>

<h4>4. Payment and Billing Terms</h4>
<p>Nectar facilitates payment collection on behalf of Restaurant partners and Couriers through secure, authorized payment methods:</p>
<ul>
    <li><strong>Electronic Payments:</strong> We accept major credit cards, debit cards, and digital payment methods. When paying online, your payment is processed via certified, encrypted PCI-DSS compliant third-party processors. You represent and warrant that you are authorized to use the chosen payment method.</li>
    <li><strong>Cash on Delivery (COD):</strong> Where Cash on Delivery is enabled for an order, you agree to pay the courier the exact total balance due in local currency upon arrival. Repeated failure or refusal to pay for COD orders upon delivery will result in immediate and permanent account termination and potential legal recovery.</li>
    <li><strong>Promotions and Coupons:</strong> Promo codes and discounts must be applied prior to completing checkout and are subject to specific eligibility terms, minimum spend thresholds, and expiration dates.</li>
</ul>

<h4>5. Delivery, Drop-Off, and Customer Responsibility</h4>
<p>We strive to ensure meals are delivered fresh, hot, and prompt. However, successful delivery requires mutual cooperation:</p>
<ul>
    <li><strong>Estimated Arrival Times (ETA):</strong> Delivery times displayed across the platform are good-faith estimates based on kitchen cooking times, courier availability, road traffic, and weather conditions. ETAs are not legally guaranteed delivery deadlines.</li>
    <li><strong>Accurate Delivery Addresses:</strong> You are responsible for providing precise drop-off details, including building names, apartment/flat numbers, access codes, and gate instructions.</li>
    <li><strong>Customer Availability:</strong> You must be present and available at the delivery location to receive your order when the courier arrives. Couriers will attempt to reach you by phone or app notification. If you cannot be contacted or fail to collect the food within <strong>ten (10) minutes</strong> of the courier's arrival, the order will be deemed forfeited without refund to compensate the restaurant and courier for prepared perishable items and transit time.</li>
</ul>

<h4>6. Cancellations, Refunds, and Order Issues</h4>
<p>Due to the perishable and custom-made nature of freshly prepared food, our cancellation policy operates as follows:</p>
<ul>
    <li><strong>Cancellation Window:</strong> You may cancel an order free of charge only before the Restaurant has accepted and begun preparing your food. Once food preparation has commenced, orders cannot be cancelled, and no full refund will be provided.</li>
    <li><strong>Order Discrepancies and Missing Items:</strong> If your order arrives incomplete, incorrect, or with significant quality defects, you must notify Nectar customer support through the platform within <strong>two (2) hours</strong> of delivery. You must provide clear photographic evidence of the packaging and items received.</li>
    <li><strong>Refund Settlement:</strong> Upon verification of an eligible claim, Nectar will issue a partial or full refund. Refunds may be issued to your original payment method (subject to your bank’s standard processing timeline) or as instant Nectar platform wallet credit.</li>
</ul>

<h4>7. Food Allergies, Dietary Preferences, and Health Disclaimers</h4>
<p><strong>Please read this section carefully before placing an order:</strong></p>
<ul>
    <li>Independent Restaurant partners prepare all culinary dishes. While Nectar provides features for restaurants to display ingredient descriptions, spiciness levels, and dietary badges (e.g. Vegetarian, Halal, Gluten-Free), Nectar does not inspect kitchen ingredients or cooking procedures.</li>
    <li><strong>Severe Allergies:</strong> If you or anyone consuming the order suffers from severe food allergies or medical dietary sensitivities (such as nut, shellfish, gluten, dairy, or egg allergies), <em>you must contact the restaurant partner directly prior to placing your order</em> to confirm that meals can be prepared safely without risk of cross-contamination.</li>
    <li><strong>Disclaimer:</strong> Nectar expressly disclaims all liability for allergic reactions, illness, foodborne pathogens, or adverse health effects arising from food prepared and packaged by third-party Restaurant partners.</li>
</ul>

<h4>8. Customer Ratings, Reviews, and Platform Conduct</h4>
<p>Nectar encourages honest feedback to help maintain exceptional culinary standards across our community. When submitting reviews, ratings, or communicating on the platform, you agree to:</p>
<ul>
    <li>Provide truthful, genuine, and constructive ratings based on your personal dining experience.</li>
    <li>Refrain from posting defamatory, obscene, harassing, abusive, hateful, or misleading content.</li>
    <li>Treat delivery couriers, restaurant personnel, and customer support representatives with courtesy and respect at all times. Physical or verbal hostility will result in immediate account ban.</li>
    <li>Not use automated software, bots, scrapers, or exploits to manipulate ratings, extract platform data, or abuse promotional discounts.</li>
</ul>
<p>Nectar reserves the right to moderate, hide, or remove any review that violates these community conduct standards.</p>

<h4>9. Intellectual Property Rights</h4>
<p>All software, brand designs, logos, graphics, interfaces, audio, code, and content displayed on Nectar are the exclusive proprietary property of Nectar or its licensors. You are granted a limited, personal, non-exclusive, and non-transferable license to access the platform for individual, non-commercial food ordering. You may not copy, reverse-engineer, decompile, modify, or commercially exploit any part of Nectar without our prior written consent.</p>

<h4>10. Limitation of Liability</h4>
<p>To the maximum extent permitted by applicable law, Nectar, its directors, employees, affiliates, and agents shall not be liable for any indirect, punitive, incidental, special, or consequential damages, including loss of profits, data, goodwill, or personal inconvenience arising out of your use of the platform, delivery delays, or culinary preparation by third-party restaurants.</p>
<p>In all circumstances, Nectar's total aggregate liability to you for any claim arising out of or relating to these Terms or any specific order shall not exceed the total amount paid by you for the specific order giving rise to the claim.</p>

<h4>11. Account Suspension and Termination</h4>
<p>Nectar reserves the right to suspend, restrict, or permanently terminate your account and platform access without prior notice if we reasonably believe you have violated these Terms, engaged in fraudulent payment transactions, repeatedly abused the Cash on Delivery system, or harassed platform partners.</p>

<h4>12. Governing Law and Dispute Resolution</h4>
<p>These Terms shall be governed by and construed in accordance with the laws of the jurisdiction in which Nectar operates. In the event of any disagreement or dispute, you agree to first contact Nectar Customer Support in good faith to resolve the matter informally before initiating any formal legal proceedings.</p>

<h4>13. Modifications to These Terms</h4>
<p>We may amend or update these Terms periodically to accommodate new features, services, or legal standards. Updated Terms will be published on this page with a revised "Effective Date". Your continued access or use of Nectar after changes take effect constitutes your full acceptance of the revised Terms.</p>

<h4>14. Contact Information</h4>
<p>If you have any questions or require assistance regarding these Terms of Service, please contact us via our platform <a href="/contact-us">Contact Us</a> page or email <strong>support@nectar.app</strong>.</p>
HTML;

        // Update or insert Privacy Policy for 'en'
        if (Schema::hasTable('privacy_policies')) {
            $existingPrivacy = DB::table('privacy_policies')->where('lang_code', 'en')->first();
            if ($existingPrivacy) {
                DB::table('privacy_policies')->where('lang_code', 'en')->update([
                    'description' => $privacyHtml,
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('privacy_policies')->insert([
                    'lang_code' => 'en',
                    'description' => $privacyHtml,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        // Update or insert Terms and Conditions for 'en'
        if (Schema::hasTable('term_and_conditions')) {
            $existingTerms = DB::table('term_and_conditions')->where('lang_code', 'en')->first();
            if ($existingTerms) {
                DB::table('term_and_conditions')->where('lang_code', 'en')->update([
                    'description' => $termsHtml,
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('term_and_conditions')->insert([
                    'lang_code' => 'en',
                    'description' => $termsHtml,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Keep contents intact on rollback or no-op
    }
};
