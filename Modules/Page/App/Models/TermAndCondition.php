<?php

namespace Modules\Page\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Page\Database\factories\TermAndConditionFactory;

class TermAndCondition extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = ['lang_code', 'description'];

    /**
     * Get Terms and Conditions for the given language with guaranteed Nectar fallback.
     */
    public static function getForLanguage(?string $lang = null): static
    {
        $lang = $lang ?: (function_exists('front_lang') ? front_lang() : 'en');
        $terms = static::where('lang_code', $lang)->first();

        // If not found or contains legacy boilerplate, serve and persist Nectar content
        if (!$terms || empty($terms->description) || str_contains($terms->description, 'Foodigo') || str_contains($terms->description, 'What are Terms and Conditions?')) {
            $defaultHtml = static::getDefaultNectarTermsAndConditions();
            if ($terms) {
                $terms->description = $defaultHtml;
                try {
                    $terms->save();
                } catch (\Throwable $e) {}
            } else {
                $terms = new static();
                $terms->lang_code = $lang;
                $terms->description = $defaultHtml;
                try {
                    $terms->save();
                } catch (\Throwable $e) {}
            }
        }

        return $terms;
    }

    /**
     * Default comprehensive Nectar Terms and Conditions HTML.
     */
    public static function getDefaultNectarTermsAndConditions(): string
    {
        return <<<'HTML'
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
    }

}
