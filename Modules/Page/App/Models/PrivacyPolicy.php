<?php

namespace Modules\Page\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Page\Database\factories\PrivacyPolicyFactory;

class PrivacyPolicy extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = ['lang_code', 'description'];

    /**
     * Get Privacy Policy for the given language with guaranteed Nectar fallback.
     */
    public static function getForLanguage(?string $lang = null): static
    {
        $lang = $lang ?: (function_exists('front_lang') ? front_lang() : 'en');
        $policy = static::where('lang_code', $lang)->first();

        // If not found or contains legacy boilerplate, serve and persist Nectar content
        if (!$policy || empty($policy->description) || str_contains($policy->description, 'Foodigo') || str_contains($policy->description, 'What are Privacy Policy?')) {
            $defaultHtml = static::getDefaultNectarPrivacyPolicy();
            if ($policy) {
                $policy->description = $defaultHtml;
                try {
                    $policy->save();
                } catch (\Throwable $e) {}
            } else {
                $policy = new static();
                $policy->lang_code = $lang;
                $policy->description = $defaultHtml;
                try {
                    $policy->save();
                } catch (\Throwable $e) {}
            }
        }

        return $policy;
    }

    /**
     * Default comprehensive Nectar Privacy Policy HTML.
     */
    public static function getDefaultNectarPrivacyPolicy(): string
    {
        return <<<'HTML'
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
    }

}
