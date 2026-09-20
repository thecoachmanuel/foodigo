<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('faqs')) {
            Schema::create('faqs', function (Blueprint $table) {
                $table->id();
                $table->string('type')->default('user')->index();
                $table->text('question');
                $table->longText('answer');
                $table->integer('status')->default(1);
                $table->integer('serial')->default(0);
                $table->timestamps();
            });
        } else {
            if (!Schema::hasColumn('faqs', 'type')) {
                Schema::table('faqs', function (Blueprint $table) {
                    $table->string('type')->default('user')->index()->after('id');
                });
            }
        }

        // Seed User FAQs if missing
        if (DB::table('faqs')->where('type', 'user')->orWhereNull('type')->count() === 0) {
            DB::table('faqs')->insert([
                [
                    'type' => 'user',
                    'question' => 'How to create an account?',
                    'answer' => 'Download the Nectar app, open it, and follow the sign-up prompt. Enter your name, email, phone number, and password to get started immediately.',
                    'status' => 1,
                    'serial' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'user',
                    'question' => 'How do I track my order?',
                    'answer' => 'Go to the Orders tab, select your active order, and click Track Order to view real-time delivery status updates.',
                    'status' => 1,
                    'serial' => 2,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'user',
                    'question' => 'What payment methods are supported?',
                    'answer' => 'We support Paystack, Flutterwave, Stripe, Card payments, and direct Bank Transfer.',
                    'status' => 1,
                    'serial' => 3,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'user',
                    'question' => 'Can I cancel an order after placing it?',
                    'answer' => 'You can cancel your order while it is still in Pending status from the Order Details page. Once food preparation begins, orders cannot be cancelled.',
                    'status' => 1,
                    'serial' => 4,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'user',
                    'question' => 'How do I apply a discount coupon?',
                    'answer' => 'During checkout on the order confirmation screen, enter your promo coupon code into the coupon field and click Apply.',
                    'status' => 1,
                    'serial' => 5,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'user',
                    'question' => 'How long does delivery take?',
                    'answer' => 'Delivery typically takes between 25 to 45 minutes depending on restaurant preparation time, distance, and traffic conditions.',
                    'status' => 1,
                    'serial' => 6,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
            ]);
        }

        // Seed Restaurant Partner FAQs if missing
        if (DB::table('faqs')->where('type', 'partner')->count() === 0) {
            DB::table('faqs')->insert([
                [
                    'type' => 'partner',
                    'question' => 'How do I add a new menu item?',
                    'answer' => 'Go to the "My Menu" tab and tap the "+" floating action button. Fill in the dish title, category, regular price, discount price, variants, addons, and upload an appetising food photo.',
                    'status' => 1,
                    'serial' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'partner',
                    'question' => 'How do I request a wallet payout / withdrawal?',
                    'answer' => 'Navigate to Profile > My Wallet. Check your available balance and tap "Withdraw Request". Enter your withdrawal amount and bank details to submit for admin approval.',
                    'status' => 1,
                    'serial' => 2,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'partner',
                    'question' => 'Can I manage addons and extra toppings?',
                    'answer' => 'Yes! Open Profile > Addon Manage. You can create standalone addons like extra cheese, dipping sauces, or sides, and associate them with any menu item.',
                    'status' => 1,
                    'serial' => 3,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'partner',
                    'question' => 'How do I update opening hours & schedules?',
                    'answer' => 'Open Profile > Restaurant Info. Configure operating hours, minimum processing times, delivery radiuses, and pickup/delivery options.',
                    'status' => 1,
                    'serial' => 4,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'type' => 'partner',
                    'question' => 'How do I advance the status of an active order?',
                    'answer' => 'In the Orders tab or Order Details page, move order status to Confirmed, Cooking, or On The Way to notify the customer and assign delivery couriers.',
                    'status' => 1,
                    'serial' => 5,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
            ]);
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('faqs');
    }
};
