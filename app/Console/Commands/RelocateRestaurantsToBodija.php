<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class RelocateRestaurantsToBodija extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'foodigo:relocate-restaurants-bodija';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Relocate all active restaurants to authentic locations in Ibadan in and around Bodija';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        if (!Schema::hasTable('restaurants')) {
            $this->error('Table restaurants does not exist.');
            return 1;
        }

        $bodijaLocations = [
            4 => [
                'restaurant_name' => 'Yellow Chilli Restaurant & Bar',
                'address' => '14 Awolowo Avenue, Old Bodija, Ibadan, Oyo State',
                'latitude' => 7.4208,
                'longitude' => 3.9015,
            ],
            5 => [
                'restaurant_name' => 'The Place Restaurant',
                'address' => 'Plot 5, Oshuntokun Avenue, Old Bodija, Ibadan, Oyo State',
                'latitude' => 7.4275,
                'longitude' => 3.9068,
            ],
            6 => [
                'restaurant_name' => 'Mega Chicken & Grills',
                'address' => 'Plot 12, Secretariat Road, Bodija, Ibadan, Oyo State',
                'latitude' => 7.4172,
                'longitude' => 3.9095,
            ],
            7 => [
                'restaurant_name' => 'Kilimanjaro Eatery',
                'address' => 'Suite 4, Bodija Shopping Complex, Housing Estate, New Bodija, Ibadan, Oyo State',
                'latitude' => 7.4320,
                'longitude' => 3.9142,
            ],
            8 => [
                'restaurant_name' => 'Bukka Hut Lounge',
                'address' => '28 Aare Avenue, New Bodija, Ibadan, Oyo State',
                'latitude' => 7.4365,
                'longitude' => 3.9110,
            ],
            10 => [
                'restaurant_name' => 'Chicken Republic Express',
                'address' => '10 Sango - Bodija Road, Near UI Second Gate, Bodija, Ibadan, Oyo State',
                'latitude' => 7.4385,
                'longitude' => 3.8980,
            ],
            11 => [
                'restaurant_name' => 'Terra Kulture Food Lounge',
                'address' => '8 Francis Okediji Street, Old Bodija, Ibadan, Oyo State',
                'latitude' => 7.4240,
                'longitude' => 3.9035,
            ],
        ];

        $updatedCount = 0;
        foreach ($bodijaLocations as $id => $data) {
            $updated = DB::table('restaurants')->where('id', $id)->update([
                'address' => $data['address'],
                'latitude' => $data['latitude'],
                'longitude' => $data['longitude'],
                'max_delivery_distance' => 2000.00,
                'updated_at' => now(),
            ]);
            if ($updated) {
                $updatedCount++;
                $this->info("Updated {$data['restaurant_name']} (ID {$id}) -> {$data['address']}");
            }
        }

        // Also update any other restaurants without specific coords to Bodija
        $fallbackOthers = DB::table('restaurants')
            ->whereNotIn('id', array_keys($bodijaLocations))
            ->update([
                'address' => 'Bodija Commercial Area, Ibadan, Oyo State',
                'latitude' => 7.4250,
                'longitude' => 3.9050,
                'max_delivery_distance' => 2000.00,
                'updated_at' => now(),
            ]);

        $this->info("Successfully relocated {$updatedCount} primary restaurants and {$fallbackOthers} additional restaurants to Bodija, Ibadan!");
        return 0;
    }
}
