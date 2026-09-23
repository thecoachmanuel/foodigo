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
        if (!Schema::hasTable('order_delivery_man_rejections')) {
            Schema::create('order_delivery_man_rejections', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('order_id')->index();
                $table->unsignedBigInteger('delivery_man_id')->index();
                $table->string('reason')->nullable();
                $table->timestamps();

                $table->unique(['order_id', 'delivery_man_id'], 'order_rider_unique');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_delivery_man_rejections');
    }
};
