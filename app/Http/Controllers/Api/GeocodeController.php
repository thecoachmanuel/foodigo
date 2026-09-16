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
     * Real-time search endpoint using live OpenStreetMap Nominatim API.
     */
    public function search(Request $request)
    {
        $query = trim($request->get('q', ''));
        if (strlen($query) < 1) {
            return response()->json([]);
        }

        $cacheKey = 'geocode_osm_live_' . md5(strtolower($query));
        $results = Cache::remember($cacheKey, 86400, function () use ($query) {
            $onlineResults = [];

            // Query OpenStreetMap Nominatim Live Engine
            try {
                $response = Http::connectTimeout(3.0)->timeout(5.0)
                    ->withHeaders(['User-Agent' => 'FoodigoDeliveryApp/1.0 (contact@foodigo.ng)'])
                    ->get('https://nominatim.openstreetmap.org/search', [
                        'format' => 'json',
                        'q' => $query,
                        'countrycodes' => 'ng',
                        'addressdetails' => 1,
                        'limit' => 8,
                    ]);

                if ($response->successful()) {
                    $data = $response->json();
                    if (is_array($data) && count($data) > 0) {
                        foreach ($data as $item) {
                            $addr = $item['address'] ?? [];
                            $name = $item['name'] ?? '';
                            $road = $addr['road'] ?? ($addr['neighbourhood'] ?? ($addr['suburb'] ?? ''));
                            $city = $addr['city'] ?? ($addr['town'] ?? ($addr['county'] ?? ($addr['city_district'] ?? '')));
                            $state = $addr['state'] ?? 'Nigeria';

                            $nameParts = array_filter([$name, $road, $city, $state]);
                            $unique = array_unique($nameParts);
                            $formattedName = !empty($unique) ? implode(', ', $unique) : ($item['display_name'] ?? 'Nigeria');

                            $onlineResults[] = [
                                'name' => $formattedName,
                                'display_name' => $item['display_name'] ?? $formattedName,
                                'city' => $city ?: $state,
                                'state' => $state,
                                'lat' => (float)$item['lat'],
                                'lng' => (float)$item['lon'],
                                'type' => $item['type'] ?? 'osm',
                            ];
                        }
                    }
                }
            } catch (\Throwable $e) {
                Log::warning('OSM Nominatim search error: ' . $e->getMessage());
            }

            return $onlineResults;
        });

        return response()->json(array_values($results));
    }

    /**
     * Real-time Reverse Geocode endpoint (lat, lng -> readable address via OSM Nominatim).
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

        $cacheKey = 'geocode_rev_live_' . round($lat, 5) . '_' . round($lng, 5);
        $address = Cache::remember($cacheKey, 86400, function () use ($lat, $lng) {
            try {
                $response = Http::connectTimeout(3.0)->timeout(5.0)
                    ->withHeaders(['User-Agent' => 'FoodigoDeliveryApp/1.0 (contact@foodigo.ng)'])
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

                    $primary = $addr['amenity'] ?? ($addr['building'] ?? ($addr['shop'] ?? null));
                    $road = $addr['road'] ?? ($addr['pedestrian'] ?? ($addr['neighbourhood'] ?? ($addr['suburb'] ?? null)));
                    $suburb = $addr['suburb'] ?? ($addr['city_district'] ?? null);
                    $city = $addr['city'] ?? ($addr['town'] ?? ($addr['county'] ?? null));
                    $state = $addr['state'] ?? 'Nigeria';

                    $parts = array_filter([$primary, $road, $suburb, $city, $state]);
                    $unique = array_unique($parts);

                    if (!empty($unique)) {
                        return implode(', ', $unique);
                    }

                    if (!empty($data['display_name'])) {
                        $rawParts = array_slice(explode(', ', $data['display_name']), 0, 4);
                        return implode(', ', $rawParts);
                    }
                }
            } catch (\Throwable $e) {
                Log::warning('OSM Nominatim reverse error: ' . $e->getMessage());
            }

            return 'Bodija, Ibadan, Oyo State';
        });

        return response()->json([
            'status' => true,
            'address' => $address,
            'lat' => $lat,
            'lng' => $lng,
        ]);
    }

    /**
     * Silent location setter for background GPS detection without popups.
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
}
