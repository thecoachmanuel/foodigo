<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('app_notifications')) {
            Schema::create('app_notifications', function (Blueprint $table) {
                $table->id();
                $table->string('target_type')->default('all'); // all, users, restaurants, user, restaurant
                $table->unsignedBigInteger('target_id')->nullable(); // user_id or restaurant_id
                $table->string('title');
                $table->text('message');
                $table->string('type')->default('general'); // order_status, promo, broadcast, general
                $table->unsignedBigInteger('order_id')->nullable();
                $table->string('image')->nullable();
                $table->string('action_url')->nullable();
                $table->json('data')->nullable();
                $table->boolean('is_read')->default(false);
                $table->timestamps();

                $table->index(['target_type', 'target_id']);
                $table->index('type');
                $table->index('order_id');
                $table->index('created_at');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('app_notifications');
    }
};
