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
     * Real-time search endpoint using multi-source Live Geocoding Engine (Photon Komoot + OSM Nominatim).
     * Robustly resolves local landmarks, university halls, estates, streets, and POIs across Nigeria.
     */
    public function search(Request $request)
    {
        $rawQuery = trim($request->get('q', ''));
        if (strlen($rawQuery) < 1) {
            return response()->json([]);
        }

        $userLat = (float)$request->get('lat', 7.4400);
        $userLng = (float)$request->get('lng', 3.9000);
        if ($userLat == 0 || $userLng == 0) {
            $userLat = 7.4400;
            $userLng = 3.9000;
        }

        $cacheKey = 'geocode_live_v2_' . md5(strtolower($rawQuery) . '_' . round($userLat, 2) . '_' . round($userLng, 2));

        $results = Cache::remember($cacheKey, 86400, function () use ($rawQuery, $userLat, $userLng) {
            $combined = [];
            $seenCoords = [];

            // 1. Sanitize query: strip conversational prepositions/fillers that break strict OSM matching
            $cleanQuery = preg_replace('/\b(inside|within|near|beside|opposite|opp|around|close to|next to|along|behind|by|at|in|hall of residence|faculty of)\b/i', ' ', $rawQuery);
            $cleanQuery = preg_replace('/[,\-\/]+/', ' ', $cleanQuery);
            $cleanQuery = preg_replace('/\s+/', ' ', trim($cleanQuery));

            if (empty($cleanQuery)) {
                $cleanQuery = $rawQuery;
            }

            // Engine 1: Komoot Photon API (exceptional for POIs, university hostels, campus buildings, landmarks)
            try {
                $photonUrl = 'https://photon.komoot.io/api/';
                $photonParams = [
                    'q' => $cleanQuery,
                    'lat' => $userLat,
                    'lon' => $userLng,
                    'limit' => 8,
                ];

                $photonRes = Http::connectTimeout(2.5)->timeout(4.0)
                    ->withHeaders(['User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) FoodigoApp/2.0'])
                    ->get($photonUrl, $photonParams);

                if ($photonRes->successful()) {
                    $photonData = $photonRes->json();
                    $features = $photonData['features'] ?? [];

                    foreach ($features as $feat) {
                        $p = $feat['properties'] ?? [];
                        $coords = $feat['geometry']['coordinates'] ?? [0, 0];
                        $lng = (float)($coords[0] ?? 0);
                        $lat = (float)($coords[1] ?? 0);

                        if ($lat == 0 || $lng == 0) continue;

                        $country = $p['country'] ?? '';
                        $countryCode = strtolower($p['countrycode'] ?? '');

                        // Filter to Nigeria or nearby coordinates (lat: 4 - 14, lng: 2.5 - 15)
                        $isNigeria = ($countryCode === 'ng' || str_contains(strtolower($country), 'nigeria') || ($lat >= 4.0 && $lat <= 14.0 && $lng >= 2.5 && $lng <= 15.0));
                        if (!$isNigeria) continue;

                        $name = $p['name'] ?? ($p['street'] ?? '');
                        $street = $p['street'] ?? '';
                        $district = $p['district'] ?? ($p['locality'] ?? '');
                        $city = $p['city'] ?? ($p['county'] ?? '');
                        $state = $p['state'] ?? 'Oyo';

                        $parts = array_filter([$name, $street, $district, $city, $state]);
                        $uniqueParts = array_unique($parts);
                        $formattedName = !empty($uniqueParts) ? implode(', ', $uniqueParts) : $name;

                        // Coordinate deduplication key (within ~50 meters)
                        $coordKey = round($lat, 3) . '_' . round($lng, 3);
                        if (!isset($seenCoords[$coordKey])) {
                            $seenCoords[$coordKey] = true;
                            $combined[] = [
                                'name' => $formattedName,
                                'display_name' => $formattedName,
                                'city' => $city ?: ($district ?: $state),
                                'state' => $state,
                                'lat' => $lat,
                                'lng' => $lng,
                                'type' => $p['osm_key'] ?? ($p['type'] ?? 'landmark'),
                            ];
                        }
                    }
                }
            } catch (\Throwable $e) {
                Log::info('Photon search notice: ' . $e->getMessage());
            }

            // Engine 2: OpenStreetMap Nominatim API (Structured administrative search)
            try {
                $nomRes = Http::connectTimeout(2.5)->timeout(4.0)
                    ->withHeaders(['User-Agent' => 'FoodigoDeliveryApp/2.0 (contact@foodigo.ng)'])
                    ->get('https://nominatim.openstreetmap.org/search', [
                        'format' => 'json',
                        'q' => $cleanQuery,
                        'countrycodes' => 'ng',
                        'addressdetails' => 1,
                        'limit' => 8,
                    ]);

                if ($nomRes->successful()) {
                    $nomData = $nomRes->json();
                    if (is_array($nomData) && count($nomData) > 0) {
                        foreach ($nomData as $item) {
                            $lat = (float)($item['lat'] ?? 0);
                            $lng = (float)($item['lon'] ?? 0);
                            if ($lat == 0 || $lng == 0) continue;

                            $coordKey = round($lat, 3) . '_' . round($lng, 3);
                            if (isset($seenCoords[$coordKey])) continue;
                            $seenCoords[$coordKey] = true;

                            $addr = $item['address'] ?? [];
                            $name = $item['name'] ?? '';
                            $road = $addr['road'] ?? ($addr['neighbourhood'] ?? ($addr['suburb'] ?? ''));
                            $city = $addr['city'] ?? ($addr['town'] ?? ($addr['county'] ?? ($addr['city_district'] ?? '')));
                            $state = $addr['state'] ?? 'Nigeria';

                            $nameParts = array_filter([$name, $road, $city, $state]);
                            $unique = array_unique($nameParts);
                            $formattedName = !empty($unique) ? implode(', ', $unique) : ($item['display_name'] ?? 'Nigeria');

                            $combined[] = [
                                'name' => $formattedName,
                                'display_name' => $item['display_name'] ?? $formattedName,
                                'city' => $city ?: $state,
                                'state' => $state,
                                'lat' => $lat,
                                'lng' => $lng,
                                'type' => $item['type'] ?? 'osm',
                            ];
                        }
                    }
                }
            } catch (\Throwable $e) {
                Log::info('Nominatim search notice: ' . $e->getMessage());
            }

            return array_slice($combined, 0, 10);
        });

        return response()->json(array_values($results));
    }

    /**
     * Real-time Reverse Geocode endpoint (lat, lng -> readable landmark/street address).
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

        $cacheKey = 'geocode_rev_live_v2_' . round($lat, 5) . '_' . round($lng, 5);
        $address = Cache::remember($cacheKey, 86400, function () use ($lat, $lng) {
            try {
                $response = Http::connectTimeout(2.5)->timeout(4.0)
                    ->withHeaders(['User-Agent' => 'FoodigoDeliveryApp/2.0 (contact@foodigo.ng)'])
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

                    $primary = $addr['amenity'] ?? ($addr['building'] ?? ($addr['shop'] ?? ($addr['tourism'] ?? null)));
                    $road = $addr['road'] ?? ($addr['pedestrian'] ?? ($addr['neighbourhood'] ?? ($addr['suburb'] ?? null)));
                    $suburb = $addr['suburb'] ?? ($addr['city_district'] ?? ($addr['neighbourhood'] ?? null));
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
                Log::info('OSM reverse notice: ' . $e->getMessage());
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

