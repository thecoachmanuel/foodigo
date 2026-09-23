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
        Schema::table('delivery_men', function (Blueprint $table) {
            if (!Schema::hasColumn('delivery_men', 'latitude')) {
                $table->decimal('latitude', 10, 7)->nullable()->after('address');
            }
            if (!Schema::hasColumn('delivery_men', 'longitude')) {
                $table->decimal('longitude', 10, 7)->nullable()->after('latitude');
            }
            if (!Schema::hasColumn('delivery_men', 'last_location_update_at')) {
                $table->timestamp('last_location_update_at')->nullable()->after('longitude');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('delivery_men', function (Blueprint $table) {
            if (Schema::hasColumn('delivery_men', 'latitude')) {
                $table->dropColumn('latitude');
            }
            if (Schema::hasColumn('delivery_men', 'longitude')) {
                $table->dropColumn('longitude');
            }
            if (Schema::hasColumn('delivery_men', 'last_location_update_at')) {
                $table->dropColumn('last_location_update_at');
            }
        });
    }
};
