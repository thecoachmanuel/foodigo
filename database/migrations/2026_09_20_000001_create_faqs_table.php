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
                $table->text('question');
                $table->longText('answer');
                $table->integer('status')->default(1);
                $table->integer('serial')->default(0);
                $table->timestamps();
            });

            DB::table('faqs')->insert([
                [
                    'question' => 'How to create an account?',
                    'answer' => 'Download the Nectar app, open it, and follow the sign-up prompt. Enter your name, email, phone number, and password to get started immediately.',
                    'status' => 1,
                    'serial' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'question' => 'How do I track my order?',
                    'answer' => 'Go to the Orders tab, select your active order, and click Track Order to view real-time delivery status updates.',
                    'status' => 1,
                    'serial' => 2,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'question' => 'What payment methods are supported?',
                    'answer' => 'We support Paystack, Flutterwave, Stripe, Card payments, and direct Bank Transfer.',
                    'status' => 1,
                    'serial' => 3,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'question' => 'Can I cancel an order after placing it?',
                    'answer' => 'You can cancel your order while it is still in Pending status from the Order Details page. Once food preparation begins, orders cannot be cancelled.',
                    'status' => 1,
                    'serial' => 4,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'question' => 'How do I apply a discount coupon?',
                    'answer' => 'During checkout on the order confirmation screen, enter your promo coupon code into the coupon field and click Apply.',
                    'status' => 1,
                    'serial' => 5,
                    'created_at' => now(),
                    'updated_at' => now(),
                ],
                [
                    'question' => 'How long does delivery take?',
                    'answer' => 'Delivery typically takes between 25 to 45 minutes depending on restaurant preparation time, distance, and traffic conditions.',
                    'status' => 1,
                    'serial' => 6,
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
