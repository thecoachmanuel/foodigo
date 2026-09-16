<?php

namespace AppConsoleCommands;

use IlluminateConsoleCommand;
use IlluminateSupportFacadesDB;
use IlluminateSupportFacadesSchema;
use IlluminateSupportFacadesLog;

class SeedNigerianData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'foodigo:seed-nigerian-data';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Seed and update authentic Nigerian cuisines, food categories, restaurants, dishes, and realistic Naira pricing';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Starting Nigerian localization data seeding...');

        try {
            // 1. Update Cuisines & Translations
            $this->seedCuisines();

            // 2. Update Categories & Translations
            $this->seedCategories();

            // 3. Update Restaurants
            $this->seedRestaurants();

            // 4. Update Addons & Translations
            $this->seedAddons();

            // 5. Update Food Products & Translations
            $this->seedProducts();

            $this->info('Nigerian data successfully localized across all restaurants, cuisines, categories, and products!');
            return 0;
        } catch (\Throwable $e) {
            $this->error('Failed to seed Nigerian data: ' . $e->getMessage());
            Log::error('SeedNigerianData error: ' . $e->getMessage());
            return 1;
        }
    }

    protected function seedCuisines()
    {
        if (!Schema::hasTable('cuisines') || !Schema::hasTable('cuisine_translations')) {
            return;
        }

        $cuisines = [
            1 => ['slug' => 'nigerian-traditional', 'name' => 'Nigerian Traditional'],
            2 => ['slug' => 'afro-fusion', 'name' => 'Afro-Fusion & Continental'],
            3 => ['slug' => 'suya-grills', 'name' => 'Suya, Grills & BBQ'],
            4 => ['slug' => 'bukka-delicacies', 'name' => 'Bukka Delicacies'],
            5 => ['slug' => 'seafood-soups', 'name' => 'Seafood & Peppersoups'],
        ];

        foreach ($cuisines as $id => $data) {
            DB::table('cuisines')->where('id', $id)->update([
                'slug' => $data['slug'],
                'status' => 'enable',
                'updated_at' => now(),
            ]);

            DB::table('cuisine_translations')->updateOrInsert(
                ['cuisine_id' => $id, 'lang_code' => 'en'],
                ['name' => $data['name'], 'updated_at' => now()]
            );

            DB::table('cuisine_translations')->updateOrInsert(
                ['cuisine_id' => $id, 'lang_code' => 'bn'],
                ['name' => $data['name'], 'updated_at' => now()]
            );
        }
        $this->info('Cuisines localized.');
    }

    protected function seedCategories()
    {
        if (!Schema::hasTable('categories') || !Schema::hasTable('category_translations')) {
            return;
        }

        $categories = [
            1 => ['slug' => 'pastries-small-chops', 'name' => 'Pastries & Small Chops'],
            2 => ['slug' => 'burgers-shawarma', 'name' => 'Burgers & Shawarma'],
            3 => ['slug' => 'meat-pies-pizza', 'name' => 'Meat Pies & Pizza'],
            4 => ['slug' => 'puff-puff-treats', 'name' => 'Puff-Puff & Sweet Treats'],
            5 => ['slug' => 'suya-grills', 'name' => 'Suya & Grills'],
            6 => ['slug' => 'street-bites', 'name' => 'Street Bites & Finger Foods'],
            7 => ['slug' => 'drinks-refreshments', 'name' => 'Drinks & Refreshments'],
            8 => ['slug' => 'cakes-desserts', 'name' => 'Cakes & Desserts'],
            9 => ['slug' => 'peppered-chicken-turkey', 'name' => 'Peppered Chicken & Turkey'],
            10 => ['slug' => 'soups-swallows', 'name' => 'Soups & Swallows'],
            11 => ['slug' => 'rice-jollof-specials', 'name' => 'Rice & Jollof Specials'],
            12 => ['slug' => 'noodles-pasta', 'name' => 'Noodles & Pasta'],
        ];

        foreach ($categories as $id => $data) {
            DB::table('categories')->where('id', $id)->update([
                'slug' => $data['slug'],
                'status' => 'enable',
                'updated_at' => now(),
            ]);

            DB::table('category_translations')->updateOrInsert(
                ['category_id' => $id, 'lang_code' => 'en'],
                ['name' => $data['name'], 'updated_at' => now()]
            );

            DB::table('category_translations')->updateOrInsert(
                ['category_id' => $id, 'lang_code' => 'bn'],
                ['name' => $data['name'], 'updated_at' => now()]
            );
        }
        $this->info('Categories localized.');
    }

    protected function seedRestaurants()
    {
        if (!Schema::hasTable('restaurants')) {
            return;
        }

        $restaurants = [
            4 => [
                'restaurant_name' => 'Yellow Chilli Restaurant & Bar',
                'slug' => 'yellow-chilli-restaurant',
                'address' => '27 Oju Olobun Close, Off Bishop Oluwole St, Victoria Island, Lagos',
                'latitude' => 6.4281,
                'longitude' => 3.4219,
                'cuisines' => json_encode(['1', '3', '4']),
            ],
            5 => [
                'restaurant_name' => 'The Place Restaurant',
                'slug' => 'the-place-restaurant',
                'address' => '4 Adeola Odeku St, Victoria Island, Lagos',
                'latitude' => 6.4312,
                'longitude' => 3.4184,
                'cuisines' => json_encode(['1', '2', '3']),
            ],
            6 => [
                'restaurant_name' => 'Mega Chicken & Grills',
                'slug' => 'mega-chicken-grills',
                'address' => 'Plot 1, Commercial Block, Lekki - Epe Expy, Ikota, Lagos',
                'latitude' => 6.4474,
                'longitude' => 3.5284,
                'cuisines' => json_encode(['1', '2', '5']),
            ],
            7 => [
                'restaurant_name' => 'Kilimanjaro Eatery',
                'slug' => 'kilimanjaro-eatery',
                'address' => '138 Admiralty Way, Lekki Phase 1, Lagos',
                'latitude' => 6.4498,
                'longitude' => 3.4723,
                'cuisines' => json_encode(['1', '3', '4']),
            ],
            8 => [
                'restaurant_name' => 'Bukka Hut Lounge',
                'slug' => 'bukka-hut-lounge',
                'address' => 'Block 69A, Plot 8 Admiralty Way, Lekki Phase 1, Lagos',
                'latitude' => 6.4485,
                'longitude' => 3.4682,
                'cuisines' => json_encode(['1', '4', '5']),
            ],
            10 => [
                'restaurant_name' => 'Chicken Republic Express',
                'slug' => 'chicken-republic-express',
                'address' => '23 Glover Road, Ikoyi, Lagos',
                'latitude' => 6.4520,
                'longitude' => 3.4350,
                'cuisines' => json_encode(['2', '3']),
            ],
            11 => [
                'restaurant_name' => 'Terra Kulture Food Lounge',
                'slug' => 'terra-kulture-lounge',
                'address' => 'Plot 1376 Tiamiyu Savage St, Victoria Island, Lagos',
                'latitude' => 6.4315,
                'longitude' => 3.4241,
                'cuisines' => json_encode(['1', '4']),
            ],
        ];

        foreach ($restaurants as $id => $data) {
            $updateData = [
                'restaurant_name' => $data['restaurant_name'],
                'slug' => $data['slug'],
                'address' => $data['address'],
                'latitude' => $data['latitude'],
                'longitude' => $data['longitude'],
                'cuisines' => $data['cuisines'],
                'admin_approval' => 'enable',
                'is_banned' => 'disable',
                'is_featured' => 'enable',
                'is_trusted' => 1,
                'max_delivery_distance' => 2000.00,
                'updated_at' => now(),
            ];

            DB::table('restaurants')->where('id', $id)->update($updateData);
        }
        $this->info('Restaurants localized.');
    }

    protected function seedAddons()
    {
        if (!Schema::hasTable('addons') || !Schema::hasTable('addon_translations')) {
            return;
        }

        $addons = [
            1 => ['name' => 'Extra Fried Plantain (Dodo)', 'price' => 700],
            2 => ['name' => 'Extra Hard-Boiled Egg', 'price' => 400],
            3 => ['name' => 'Extra Crispy Fried Chicken', 'price' => 1800],
            4 => ['name' => 'Extra Beef Suya Portion', 'price' => 1500],
            10 => ['name' => 'Extra Peppered Goat Meat Piece', 'price' => 1800],
            11 => ['name' => 'Extra Ayamase Designer Stew Dip', 'price' => 800],
            12 => ['name' => 'Chilled Soft Drink (50cl)', 'price' => 600],
            13 => ['name' => 'Extra Wrap of Pounded Yam', 'price' => 800],
            20 => ['name' => 'Extra Pepper Sauce', 'price' => 500],
            21 => ['name' => 'Extra Fried Fish Portion', 'price' => 2000],
            24 => ['name' => 'Extra Coleslaw Salad', 'price' => 700],
            121 => ['name' => 'Extra Sliced Onions & Yaji Spice', 'price' => 300],
            124 => ['name' => 'Extra Jumbo Prawns (2 pcs)', 'price' => 2500],
        ];

        foreach ($addons as $id => $data) {
            DB::table('addons')->where('id', $id)->update([
                'price' => $data['price'],
                'status' => 'enable',
                'updated_at' => now(),
            ]);

            DB::table('addon_translations')->updateOrInsert(
                ['addon_id' => $id, 'lang_code' => 'en'],
                ['name' => $data['name'], 'updated_at' => now()]
            );

            DB::table('addon_translations')->updateOrInsert(
                ['addon_id' => $id, 'lang_code' => 'bn'],
                ['name' => $data['name'], 'updated_at' => now()]
            );
        }
        $this->info('Addons localized.');
    }

    protected function seedProducts()
    {
        if (!Schema::hasTable('products') || !Schema::hasTable('product_translations')) {
            return;
        }

        $dishesJson = <<<'JSON'
{
    "13": {
        "name": "Pounded Yam with Rich Egusi Soup & Goat Meat",
        "slug": "pounded-yam-egusi-soup-goat-meat",
        "category_id": 10,
        "price": 4500,
        "offer_price": 4200,
        "desc": "Smooth, fluffy pounded yam served with rich melon-seed Egusi soup, cooked with fresh spinach, dried fish, stockfish, and tender goat meat.",
        "sizes": {
            "Single Portion": "4500",
            "Double Meat": "5800"
        }
    },
    "14": {
        "name": "Double Sausage & Chicken Shawarma",
        "slug": "double-sausage-chicken-shawarma",
        "category_id": 2,
        "price": 3200,
        "offer_price": 2900,
        "desc": "Warm flatbread wrapped around seasoned grilled chicken shreds, double hotdog sausages, crisp cabbage, and rich spicy mayonnaise-ketchup cream.",
        "sizes": {
            "Single Sausage": "2700",
            "Double Sausage & Chicken": "3200",
            "Jumbo Deluxe": "4200"
        }
    },
    "15": {
        "name": "Amala with Silky Ewedu & Gbegiri (Abula Special)",
        "slug": "amala-ewedu-gbegiri-abula-special",
        "category_id": 10,
        "price": 3800,
        "offer_price": 3500,
        "desc": "Fluffy dark Oyo Amala served with green Ewedu, golden yellow bean Gbegiri soup, hot buka stew, assorted shaki, soft kpomo, and tender beef.",
        "sizes": {
            "Standard": "3800",
            "Assorted Special": "5200"
        }
    },
    "16": {
        "name": "Sweet Golden Puff-Puff Box (10 Pcs)",
        "slug": "sweet-golden-puff-puff-box",
        "category_id": 4,
        "price": 1500,
        "offer_price": 1200,
        "desc": "Freshly fried, pillowy sweet golden-brown Nigerian puff-puff dusted with powdered cinnamon sugar.",
        "sizes": {
            "Regular (10 pcs)": "1500",
            "Party Tub (25 pcs)": "3200"
        }
    },
    "17": {
        "name": "Eba with Fresh Seafood Okra Soup & Crab",
        "slug": "eba-fresh-seafood-okra-soup-crab",
        "category_id": 10,
        "price": 5200,
        "offer_price": 4800,
        "desc": "Yellow Ijebu Garri swallow paired with fresh crunchy diced okra soup loaded with jumbo prawns, calamari, fresh fish chunks, and whole blue crab.",
        "sizes": {
            "Regular": "5200",
            "Seafood King Deluxe": "6500"
        }
    },
    "18": {
        "name": "Crispy Nigerian Meat Pie (2 Pcs)",
        "slug": "crispy-nigerian-meat-pie-2pcs",
        "category_id": 3,
        "price": 1800,
        "offer_price": 1500,
        "desc": "Rich, buttery, flaky golden pastry stuffed with finely minced lean beef, diced potatoes, and savory herb seasonings.",
        "sizes": {
            "Pack of 2": "1800",
            "Box of 4": "3400"
        }
    },
    "22": {
        "name": "Gizdodo Supreme (Gizzard & Dodo Bowl)",
        "slug": "gizdodo-supreme-gizzard-dodo-bowl",
        "category_id": 6,
        "price": 3500,
        "offer_price": 3200,
        "desc": "Sweet fried ripe plantain cubes (Dodo) and crunchy peppered chicken gizzard tossed in sweet bell peppers and habanero chili sauce.",
        "sizes": {
            "Standard Bowl": "3500",
            "Jumbo Bowl": "4800"
        }
    },
    "23": {
        "name": "Chilled Zobo Hibiscus Infusion (50cl)",
        "slug": "chilled-zobo-hibiscus-infusion",
        "category_id": 7,
        "price": 1200,
        "offer_price": 1000,
        "desc": "All-natural chilled drink brewed from dried roselle hibiscus flowers, infused with fresh crushed ginger, cloves, and pineapple sweet juice.",
        "sizes": {
            "Bottle (50cl)": "1200",
            "Jug (1.5L)": "3000"
        }
    },
    "24": {
        "name": "Classic Chapman Mocktail with Citrus & Bitters",
        "slug": "classic-chapman-mocktail-citrus-bitters",
        "category_id": 7,
        "price": 2200,
        "offer_price": 1900,
        "desc": "Signature Nigerian sparkling mocktail crafted with Fanta, Sprite, aromatic Angostura bitters, fresh cucumber ribbons, and orange slices.",
        "sizes": {
            "Glass (400ml)": "2200",
            "Pitcher (1L)": "4800"
        }
    },
    "25": {
        "name": "Grilled Whole Catfish Point & Kill with Spicy Sauce",
        "slug": "grilled-whole-catfish-point-kill",
        "category_id": 5,
        "price": 6000,
        "offer_price": 5500,
        "desc": "Fresh whole African catfish seasoned with traditional herbs, slowly charcoal-grilled, and served with spicy pepper sauce, roasted yam, and coleslaw.",
        "sizes": {
            "Medium Catfish": "5500",
            "Large Catfish": "6500"
        }
    },
    "26": {
        "name": "Hot & Spicy Goat Meat Pepper Soup",
        "slug": "hot-spicy-goat-meat-pepper-soup",
        "category_id": 10,
        "price": 3500,
        "offer_price": 3200,
        "desc": "Intensely aromatic light broth brewed with traditional calabash nutmeg (Ehuru), African scent leaves, and tender bone-in goat meat chunks.",
        "sizes": {
            "Standard Bowl": "3500",
            "Mega Bowl": "4800"
        }
    },
    "27": {
        "name": "Asun Peppered Roasted Goat Meat Bites",
        "slug": "asun-peppered-roasted-goat-meat-bites",
        "category_id": 5,
        "price": 4200,
        "offer_price": 3800,
        "desc": "Smoky flame-roasted goat meat cut into spicy bite-sized chunks and sauteed with hot habanero chili peppers and sliced white onions.",
        "sizes": {
            "Regular Portion": "4200",
            "Large Portion": "5800"
        }
    },
    "31": {
        "name": "Crispy Chicken Burger with Sweet Potato Fries",
        "slug": "crispy-chicken-burger-sweet-potato-fries",
        "category_id": 2,
        "price": 3800,
        "offer_price": 3500,
        "desc": "Crispy golden fried chicken breast patty topped with melted cheddar cheese, fresh lettuce, tomatoes, and signature spicy mayo on toasted brioche.",
        "sizes": {
            "Single Patty": "3800",
            "Double Patty Deluxe": "4900"
        }
    },
    "32": {
        "name": "Smoky Party Jollof Rice & Fried Chicken",
        "slug": "smoky-party-jollof-rice-fried-chicken",
        "category_id": 11,
        "price": 3800,
        "offer_price": 3500,
        "desc": "Authentic wood-smoked party Jollof rice prepared with rich tomato-pepper reduction, served with crispy seasoned fried chicken and sweet fried plantain.",
        "sizes": {
            "Regular": "3800",
            "Large": "4800",
            "Jumbo Party Pack": "6500"
        }
    },
    "33": {
        "name": "Special Nigerian Fried Rice with Prawns",
        "slug": "special-nigerian-fried-rice-prawns",
        "category_id": 11,
        "price": 4200,
        "offer_price": 3900,
        "desc": "Flavorful Basmati rice stir-fried with sweet corn, carrots, green peas, liver bits, and seasoned jumbo prawns.",
        "sizes": {
            "Regular": "4200",
            "Large": "5200",
            "Special": "6500"
        }
    },
    "34": {
        "name": "Ofada Rice with Spicy Ayamase Designer Stew",
        "slug": "ofada-rice-ayamase-designer-stew",
        "category_id": 11,
        "price": 4500,
        "offer_price": 4200,
        "desc": "Traditional unpolished Ofada rice served in broad leaves with rich bleached palm oil green-pepper Ayamase sauce, assorted meats, and boiled egg.",
        "sizes": {
            "Standard": "4500",
            "Mega Portion": "5800"
        }
    },
    "35": {
        "name": "Peppered Grilled Chicken Platter",
        "slug": "peppered-grilled-chicken-platter",
        "category_id": 9,
        "price": 3200,
        "offer_price": 2900,
        "desc": "Succulent quarter chicken grilled to perfection and tossed in spicy Nigerian Scotch bonnet habanero pepper sauce.",
        "sizes": {
            "Quarter Chicken": "3200",
            "Half Chicken": "5500"
        }
    },
    "36": {
        "name": "Assorted Small Chops Platter (12 Pcs)",
        "slug": "assorted-small-chops-platter",
        "category_id": 1,
        "price": 2800,
        "offer_price": 2500,
        "desc": "Crispy golden beef samosas, vegetable spring rolls, sweet plantain mosa, fluffy puff-puff, and tender peppered gizzard bites.",
        "sizes": {
            "Standard Box (12 pcs)": "2800",
            "Jumbo Party Pack (24 pcs)": "5200"
        }
    },
    "38": {
        "name": "Spicy Beef Suya Platter with Yaji Spice",
        "slug": "spicy-beef-suya-platter-yaji-spice",
        "category_id": 5,
        "price": 3000,
        "offer_price": 2700,
        "desc": "Thinly sliced tender beef skewered, grilled over open charcoal flames, dusted with authentic Northern Nigerian Kuli-kuli Yaji spice, and fresh onions.",
        "sizes": {
            "Regular Portion": "3000",
            "Double Portion": "5500"
        }
    },
    "40": {
        "name": "Village Native Rice with Smoked Fish & Ponmo",
        "slug": "village-native-rice-smoked-fish-ponmo",
        "category_id": 11,
        "price": 4000,
        "offer_price": 3600,
        "desc": "Palm oil infused local rice cooked with locust beans (Iru), dried crayfish, smoked catfish chunks, soft ponmo, and scent leaves.",
        "sizes": {
            "Regular": "4000",
            "Jumbo Bowl": "5400"
        }
    },
    "41": {
        "name": "Spicy Efo Riro with Assorted Meats & Semo",
        "slug": "spicy-efo-riro-assorted-meats-semo",
        "category_id": 10,
        "price": 4500,
        "offer_price": 4200,
        "desc": "Rich Yoruba spinach vegetable soup cooked with locust beans (Iru), crayfish, smoked panla fish, ponmo, and beef, served with warm Semovita.",
        "sizes": {
            "Single Wrap": "4500",
            "Double Meat": "5800"
        }
    },
    "42": {
        "name": "Pounded Yam with Bitterleaf Soup (Ofe Onugbu)",
        "slug": "pounded-yam-bitterleaf-soup-ofe-onugbu",
        "category_id": 10,
        "price": 4800,
        "offer_price": 4400,
        "desc": "Traditional Eastern Nigerian bitterleaf soup thickened with cocoyam, flavored with ogiri, dried fish, and tender beef chunks, served with pounded yam.",
        "sizes": {
            "Regular": "4800",
            "Special": "6000"
        }
    },
    "43": {
        "name": "Afang Soup with Stockfish, Beef & Pounded Yam",
        "slug": "afang-soup-stockfish-beef-pounded-yam",
        "category_id": 10,
        "price": 5000,
        "offer_price": 4600,
        "desc": "Calabar delicacy prepared with shredded wild Afang leaves, waterleaves, periwinkles, stockfish head, and tender beef.",
        "sizes": {
            "Regular": "4600",
            "Deluxe Seafood": "6500"
        }
    },
    "45": {
        "name": "Spicy Peppered Turkey Wings Platter",
        "slug": "spicy-peppered-turkey-wings-platter",
        "category_id": 9,
        "price": 4500,
        "offer_price": 4000,
        "desc": "Thick cut, succulent turkey wings seasoned, boiled in aromatics, fried, and glazed in fiery Scotch bonnet pepper sauce.",
        "sizes": {
            "2 Jumbo Wings": "4500",
            "4 Jumbo Wings": "7500"
        }
    },
    "46": {
        "name": "Peppered Snail & Plantain Combo",
        "slug": "peppered-snail-plantain-combo",
        "category_id": 6,
        "price": 5500,
        "offer_price": 5000,
        "desc": "Giant African land snails sauteed in hot pepper-onion sauce, served alongside golden sweet fried plantain slices.",
        "sizes": {
            "2 Giant Snails": "5000",
            "4 Giant Snails": "8500"
        }
    },
    "47": {
        "name": "Fresh Coconut Milk Cake Slice",
        "slug": "fresh-coconut-milk-cake-slice",
        "category_id": 8,
        "price": 2500,
        "offer_price": 2200,
        "desc": "Light and fluffy sponge cake infused with fresh coconut milk and topped with toasted coconut shavings.",
        "sizes": {
            "Single Slice": "2500",
            "Double Slice Box": "4500"
        }
    },
    "50": {
        "name": "Charcoal Grilled Chicken Drumsticks & Carrots",
        "slug": "charcoal-grilled-chicken-drumsticks",
        "category_id": 9,
        "price": 3200,
        "offer_price": 2800,
        "desc": "Juicy marinated chicken drumsticks flame-grilled with roasted carrots, bell peppers, and savory Nigerian spice rub.",
        "sizes": {
            "2 Drumsticks": "3200",
            "4 Drumsticks": "5200"
        }
    },
    "51": {
        "name": "Stir-Fried Nigerian Jollof Macaroni with Sausage",
        "slug": "stir-fried-jollof-macaroni-sausage",
        "category_id": 12,
        "price": 2800,
        "offer_price": 2500,
        "desc": "Elbow macaroni tossed in savory tomato-pepper sauce with sliced sausages, sweet corn, and aromatic herbs.",
        "sizes": {
            "Regular": "2800",
            "Large": "3800"
        }
    },
    "53": {
        "name": "Spicy Grilled Goat Meat Kebab (Asun Skewers)",
        "slug": "spicy-grilled-goat-meat-kebab",
        "category_id": 5,
        "price": 3800,
        "offer_price": 3500,
        "desc": "Skewered roasted goat meat interlayered with bell peppers and onions, basted in hot suya pepper glaze.",
        "sizes": {
            "3 Skewers": "3800",
            "6 Skewers": "6500"
        }
    },
    "54": {
        "name": "Decadent Dark Chocolate Brownie Square",
        "slug": "decadent-dark-chocolate-brownie-square",
        "category_id": 8,
        "price": 2000,
        "offer_price": 1800,
        "desc": "Rich, fudgy chocolate brownie square made with pure cocoa and melted chocolate chips.",
        "sizes": {
            "Single Square": "2000",
            "Box of 3": "5000"
        }
    },
    "55": {
        "name": "Crispy Stir-Fried Macaroni with Diced Sausage",
        "slug": "crispy-stir-fried-macaroni-diced-sausage",
        "category_id": 12,
        "price": 2800,
        "offer_price": 2500,
        "desc": "Crispy stir-fried macaroni tossed with juicy sausage, onions, and light spices for a savory, comforting bite.",
        "sizes": {
            "Regular": "2500",
            "Large": "3500"
        }
    },
    "57": {
        "name": "Flame-Grilled Quarter Chicken & Yaji Spice",
        "slug": "flame-grilled-quarter-chicken-yaji-spice",
        "category_id": 9,
        "price": 3200,
        "offer_price": 2800,
        "desc": "Quarter chicken seasoned with aromatic herbs, grilled over charcoal, and dusted with Northern Yaji pepper spice.",
        "sizes": {
            "Quarter Chicken": "3200",
            "Half Chicken": "5500"
        }
    },
    "58": {
        "name": "Crunchy Chin-Chin Party Jar (500g)",
        "slug": "crunchy-chin-chin-party-jar",
        "category_id": 1,
        "price": 2000,
        "offer_price": 1800,
        "desc": "Authentic Nigerian crunchy sweet fried pastry bites made with rich milk, butter, and fragrant nutmeg.",
        "sizes": {
            "Jar (500g)": "2000",
            "Mega Tub (1kg)": "3600"
        }
    },
    "59": {
        "name": "Oatmeal Raisin & Coconut Cookies (Box of 4)",
        "slug": "oatmeal-raisin-coconut-cookies",
        "category_id": 1,
        "price": 1800,
        "offer_price": 1500,
        "desc": "Freshly baked wholesome oatmeal cookies packed with plump raisins, toasted coconut flakes, and sweet honey.",
        "sizes": {
            "Box of 4": "1800",
            "Box of 8": "3200"
        }
    },
    "60": {
        "name": "Double Chocolate Fudge Cake Slice",
        "slug": "double-chocolate-fudge-cake-slice",
        "category_id": 8,
        "price": 2600,
        "offer_price": 2300,
        "desc": "Decadent moist chocolate sponge coated with rich dark chocolate ganache and chocolate chips.",
        "sizes": {
            "Single Slice": "2600",
            "Double Slice Box": "4800"
        }
    },
    "61": {
        "name": "Sweet Banana Bread Loaf Slice",
        "slug": "sweet-banana-bread-loaf-slice",
        "category_id": 1,
        "price": 1800,
        "offer_price": 1500,
        "desc": "Moist sweet bread made with ripe bananas, walnuts, and butter, lightly toasted with honey spread.",
        "sizes": {
            "2 Slices": "1800",
            "Full Loaf": "4500"
        }
    },
    "62": {
        "name": "Gourmet Chocolate Chip Muffin",
        "slug": "gourmet-chocolate-chip-muffin",
        "category_id": 1,
        "price": 1600,
        "offer_price": 1400,
        "desc": "Fluffy bakery-style muffin loaded with Belgian dark and milk chocolate morsels.",
        "sizes": {
            "Single Muffin": "1600",
            "Pack of 3": "4200"
        }
    },
    "63": {
        "name": "Rich Red Velvet Cake Slice",
        "slug": "rich-red-velvet-cake-slice",
        "category_id": 8,
        "price": 2500,
        "offer_price": 2200,
        "desc": "Moist red velvet sponge layered with smooth vanilla cream cheese frosting and white chocolate curls.",
        "sizes": {
            "Single Slice": "2500",
            "Double Slice Box": "4500"
        }
    },
    "64": {
        "name": "Indomie Relish Special with Eggs & Sausage",
        "slug": "indomie-relish-special-eggs-sausage",
        "category_id": 12,
        "price": 2500,
        "offer_price": 2200,
        "desc": "Wok-tossed Nigerian Indomie noodles with shredded carrots, bell peppers, double fried eggs, and sliced beef sausage.",
        "sizes": {
            "Hungry Man Size": "2500",
            "Super Pack Double": "3500"
        }
    },
    "66": {
        "name": "Spicy Peppered Gizzard Bowl",
        "slug": "spicy-peppered-gizzard-bowl",
        "category_id": 6,
        "price": 2800,
        "offer_price": 2500,
        "desc": "Tender, crunchy chicken gizzards deep fried and tossed in hot pepper sauce with diced bell peppers and onions.",
        "sizes": {
            "Regular": "2800",
            "Large": "4500"
        }
    },
    "67": {
        "name": "Vanilla Bean Cupcake Box (4 Pcs)",
        "slug": "vanilla-bean-cupcake-box",
        "category_id": 8,
        "price": 2400,
        "offer_price": 2000,
        "desc": "Fluffy Madagascar vanilla sponge cupcakes crowned with whipped buttercream swirls and colorful sprinkles.",
        "sizes": {
            "Box of 4": "2400",
            "Box of 8": "4400"
        }
    },
    "68": {
        "name": "Sweet Cinnamon Sugar Churro Bites",
        "slug": "sweet-cinnamon-sugar-churro-bites",
        "category_id": 4,
        "price": 1800,
        "offer_price": 1500,
        "desc": "Crispy golden pastry sticks rolled in fragrant cinnamon sugar, served with warm melted chocolate dip.",
        "sizes": {
            "Standard Box": "1800",
            "Party Box": "3200"
        }
    },
    "69": {
        "name": "Fresh Mango & Passion Fruit Smoothie (50cl)",
        "slug": "fresh-mango-passion-fruit-smoothie",
        "category_id": 7,
        "price": 2000,
        "offer_price": 1800,
        "desc": "Creamy refreshing blend of sweet local mangoes, passion fruit pulp, Greek yogurt, and crushed ice.",
        "sizes": {
            "Cup (50cl)": "2000",
            "Large Cup (75cl)": "2800"
        }
    },
    "72": {
        "name": "Peppered Goat Meat & Roasted Yam Platter",
        "slug": "peppered-goat-meat-roasted-yam-platter",
        "category_id": 5,
        "price": 4500,
        "offer_price": 4000,
        "desc": "Tender goat meat sautéed with hot habanero chili sauce, served with roasted white yam slices and spicy palm oil dip.",
        "sizes": {
            "Regular": "4500",
            "Deluxe": "6000"
        }
    },
    "73": {
        "name": "Singapore Style Stir-Fried Noodles with Chicken",
        "slug": "singapore-style-stir-fried-noodles-chicken",
        "category_id": 12,
        "price": 3200,
        "offer_price": 2800,
        "desc": "Thin egg noodles tossed with shredded chicken breast, bell peppers, carrots, spring onions, and light soy sauce.",
        "sizes": {
            "Regular": "2800",
            "Large": "3800",
            "Jumbo": "4800"
        }
    },
    "74": {
        "name": "Bole & Fish Special (Roasted Plantain & Grilled Fish)",
        "slug": "bole-fish-roasted-plantain-grilled-fish",
        "category_id": 6,
        "price": 3500,
        "offer_price": 3200,
        "desc": "Port Harcourt style charcoal-roasted sweet plantain (Bole) served with spiced grilled mackerel fish and pepper sauce.",
        "sizes": {
            "Single Bole & Fish": "3500",
            "Double Combo": "5500"
        }
    },
    "75": {
        "name": "Crispy Fried Chicken Wings & Sweet Dodo",
        "slug": "crispy-fried-chicken-wings-sweet-dodo",
        "category_id": 9,
        "price": 3200,
        "offer_price": 2800,
        "desc": "Golden crunchy chicken wings served alongside sweet golden fried ripe plantain slices and dip.",
        "sizes": {
            "4 Wings + Dodo": "3200",
            "8 Wings + Dodo": "5500"
        }
    },
    "76": {
        "name": "Fluffy Butter Pound Cake Slice",
        "slug": "fluffy-butter-pound-cake-slice",
        "category_id": 8,
        "price": 2200,
        "offer_price": 1900,
        "desc": "Rich and buttery traditional pound cake slice, baked golden brown with natural vanilla extract.",
        "sizes": {
            "Single Slice": "2200",
            "Pack of 3": "5500"
        }
    },
    "77": {
        "name": "Chocolate Glazed Doughnuts (Box of 3)",
        "slug": "chocolate-glazed-doughnuts-box-3",
        "category_id": 4,
        "price": 2000,
        "offer_price": 1800,
        "desc": "Soft yeast-raised artisan doughnuts coated in rich milk chocolate glaze and topped with toasted peanuts.",
        "sizes": {
            "Box of 3": "2000",
            "Box of 6": "3800"
        }
    },
    "184": {
        "name": "Chinese Wok Noodles with Shredded Chicken",
        "slug": "chinese-wok-noodles-shredded-chicken",
        "category_id": 12,
        "price": 3500,
        "offer_price": 3200,
        "desc": "Stir-fried Asian noodles with crunchy cabbage, bell peppers, shredded chicken breast, and sesame oil.",
        "sizes": {
            "Standard Box": "3500",
            "Large Box": "4800"
        }
    },
    "196": {
        "name": "Jollof Spaghetti with Meatballs & Dodo",
        "slug": "jollof-spaghetti-meatballs-dodo",
        "category_id": 12,
        "price": 3200,
        "offer_price": 2900,
        "desc": "Spicy Nigerian style Jollof spaghetti cooked in savory tomato reduction with seasoned beef meatballs and fried plantain.",
        "sizes": {
            "Regular": "3200",
            "Mega Bowl": "4500"
        }
    }
}
JSON;

        $dishes = json_decode($dishesJson, true);

        foreach ($dishes as $id => $data) {
            $productExists = DB::table('products')->where('id', $id)->exists();
            if ($productExists) {
                DB::table('products')->where('id', $id)->update([
                    'slug' => $data['slug'],
                    'category_id' => $data['category_id'],
                    'price' => $data['price'],
                    'offer_price' => $data['offer_price'],
                    'status' => 'enable',
                    'updated_at' => now(),
                ]);

                $sizeJson = json_encode($data['sizes'], JSON_UNESCAPED_UNICODE);

                DB::table('product_translations')->updateOrInsert(
                    ['product_id' => $id, 'lang_code' => 'en'],
                    [
                        'name' => $data['name'],
                        'short_description' => $data['desc'],
                        'size' => $sizeJson,
                        'updated_at' => now()
                    ]
                );

                DB::table('product_translations')->updateOrInsert(
                    ['product_id' => $id, 'lang_code' => 'bn'],
                    [
                        'name' => $data['name'],
                        'short_description' => $data['desc'],
                        'size' => $sizeJson,
                        'updated_at' => now()
                    ]
                );
            }
        }

        // Scale any unmapped product prices to realistic Naira prices (min ₦1,800)
        $lowPriced = DB::table('products')->where('price', '<', 500)->get();
        foreach ($lowPriced as $lp) {
            $newPrice = max(1800, (float)$lp->price * 100);
            $newOffer = $lp->offer_price > 0 ? max(1500, (float)$lp->offer_price * 100) : null;
            DB::table('products')->where('id', $lp->id)->update([
                'price' => $newPrice,
                'offer_price' => $newOffer,
                'status' => 'enable',
                'updated_at' => now()
            ]);
        }

        $this->info('Food products & Nigerian dishes localized with realistic Naira pricing.');
    }
}
