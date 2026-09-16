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
        DB::statement('SET FOREIGN_KEY_CHECKS = 0;');

        $tables = [
            'about_us', 'about_us_translations', 'addons', 'addon_translations', 'admins',
            'banners', 'blogs', 'blog_categories', 'blog_category_translations', 'blog_comments',
            'blog_translations', 'carts', 'cart_addons', 'categories', 'category_translations',
            'cities', 'city_translations', 'contact_messages', 'contact_us', 'contact_us_translations',
            'coupons', 'cuisines', 'cuisine_translations', 'currencies', 'deliveryman_withdraws',
            'delivery_areas', 'delivery_men', 'document_types', 'document_type_translations',
            'email_settings', 'email_templates', 'footers', 'footer_translations', 'global_settings',
            'homepages', 'homepage_translations', 'languages', 'offers', 'offer_products',
            'orders', 'order_items', 'payment_gateways', 'personal_access_tokens',
            'privacy_policies', 'products', 'product_translations', 'pwa_icon_settings', 'restaurants'
        ];

        foreach ($tables as $tbl) {
            if (!Schema::hasTable($tbl)) continue;

            $pks = DB::select("SHOW KEYS FROM `{$tbl}` WHERE Key_name = 'PRIMARY'");
            if (empty($pks)) {
                try {
                    // Check if duplicate rows exist, deduplicate if needed
                    $total = DB::select("SELECT COUNT(*) as c FROM `{$tbl}`")[0]->c ?? 0;
                    $distinct = DB::select("SELECT COUNT(DISTINCT id) as c FROM `{$tbl}`")[0]->c ?? 0;
                    if ($total > $distinct && $distinct > 0) {
                        DB::statement("DROP TABLE IF EXISTS `{$tbl}__dedup`");
                        DB::statement("CREATE TABLE `{$tbl}__dedup` AS SELECT DISTINCT * FROM `{$tbl}`");
                        DB::statement("TRUNCATE TABLE `{$tbl}`");
                        DB::statement("INSERT INTO `{$tbl}` SELECT * FROM `{$tbl}__dedup`");
                        DB::statement("DROP TABLE `{$tbl}__dedup`");
                    }
                    DB::statement("ALTER TABLE `{$tbl}` ADD PRIMARY KEY (`id`)");
                    DB::statement("ALTER TABLE `{$tbl}` MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT");
                } catch (\Throwable $e) {}
            }
        }

        // Performance compound and lookup indexes
        $indexes = [
            // Orders
            "ALTER TABLE `orders` ADD INDEX `idx_orders_restaurant_status` (`restaurant_id`, `order_status`)",
            "ALTER TABLE `orders` ADD INDEX `idx_orders_user_id` (`user_id`)",
            "ALTER TABLE `orders` ADD INDEX `idx_orders_order_status` (`order_status`)",
            "ALTER TABLE `orders` ADD INDEX `idx_orders_payment_status` (`payment_status`)",
            "ALTER TABLE `orders` ADD INDEX `idx_orders_delivery_man_id` (`delivery_man_id`)",
            "ALTER TABLE `orders` ADD INDEX `idx_orders_created_at` (`created_at`)",

            // Products
            "ALTER TABLE `products` ADD INDEX `idx_products_status_featured` (`status`, `is_featured`)",
            "ALTER TABLE `products` ADD INDEX `idx_products_restaurant_status` (`restaurant_id`, `status`)",
            "ALTER TABLE `products` ADD INDEX `idx_products_category_status` (`category_id`, `status`)",
            "ALTER TABLE `products` ADD INDEX `idx_products_slug` (`slug`)",

            // Restaurants
            "ALTER TABLE `restaurants` ADD INDEX `idx_restaurants_approval_banned` (`admin_approval`, `is_banned`)",
            "ALTER TABLE `restaurants` ADD INDEX `idx_restaurants_slug` (`slug`)",

            // Order items
            "ALTER TABLE `order_items` ADD INDEX `idx_order_items_order_id` (`order_id`)",
            "ALTER TABLE `order_items` ADD INDEX `idx_order_items_product_id` (`product_id`)",

            // Categories & Cuisines
            "ALTER TABLE `categories` ADD INDEX `idx_categories_status` (`status`)",
            "ALTER TABLE `categories` ADD INDEX `idx_categories_slug` (`slug`)",
            "ALTER TABLE `cuisines` ADD INDEX `idx_cuisines_status` (`status`)",
            "ALTER TABLE `cuisines` ADD INDEX `idx_cuisines_slug` (`slug`)",
        ];

        foreach ($indexes as $idxSql) {
            try {
                DB::statement($idxSql);
            } catch (\Throwable $e) {}
        }

        DB::statement('SET FOREIGN_KEY_CHECKS = 1;');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Indexes and PKs do not need dropping on rollback
    }
};
