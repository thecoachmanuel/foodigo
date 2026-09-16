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
        if (Schema::hasTable('homepages') && !Schema::hasColumn('homepages', 'show_working_step_on_mobile')) {
            Schema::table('homepages', function (Blueprint $table) {
                $table->string('show_working_step_on_mobile')->default('disable')->nullable();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasTable('homepages') && Schema::hasColumn('homepages', 'show_working_step_on_mobile')) {
            Schema::table('homepages', function (Blueprint $table) {
                $table->dropColumn('show_working_step_on_mobile');
            });
        }
    }
};
