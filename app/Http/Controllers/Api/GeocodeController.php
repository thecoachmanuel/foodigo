<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;

class GeocodeController extends Controller
{
    /**
     * Curated local fallback dictionary for offline and lightning-fast Nigerian queries.
     */
    protected array $localHubs = [
        ['name' => 'Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4250, 'lng' => 3.9050, 'type' => 'area'],
        ['name' => 'Old Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4180, 'lng' => 3.9010, 'type' => 'area'],
        ['name' => 'New Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4320, 'lng' => 3.9120, 'type' => 'area'],
        ['name' => 'Awolowo Avenue, Old Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4208, 'lng' => 3.9015, 'type' => 'street'],
        ['name' => 'Oshuntokun Avenue, Old Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4275, 'lng' => 3.9068, 'type' => 'street'],
        ['name' => 'Aare Avenue, New Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4365, 'lng' => 3.9110, 'type' => 'street'],
        ['name' => 'Francis Okediji Street, Old Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4240, 'lng' => 3.9035, 'type' => 'street'],
        ['name' => 'Favos Junction, Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4280, 'lng' => 3.9060, 'type' => 'landmark'],
        ['name' => 'Bodija Shopping Complex, New Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4320, 'lng' => 3.9142, 'type' => 'landmark'],
        ['name' => 'Bodija Market, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4330, 'lng' => 3.9180, 'type' => 'landmark'],
        ['name' => 'Bodija Housing Estate, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4220, 'lng' => 3.9040, 'type' => 'estate'],
        ['name' => 'Secretariat Road, Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4172, 'lng' => 3.9095, 'type' => 'street'],
        ['name' => 'Kongi, Bodija, Ibadan', 'city' => 'Bodija', 'state' => 'Oyo', 'lat' => 7.4390, 'lng' => 3.9020, 'type' => 'area'],
        ['name' => 'Samonda, Ibadan', 'city' => 'Samonda', 'state' => 'Oyo', 'lat' => 7.4260, 'lng' => 3.8890, 'type' => 'area'],
        ['name' => 'Ventura Mall, Samonda, Ibadan', 'city' => 'Samonda', 'state' => 'Oyo', 'lat' => 7.4255, 'lng' => 3.8885, 'type' => 'landmark'],
        ['name' => 'University of Ibadan (UI Main Gate)', 'city' => 'UI', 'state' => 'Oyo', 'lat' => 7.4420, 'lng' => 3.9000, 'type' => 'landmark'],
        ['name' => 'Sango, Ibadan', 'city' => 'Sango', 'state' => 'Oyo', 'lat' => 7.4280, 'lng' => 3.8820, 'type' => 'area'],
        ['name' => 'Agodi GRA, Ibadan', 'city' => 'Agodi', 'state' => 'Oyo', 'lat' => 7.4120, 'lng' => 3.9140, 'type' => 'estate'],
        ['name' => 'Dugbe Commercial Hub, Ibadan', 'city' => 'Dugbe', 'state' => 'Oyo', 'lat' => 7.3880, 'lng' => 3.8810, 'type' => 'area'],
        ['name' => 'Ring Road, Ibadan', 'city' => 'Ring Road', 'state' => 'Oyo', 'lat' => 7.3620, 'lng' => 3.8720, 'type' => 'area'],
        ['name' => 'Challenge, Ibadan', 'city' => 'Challenge', 'state' => 'Oyo', 'lat' => 7.3480, 'lng' => 3.8820, 'type' => 'area'],
        ['name' => 'Akobo, Ibadan', 'city' => 'Akobo', 'state' => 'Oyo', 'lat' => 7.4480, 'lng' => 3.9420, 'type' => 'area'],
        ['name' => 'Jericho GRA, Ibadan', 'city' => 'Jericho', 'state' => 'Oyo', 'lat' => 7.3910, 'lng' => 3.8640, 'type' => 'estate'],
        ['name' => 'Ikeja, Lagos', 'city' => 'Ikeja', 'state' => 'Lagos', 'lat' => 6.6018, 'lng' => 3.3515, 'type' => 'city'],
        ['name' => 'Victoria Island (VI), Lagos', 'city' => 'Victoria Island', 'state' => 'Lagos', 'lat' => 6.4281, 'lng' => 3.4219, 'type' => 'city'],
        ['name' => 'Lekki Phase 1, Lagos', 'city' => 'Lekki', 'state' => 'Lagos', 'lat' => 6.4474, 'lng' => 3.4723, 'type' => 'area'],
        ['name' => 'Ikoyi, Lagos', 'city' => 'Ikoyi', 'state' => 'Lagos', 'lat' => 6.4549, 'lng' => 3.4346, 'type' => 'area'],
        ['name' => 'Wuse 2, Abuja', 'city' => 'Wuse', 'state' => 'FCT', 'lat' => 9.0797, 'lng' => 7.4723, 'type' => 'area'],
        ['name' => 'Maitama, Abuja', 'city' => 'Maitama', 'state' => 'FCT', 'lat' => 9.0882, 'lng' => 7.4934, 'type' => 'estate'],
    ];

    /**
     * Real-time search endpoint using local Nigerian database + Photon (OSM) API.
     */
    public function search(Request $request)
    {
        $query = trim($request->get('q', ''));
        if (strlen($query) < 1) {
            return response()->json([]);
        }

        $cacheKey = 'geocode_search_' . md5(strtolower($query));
        $results = Cache::remember($cacheKey, 86400, function () use ($query) {
            // 1. Instant local matches
            $localMatches = $this->searchLocal($query);

            // 2. Query online if few local matches
            $onlineResults = [];
            if (count($localMatches) < 5) {
                try {
                    $response = Http::connectTimeout(0.8)->timeout(1.0)
                        ->withHeaders(['User-Agent' => 'FoodigoDelivery/1.0'])
                        ->get('https://photon.komoot.io/api/', [
                            'q' => $query,
                            'countrycodes' => 'NG',
                            'limit' => 6,
                        ]);

                    if ($response->successful()) {
                        $data = $response->json();
                        if (!empty($data['features'])) {
                            foreach ($data['features'] as $f) {
                                $props = $f['properties'] ?? [];
                                $coords = $f['geometry']['coordinates'] ?? [0, 0];
                                
                                $nameParts = array_filter([
                                    $props['name'] ?? null,
                                    $props['street'] ?? null,
                                    $props['district'] ?? null,
                                    $props['city'] ?? null,
                                    $props['state'] ?? null,
                                ]);
                                $unique = array_unique($nameParts);
                                $formattedName = implode(', ', $unique);

                                if (!empty($formattedName)) {
                                    $onlineResults[] = [
                                        'name' => $formattedName,
                                        'city' => $props['city'] ?? ($props['district'] ?? 'Nigeria'),
                                        'state' => $props['state'] ?? 'Nigeria',
                                        'lat' => (float)$coords[1],
                                        'lng' => (float)$coords[0],
                                        'type' => $props['osm_value'] ?? 'street',
                                    ];
                                }
                            }
                        }
                    }
                } catch (\Throwable $e) {
                    // Network unavailable or timed out, local matches will serve
                }
            }

            // 3. Merge results with local priority
            $merged = [];
            $seen = [];

            foreach (array_merge($localMatches, $onlineResults) as $item) {
                $key = round($item['lat'], 3) . '_' . round($item['lng'], 3);
                if (!isset($seen[$key])) {
                    $seen[$key] = true;
                    $merged[] = $item;
                }
            }

            return array_slice($merged, 0, 10);
        });

        return response()->json(array_values($results));
    }

    /**
     * Real-time Reverse Geocode endpoint (lat, lng -> readable address).
     */
    public function reverse(Request $request)
    {
        $lat = (float)$request->get('lat', 0);
        $lng = (float)$request->get('lng', 0);

        if ($lat == 0 || $lng == 0) {
            return response()->json([
                'status' => false,
                'address' => 'Bodija, Ibadan, Oyo State',
                'lat' => 7.4250,
                'lng' => 3.9050,
            ]);
        }

        // Fast match against local hubs if within 2km
        $closeLocal = $this->findClosestLocal($lat, $lng);
        if ($closeLocal && $closeLocal['dist'] < 2.0) {
            return response()->json([
                'status' => true,
                'address' => $closeLocal['name'],
                'lat' => $lat,
                'lng' => $lng,
            ]);
        }

        $cacheKey = 'geocode_rev_' . round($lat, 4) . '_' . round($lng, 4);
        $address = Cache::remember($cacheKey, 86400, function () use ($lat, $lng, $closeLocal) {
            try {
                $response = Http::connectTimeout(0.8)->timeout(1.0)
                    ->withHeaders(['User-Agent' => 'FoodigoDelivery/1.0'])
                    ->get('https://nominatim.openstreetmap.org/reverse', [
                        'format' => 'json',
                        'lat' => $lat,
                        'lon' => $lng,
                        'zoom' => 18,
                        'addressdetails' => 1,
                    ]);

                if ($response->successful()) {
                    $data = $response->json();
                    $addr = $data['address'] ?? [];

                    $parts = array_filter([
                        $addr['road'] ?? ($addr['neighbourhood'] ?? ($addr['suburb'] ?? null)),
                        $addr['suburb'] ?? ($addr['city_district'] ?? null),
                        $addr['city'] ?? ($addr['town'] ?? ($addr['county'] ?? null)),
                        $addr['state'] ?? 'Nigeria',
                    ]);

                    $clean = implode(', ', array_unique($parts));
                    if (!empty($clean)) {
                        return $clean;
                    }
                    if (!empty($data['display_name'])) {
                        return $data['display_name'];
                    }
                }
            } catch (\Throwable $e) {}

            return $closeLocal ? $closeLocal['name'] : 'Bodija, Ibadan, Oyo State';
        });

        return response()->json([
            'status' => true,
            'address' => $address,
            'lat' => $lat,
            'lng' => $lng,
        ]);
    }

    /**
     * Silent location setter saving user address and coordinates to session.
     */
    public function silentSetLocation(Request $request)
    {
        $address = trim($request->get('address', ''));
        $lat = (float)$request->get('latitude', 0);
        $lng = (float)$request->get('longitude', 0);

        if (empty($address) && ($lat != 0 && $lng != 0)) {
            $rev = $this->reverse($request);
            $data = $rev->getData(true);
            $address = $data['address'] ?? 'Bodija, Ibadan, Oyo State';
        }

        if (empty($address)) {
            $address = 'Bodija, Ibadan, Oyo State';
            $lat = 7.4250;
            $lng = 3.9050;
        }

        Session::put('address', $address);
        Session::put('latitude', $lat);
        Session::put('longitude', $lng);

        return response()->json([
            'status' => true,
            'message' => 'Location updated successfully',
            'address' => $address,
            'latitude' => $lat,
            'longitude' => $lng,
        ]);
    }

    /**
     * Search local hubs matching all query terms.
     */
    protected function searchLocal(string $query): array
    {
        $clean = strtolower(trim($query));
        $terms = array_filter(explode(' ', $clean));

        return array_values(array_filter($this->localHubs, function ($hub) use ($terms) {
            $haystack = strtolower($hub['name'] . ' ' . $hub['city'] . ' ' . $hub['state']);
            foreach ($terms as $term) {
                if (!str_contains($haystack, $term)) {
                    return false;
                }
            }
            return true;
        }));
    }

    /**
     * Find closest local hub by Haversine distance.
     */
    protected function findClosestLocal(float $lat, float $lng): ?array
    {
        $best = null;
        $minDist = PHP_FLOAT_MAX;

        foreach ($this->localHubs as $hub) {
            $dLat = deg2rad($hub['lat'] - $lat);
            $dLng = deg2rad($hub['lng'] - $lng);
            $a = sin($dLat/2) * sin($dLat/2) + cos(deg2rad($lat)) * cos(deg2rad($hub['lat'])) * sin($dLng/2) * sin($dLng/2);
            $c = 2 * atan2(sqrt($a), sqrt(1-$a));
            $d = 6371 * $c;

            if ($d < $minDist) {
                $minDist = $d;
                $best = $hub;
                $best['dist'] = $d;
            }
        }

        return $minDist < 50 ? $best : null;
    }
}
