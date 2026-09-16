<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Log;

class InitDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'foodigo:init-db {--force : Force database re-initialization even if data exists} {--force-if-empty : Initialize only if the database is empty}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Initialize Foodigo database schema, seed data, and configure Naira (NGN) default currency';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $force = $this->option('force');
        $forceIfEmpty = $this->option('force-if-empty');

        $hasData = false;
        try {
            if (Schema::hasTable('homepages') && DB::table('homepages')->count() > 0) {
                $hasData = true;
            }
        } catch (\Throwable $e) {
            $hasData = false;
        }

        if ($hasData && !$force) {
            $this->info('Foodigo database already contains data.');
            $this->ensureNairaCurrency();
            return 0;
        }

        $this->info('Initializing Foodigo database from database.sql...');

        $sqlPath = database_path('database.sql');
        if (!file_exists($sqlPath)) {
            $this->error("SQL dump file not found at: {$sqlPath}");
            return 1;
        }

        try {
            // Disable foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS = 0;');

            // Wipe existing empty/partial tables so fresh dump loads without collision
            try {
                $this->call('db:wipe', ['--force' => true]);
            } catch (\Throwable $e) {
                $this->warn('Could not wipe existing tables via db:wipe: ' . $e->getMessage());
            }

            // Read SQL dump
            $sql = file_get_contents($sqlPath);

            // Execute the raw SQL multi-query dump
            DB::unprepared($sql);

            // Re-enable foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS = 1;');

            // Prioritize Naira as default currency
            $this->ensureNairaCurrency();

            $this->info('Foodigo database successfully initialized from database.sql!');
            return 0;
        } catch (\Throwable $e) {
            $this->error('Failed to initialize database: ' . $e->getMessage());
            Log::error('Foodigo InitDatabase error: ' . $e->getMessage());
            return 1;
        }
    }

    /**
     * Ensure Nigerian Naira (NGN, ₦) is set as default currency without breaking other currencies.
     */
    protected function ensureNairaCurrency()
    {
        try {
            if (Schema::hasTable('currencies')) {
                $ngn = DB::table('currencies')->where('currency_code', 'NGN')->first();
                if ($ngn) {
                    DB::table('currencies')->where('currency_code', '!=', 'NGN')->update(['is_default' => 'no']);
                    DB::table('currencies')->where('currency_code', 'NGN')->update([
                        'currency_name' => 'Nigerian Naira',
                        'currency_code' => 'NGN',
                        'country_code' => 'NG',
                        'currency_icon' => '₦',
                        'currency_rate' => 1.00,
                        'currency_position' => 'before_price',
                        'is_default' => 'yes',
                        'status' => 'active',
                    ]);
                } else {
                    DB::table('currencies')->update(['is_default' => 'no']);
                    DB::table('currencies')->insert([
                        'currency_name' => 'Nigerian Naira',
                        'currency_code' => 'NGN',
                        'country_code' => 'NG',
                        'currency_icon' => '₦',
                        'currency_rate' => 1.00,
                        'currency_position' => 'before_price',
                        'is_default' => 'yes',
                        'status' => 'active',
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
                $this->info('Nigerian Naira (NGN / ₦) prioritized as default currency successfully.');
            }
        } catch (\Throwable $e) {
            Log::warning('Naira currency configuration notice: ' . $e->getMessage());
        }
    }
}
