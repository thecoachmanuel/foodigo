/**
 * Nigerian Address Autocomplete & Geocoding Engine
 * 100% Free, Unlimited Multi-User Checkout Support
 * Deep Local Intelligence for Lagos, Ibadan, Abuja, Port Harcourt, and Nigeria Nationwide
 */
(function (window, document) {
    'use strict';

    // Curated Comprehensive Offline Dictionary of Nigerian Hubs, Areas, Estates & Landmarks
    const NIGERIAN_LOCATIONS = [
        // ==================== LAGOS STATE ====================
        // Ikeja & Environs
        { name: 'Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.6018, lng: 3.3515, type: 'city' },
        { name: 'Ikeja GRA', city: 'Ikeja', state: 'Lagos', lat: 6.5898, lng: 3.3572, type: 'estate' },
        { name: 'Allen Avenue, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.6006, lng: 3.3548, type: 'street' },
        { name: 'Toyin Street, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.5956, lng: 3.3544, type: 'street' },
        { name: 'Opebi, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.5925, lng: 3.3625, type: 'area' },
        { name: 'Alausa Secretariat, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.6194, lng: 3.3582, type: 'landmark' },
        { name: 'Ikeja City Mall (ICM), Alausa', city: 'Ikeja', state: 'Lagos', lat: 6.6186, lng: 3.3600, type: 'landmark' },
        { name: 'Computer Village, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.5950, lng: 3.3420, type: 'landmark' },
        { name: 'Oba Akran Avenue, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.6033, lng: 3.3361, type: 'street' },
        { name: 'Ikeja Along, Ikeja', city: 'Ikeja', state: 'Lagos', lat: 6.5960, lng: 3.3385, type: 'landmark' },
        { name: 'Maryland, Lagos', city: 'Maryland', state: 'Lagos', lat: 6.5744, lng: 3.3678, type: 'area' },
        { name: 'Maryland Mall, Maryland', city: 'Maryland', state: 'Lagos', lat: 6.5732, lng: 3.3672, type: 'landmark' },
        { name: 'Anthony Village, Lagos', city: 'Anthony', state: 'Lagos', lat: 6.5614, lng: 3.3705, type: 'area' },
        { name: 'Mende, Maryland', city: 'Maryland', state: 'Lagos', lat: 6.5780, lng: 3.3715, type: 'area' },

        // Lekki, Victoria Island, Ikoyi & Island Environs
        { name: 'Victoria Island (VI)', city: 'Victoria Island', state: 'Lagos', lat: 6.4281, lng: 3.4219, type: 'city' },
        { name: 'Adeola Odeku Street, Victoria Island', city: 'Victoria Island', state: 'Lagos', lat: 6.4300, lng: 3.4180, type: 'street' },
        { name: 'Akin Adesola Street, Victoria Island', city: 'Victoria Island', state: 'Lagos', lat: 6.4330, lng: 3.4230, type: 'street' },
        { name: 'Ozumba Mbadiwe Avenue, Victoria Island', city: 'Victoria Island', state: 'Lagos', lat: 6.4360, lng: 3.4140, type: 'street' },
        { name: 'Bishop Oluwole, Victoria Island', city: 'Victoria Island', state: 'Lagos', lat: 6.4315, lng: 3.4245, type: 'street' },
        { name: 'Eko Hotels & Suites, Victoria Island', city: 'Victoria Island', state: 'Lagos', lat: 6.4265, lng: 3.4350, type: 'landmark' },
        { name: 'Ikoyi, Lagos', city: 'Ikoyi', state: 'Lagos', lat: 6.4549, lng: 3.4346, type: 'area' },
        { name: 'Banana Island, Ikoyi', city: 'Ikoyi', state: 'Lagos', lat: 6.4678, lng: 3.4565, type: 'estate' },
        { name: 'Parkview Estate, Ikoyi', city: 'Ikoyi', state: 'Lagos', lat: 6.4520, lng: 3.4470, type: 'estate' },
        { name: 'Bourdillon Road, Ikoyi', city: 'Ikoyi', state: 'Lagos', lat: 6.4490, lng: 3.4390, type: 'street' },
        { name: 'Osborne Foreshore Estate, Ikoyi', city: 'Ikoyi', state: 'Lagos', lat: 6.4610, lng: 3.4280, type: 'estate' },
        { name: 'Dolphin Estate, Ikoyi', city: 'Ikoyi', state: 'Lagos', lat: 6.4560, lng: 3.4180, type: 'estate' },
        { name: 'Lekki Phase 1', city: 'Lekki', state: 'Lagos', lat: 6.4474, lng: 3.4723, type: 'area' },
        { name: 'Admiralty Way, Lekki Phase 1', city: 'Lekki', state: 'Lagos', lat: 6.4502, lng: 3.4680, type: 'street' },
        { name: 'Lekki - Epe Expressway', city: 'Lekki', state: 'Lagos', lat: 6.4400, lng: 3.5100, type: 'street' },
        { name: 'Ikate Elegushi, Lekki', city: 'Lekki', state: 'Lagos', lat: 6.4410, lng: 3.4980, type: 'area' },
        { name: 'Osapa London, Lekki', city: 'Lekki', state: 'Lagos', lat: 6.4380, lng: 3.5150, type: 'area' },
        { name: 'Agungi, Lekki', city: 'Lekki', state: 'Lagos', lat: 6.4360, lng: 3.5250, type: 'area' },
        { name: 'Chevron Drive, Lekki', city: 'Lekki', state: 'Lagos', lat: 6.4350, lng: 3.5400, type: 'area' },
        { name: 'VGC (Victoria Garden City), Lekki', city: 'Lekki', state: 'Lagos', lat: 6.4330, lng: 3.5650, type: 'estate' },
        { name: 'Ikota Villa Estate, Lekki', city: 'Lekki', state: 'Lagos', lat: 6.4340, lng: 3.5500, type: 'estate' },
        { name: 'Ajah, Lagos', city: 'Ajah', state: 'Lagos', lat: 6.4698, lng: 3.5852, type: 'area' },
        { name: 'Badore, Ajah', city: 'Ajah', state: 'Lagos', lat: 6.4850, lng: 3.6050, type: 'area' },
        { name: 'Sangotedo, Ajah', city: 'Sangotedo', state: 'Lagos', lat: 6.4710, lng: 3.6300, type: 'area' },
        { name: 'Novare Mall (Shoprite Sangotedo)', city: 'Sangotedo', state: 'Lagos', lat: 6.4725, lng: 3.6320, type: 'landmark' },
        { name: 'Abraham Adesanya Estate, Ajah', city: 'Ajah', state: 'Lagos', lat: 6.4630, lng: 3.5950, type: 'estate' },
        { name: 'Abijo GRA, Ibeju Lekki', city: 'Ibeju Lekki', state: 'Lagos', lat: 6.4750, lng: 3.6650, type: 'area' },
        { name: 'Awoyaya, Ibeju Lekki', city: 'Ibeju Lekki', state: 'Lagos', lat: 6.4790, lng: 3.7100, type: 'area' },
        { name: 'Lakowe Lakes, Ibeju Lekki', city: 'Ibeju Lekki', state: 'Lagos', lat: 6.4810, lng: 3.7450, type: 'area' },
        { name: 'Lagos Island, Broad Street / CMS', city: 'Lagos Island', state: 'Lagos', lat: 6.4541, lng: 3.3947, type: 'area' },
        { name: 'Marina, Lagos Island', city: 'Lagos Island', state: 'Lagos', lat: 6.4490, lng: 3.3900, type: 'area' },

        // Yaba, Surulere & Mainland
        { name: 'Yaba, Lagos', city: 'Yaba', state: 'Lagos', lat: 6.5095, lng: 3.3711, type: 'area' },
        { name: 'Sabo Yaba, Lagos', city: 'Yaba', state: 'Lagos', lat: 6.5140, lng: 3.3760, type: 'area' },
        { name: 'Tejuosho Market, Yaba', city: 'Yaba', state: 'Lagos', lat: 6.5030, lng: 3.3650, type: 'landmark' },
        { name: 'Akoka (UNILAG Gate), Yaba', city: 'Yaba', state: 'Lagos', lat: 6.5180, lng: 3.3910, type: 'landmark' },
        { name: 'University of Lagos (UNILAG), Akoka', city: 'Yaba', state: 'Lagos', lat: 6.5160, lng: 3.3990, type: 'landmark' },
        { name: 'Alagomeji, Yaba', city: 'Yaba', state: 'Lagos', lat: 6.5000, lng: 3.3780, type: 'area' },
        { name: 'Ebute Metta, Lagos', city: 'Ebute Metta', state: 'Lagos', lat: 6.4850, lng: 3.3790, type: 'area' },
        { name: 'Surulere, Lagos', city: 'Surulere', state: 'Lagos', lat: 6.4969, lng: 3.3515, type: 'city' },
        { name: 'Bode Thomas Street, Surulere', city: 'Surulere', state: 'Lagos', lat: 6.4950, lng: 3.3560, type: 'street' },
        { name: 'Adeniran Ogunsanya, Surulere', city: 'Surulere', state: 'Lagos', lat: 6.4980, lng: 3.3540, type: 'street' },
        { name: 'Adeniran Ogunsanya Mall (Leisure Mall)', city: 'Surulere', state: 'Lagos', lat: 6.4975, lng: 3.3545, type: 'landmark' },
        { name: 'Ogunlana Drive, Surulere', city: 'Surulere', state: 'Lagos', lat: 6.5040, lng: 3.3520, type: 'street' },
        { name: 'National Stadium, Surulere', city: 'Surulere', state: 'Lagos', lat: 6.4980, lng: 3.3660, type: 'landmark' },
        { name: 'Ojuelegba, Surulere', city: 'Surulere', state: 'Lagos', lat: 6.5140, lng: 3.3610, type: 'landmark' },

        // Gbagada, Ogudu, Magodo, Omole, Ogba, Berger
        { name: 'Gbagada Phase 1, Lagos', city: 'Gbagada', state: 'Lagos', lat: 6.5540, lng: 3.3870, type: 'estate' },
        { name: 'Gbagada Phase 2, Lagos', city: 'Gbagada', state: 'Lagos', lat: 6.5620, lng: 3.3920, type: 'estate' },
        { name: 'Ifako, Gbagada', city: 'Gbagada', state: 'Lagos', lat: 6.5580, lng: 3.3980, type: 'area' },
        { name: 'Ogudu GRA, Lagos', city: 'Ogudu', state: 'Lagos', lat: 6.5760, lng: 3.3890, type: 'estate' },
        { name: 'Magodo Phase 1 (Isheri), Lagos', city: 'Magodo', state: 'Lagos', lat: 6.6340, lng: 3.3880, type: 'estate' },
        { name: 'Magodo Phase 2 (Shangisha), Lagos', city: 'Magodo', state: 'Lagos', lat: 6.6180, lng: 3.3760, type: 'estate' },
        { name: 'Omole Phase 1, Ikeja', city: 'Omole', state: 'Lagos', lat: 6.6260, lng: 3.3620, type: 'estate' },
        { name: 'Omole Phase 2, Isheri', city: 'Omole', state: 'Lagos', lat: 6.6380, lng: 3.3720, type: 'estate' },
        { name: 'Ogba, Lagos', city: 'Ogba', state: 'Lagos', lat: 6.6290, lng: 3.3440, type: 'area' },
        { name: 'Berger / Ojodu Berger, Lagos', city: 'Berger', state: 'Lagos', lat: 6.6430, lng: 3.3680, type: 'area' },
        { name: 'Ojota, Lagos', city: 'Ojota', state: 'Lagos', lat: 6.5820, lng: 3.3820, type: 'area' },
        { name: 'Ketu, Lagos', city: 'Ketu', state: 'Lagos', lat: 6.5980, lng: 3.3890, type: 'area' },
        { name: 'Mile 12, Lagos', city: 'Mile 12', state: 'Lagos', lat: 6.6120, lng: 3.3970, type: 'area' },

        // Festac, Amuwo Odofin, Okota, Ago Palace
        { name: 'Festac Town, Lagos', city: 'Festac', state: 'Lagos', lat: 6.4670, lng: 3.2840, type: 'city' },
        { name: '2nd Avenue, Festac Town', city: 'Festac', state: 'Lagos', lat: 6.4680, lng: 3.2880, type: 'street' },
        { name: '4th Avenue, Festac Town', city: 'Festac', state: 'Lagos', lat: 6.4720, lng: 3.2810, type: 'street' },
        { name: 'Amuwo Odofin, Lagos', city: 'Amuwo Odofin', state: 'Lagos', lat: 6.4640, lng: 3.3120, type: 'area' },
        { name: 'Apple Junction, Amuwo Odofin', city: 'Amuwo Odofin', state: 'Lagos', lat: 6.4710, lng: 3.3150, type: 'landmark' },
        { name: 'Ago Palace Way, Okota', city: 'Okota', state: 'Lagos', lat: 6.4950, lng: 3.3180, type: 'street' },
        { name: 'Okota, Lagos', city: 'Okota', state: 'Lagos', lat: 6.4980, lng: 3.3250, type: 'area' },
        { name: 'Mile 2, Lagos', city: 'Mile 2', state: 'Lagos', lat: 6.4650, lng: 3.3230, type: 'landmark' },

        // Alimosho, Agege, Egbeda, Ikotun, Ipaja
        { name: 'Agege, Lagos', city: 'Agege', state: 'Lagos', lat: 6.6180, lng: 3.3230, type: 'area' },
        { name: 'Pen Cinema, Agege', city: 'Agege', state: 'Lagos', lat: 6.6230, lng: 3.3280, type: 'landmark' },
        { name: 'Iyana Ipaja, Lagos', city: 'Iyana Ipaja', state: 'Lagos', lat: 6.6120, lng: 3.2860, type: 'area' },
        { name: 'Egbeda, Lagos', city: 'Egbeda', state: 'Lagos', lat: 6.5970, lng: 3.2920, type: 'area' },
        { name: 'Akowonjo, Lagos', city: 'Akowonjo', state: 'Lagos', lat: 6.6020, lng: 3.3080, type: 'area' },
        { name: 'Ikotun, Lagos', city: 'Ikotun', state: 'Lagos', lat: 6.5510, lng: 3.2660, type: 'area' },
        { name: 'Igando, Lagos', city: 'Igando', state: 'Lagos', lat: 6.5640, lng: 3.2420, type: 'area' },
        { name: 'Gowon Estate, Egbeda', city: 'Egbeda', state: 'Lagos', lat: 6.6050, lng: 3.2800, type: 'estate' },
        { name: 'Abule Egba, Lagos', city: 'Abule Egba', state: 'Lagos', lat: 6.6490, lng: 3.2990, type: 'area' },
        { name: 'Ikorodu, Lagos', city: 'Ikorodu', state: 'Lagos', lat: 6.6194, lng: 3.5105, type: 'city' },

        // ==================== IBADAN / OYO STATE ====================
        { name: 'Ibadan Central', city: 'Ibadan', state: 'Oyo', lat: 7.3775, lng: 3.9470, type: 'city' },
        
        // Bodija
        { name: 'Bodija, Ibadan', city: 'Bodija', state: 'Oyo', lat: 7.4250, lng: 3.9050, type: 'area' },
        { name: 'Old Bodija, Ibadan', city: 'Bodija', state: 'Oyo', lat: 7.4180, lng: 3.9010, type: 'area' },
        { name: 'New Bodija, Ibadan', city: 'Bodija', state: 'Oyo', lat: 7.4320, lng: 3.9120, type: 'area' },
        { name: 'Bodija Market, Ibadan', city: 'Bodija', state: 'Oyo', lat: 7.4330, lng: 3.9180, type: 'landmark' },
        { name: 'Bodija Housing Estate, Ibadan', city: 'Bodija', state: 'Oyo', lat: 7.4220, lng: 3.9040, type: 'estate' },
        { name: 'Awolowo Avenue, Old Bodija, Ibadan', city: 'Bodija', state: 'Oyo', lat: 7.4200, lng: 3.8990, type: 'street' },

        // Ring Road & Challenge
        { name: 'Ring Road, Ibadan', city: 'Ring Road', state: 'Oyo', lat: 7.3620, lng: 3.8720, type: 'area' },
        { name: 'Palms Shopping Mall (Shoprite), Ring Road, Ibadan', city: 'Ring Road', state: 'Oyo', lat: 7.3635, lng: 3.8695, type: 'landmark' },
        { name: 'Mobil Roundabout, Ring Road, Ibadan', city: 'Ring Road', state: 'Oyo', lat: 7.3680, lng: 3.8790, type: 'landmark' },
        { name: 'Challenge, Ibadan', city: 'Challenge', state: 'Oyo', lat: 7.3480, lng: 3.8820, type: 'area' },
        { name: 'Challenge Roundabout, Ibadan', city: 'Challenge', state: 'Oyo', lat: 7.3495, lng: 3.8845, type: 'landmark' },
        { name: 'Molete, Ibadan', city: 'Molete', state: 'Oyo', lat: 7.3610, lng: 3.8960, type: 'area' },
        { name: 'Liberty Stadium (Obafemi Awolowo Stadium), Oke Ado, Ibadan', city: 'Oke Ado', state: 'Oyo', lat: 7.3640, lng: 3.8850, type: 'landmark' },
        { name: 'Oke Ado, Ibadan', city: 'Oke Ado', state: 'Oyo', lat: 7.3710, lng: 3.8860, type: 'area' },
        { name: 'Oke Bola, Ibadan', city: 'Oke Bola', state: 'Oyo', lat: 7.3780, lng: 3.8840, type: 'area' },

        // Dugbe, Mokola & Agodi
        { name: 'Dugbe Commercial Hub, Ibadan', city: 'Dugbe', state: 'Oyo', lat: 7.3880, lng: 3.8810, type: 'area' },
        { name: 'Cocoa House, Dugbe, Ibadan', city: 'Dugbe', state: 'Oyo', lat: 7.3872, lng: 3.8825, type: 'landmark' },
        { name: 'Lebanon Street, Dugbe, Ibadan', city: 'Dugbe', state: 'Oyo', lat: 7.3850, lng: 3.8870, type: 'street' },
        { name: 'Mokola, Ibadan', city: 'Mokola', state: 'Oyo', lat: 7.4040, lng: 3.8860, type: 'area' },
        { name: 'Mokola Roundabout, Ibadan', city: 'Mokola', state: 'Oyo', lat: 7.4020, lng: 3.8880, type: 'landmark' },
        { name: 'Adamasingba Stadium (Lekan Salami), Mokola, Ibadan', city: 'Mokola', state: 'Oyo', lat: 7.3980, lng: 3.8820, type: 'landmark' },
        { name: 'Agodi GRA, Ibadan', city: 'Agodi', state: 'Oyo', lat: 7.4120, lng: 3.9140, type: 'estate' },
        { name: 'Oyo State Government Secretariat, Agodi, Ibadan', city: 'Agodi', state: 'Oyo', lat: 7.4140, lng: 3.9090, type: 'landmark' },
        { name: 'Agodi Gardens, Ibadan', city: 'Agodi', state: 'Oyo', lat: 7.4080, lng: 3.9080, type: 'landmark' },
        { name: 'Agodi Gate, Ibadan', city: 'Agodi', state: 'Oyo', lat: 7.4010, lng: 3.9210, type: 'area' },
        { name: 'Total Garden, Ibadan', city: 'Total Garden', state: 'Oyo', lat: 7.4030, lng: 3.9060, type: 'landmark' },
        { name: 'University College Hospital (UCH), Ibadan', city: 'UCH', state: 'Oyo', lat: 7.4015, lng: 3.9025, type: 'landmark' },

        // Samonda, Sango, UI & Ojoo
        { name: 'Samonda, Ibadan', city: 'Samonda', state: 'Oyo', lat: 7.4260, lng: 3.8890, type: 'area' },
        { name: 'Ventura Mall, Samonda, Ibadan', city: 'Samonda', state: 'Oyo', lat: 7.4255, lng: 3.8885, type: 'landmark' },
        { name: 'Sango, Ibadan', city: 'Sango', state: 'Oyo', lat: 7.4280, lng: 3.8820, type: 'area' },
        { name: 'University of Ibadan (UI Main Gate), Ibadan', city: 'UI', state: 'Oyo', lat: 7.4420, lng: 3.9000, type: 'landmark' },
        { name: 'Agbowo, UI, Ibadan', city: 'Agbowo', state: 'Oyo', lat: 7.4440, lng: 3.9080, type: 'area' },
        { name: 'The Polytechnic Ibadan (Poly Ibadan)', city: 'Sango', state: 'Oyo', lat: 7.4390, lng: 3.8740, type: 'landmark' },
        { name: 'Ojoo Interchange / Bus Stop, Ibadan', city: 'Ojoo', state: 'Oyo', lat: 7.4680, lng: 3.9180, type: 'area' },
        { name: 'Moniya Train Station, Ibadan', city: 'Moniya', state: 'Oyo', lat: 7.5250, lng: 3.9160, type: 'landmark' },

        // Jericho, Idi-Ishin, Eleyele
        { name: 'Jericho GRA, Ibadan', city: 'Jericho', state: 'Oyo', lat: 7.3910, lng: 3.8640, type: 'estate' },
        { name: 'Idi-Ishin, Jericho, Ibadan', city: 'Jericho', state: 'Oyo', lat: 7.3980, lng: 3.8550, type: 'area' },
        { name: 'NIHORT, Idi-Ishin, Ibadan', city: 'Jericho', state: 'Oyo', lat: 7.4010, lng: 3.8480, type: 'landmark' },
        { name: 'Eleyele, Ibadan', city: 'Eleyele', state: 'Oyo', lat: 7.4140, lng: 3.8620, type: 'area' },
        { name: 'Eleyele Waterworks / Roundabout, Ibadan', city: 'Eleyele', state: 'Oyo', lat: 7.4180, lng: 3.8680, type: 'landmark' },

        // Akobo, Iwo Road, Alakia, Oluyole, Apata
        { name: 'Akobo, Ibadan', city: 'Akobo', state: 'Oyo', lat: 7.4480, lng: 3.9420, type: 'area' },
        { name: 'Akobo General Gas, Ibadan', city: 'Akobo', state: 'Oyo', lat: 7.4410, lng: 3.9350, type: 'area' },
        { name: 'Akobo Ojurin, Ibadan', city: 'Akobo', state: 'Oyo', lat: 7.4610, lng: 3.9520, type: 'area' },
        { name: 'Kolapo Ishola GRA, Akobo, Ibadan', city: 'Akobo', state: 'Oyo', lat: 7.4520, lng: 3.9380, type: 'estate' },
        { name: 'Iwo Road Interchange, Ibadan', city: 'Iwo Road', state: 'Oyo', lat: 7.4090, lng: 3.9490, type: 'area' },
        { name: 'Alakia (Ibadan Airport), Ibadan', city: 'Alakia', state: 'Oyo', lat: 7.3960, lng: 3.9780, type: 'landmark' },
        { name: 'Monatan, Ibadan', city: 'Monatan', state: 'Oyo', lat: 7.4180, lng: 3.9680, type: 'area' },
        { name: 'Iyana Church, Ibadan', city: 'Iyana Church', state: 'Oyo', lat: 7.4260, lng: 3.9750, type: 'area' },
        { name: 'Oluyole Estate, Ibadan', city: 'Oluyole', state: 'Oyo', lat: 7.3520, lng: 3.8640, type: 'estate' },
        { name: 'Oluyole Extension, Ibadan', city: 'Oluyole', state: 'Oyo', lat: 7.3440, lng: 3.8580, type: 'estate' },
        { name: '7up, Oluyole, Ibadan', city: 'Oluyole', state: 'Oyo', lat: 7.3480, lng: 3.8610, type: 'landmark' },
        { name: 'New Garage, Ibadan', city: 'New Garage', state: 'Oyo', lat: 7.3290, lng: 3.8740, type: 'area' },
        { name: 'Apata, Ibadan', city: 'Apata', state: 'Oyo', lat: 7.3620, lng: 3.8320, type: 'area' },
        { name: 'Kuola, Apata, Ibadan', city: 'Apata', state: 'Oyo', lat: 7.3490, lng: 3.8210, type: 'area' },
        { name: 'Ologuneru, Ibadan', city: 'Ologuneru', state: 'Oyo', lat: 7.4320, lng: 3.8240, type: 'area' },

        // ==================== ABUJA (FCT) ====================
        { name: 'Abuja Central Business District (CBD)', city: 'Abuja', state: 'FCT', lat: 9.0579, lng: 7.4951, type: 'city' },
        { name: 'Wuse 2, Abuja', city: 'Wuse', state: 'FCT', lat: 9.0797, lng: 7.4723, type: 'area' },
        { name: 'Wuse Zone 1 - 7, Abuja', city: 'Wuse', state: 'FCT', lat: 9.0620, lng: 7.4650, type: 'area' },
        { name: 'Maitama, Abuja', city: 'Maitama', state: 'FCT', lat: 9.0882, lng: 7.4934, type: 'estate' },
        { name: 'Garki Area 1 - 11, Abuja', city: 'Garki', state: 'FCT', lat: 9.0340, lng: 7.4890, type: 'area' },
        { name: 'Garki 2, Abuja', city: 'Garki', state: 'FCT', lat: 9.0280, lng: 7.4950, type: 'area' },
        { name: 'Asokoro, Abuja', city: 'Asokoro', state: 'FCT', lat: 9.0430, lng: 7.5260, type: 'estate' },
        { name: 'Gwarinpa Estate, Abuja', city: 'Gwarinpa', state: 'FCT', lat: 9.1080, lng: 7.4080, type: 'estate' },
        { name: 'Jabi, Abuja', city: 'Jabi', state: 'FCT', lat: 9.0720, lng: 7.4240, type: 'area' },
        { name: 'Jabi Lake Mall, Abuja', city: 'Jabi', state: 'FCT', lat: 9.0760, lng: 7.4210, type: 'landmark' },
        { name: 'Utako, Abuja', city: 'Utako', state: 'FCT', lat: 9.0640, lng: 7.4410, type: 'area' },
        { name: 'Guzape, Abuja', city: 'Guzape', state: 'FCT', lat: 9.0190, lng: 7.5180, type: 'area' },
        { name: 'Katampe, Abuja', city: 'Katampe', state: 'FCT', lat: 9.1120, lng: 7.4680, type: 'area' },
        { name: 'Life Camp, Abuja', city: 'Life Camp', state: 'FCT', lat: 9.0680, lng: 7.3910, type: 'area' },
        { name: 'Apo, Abuja', city: 'Apo', state: 'FCT', lat: 8.9980, lng: 7.4980, type: 'area' },
        { name: 'Kubwa, Abuja', city: 'Kubwa', state: 'FCT', lat: 9.1550, lng: 7.3380, type: 'city' },
        { name: 'Lugbe, Abuja', city: 'Lugbe', state: 'FCT', lat: 8.9720, lng: 7.3780, type: 'area' },
        { name: 'Lokogoma, Abuja', city: 'Lokogoma', state: 'FCT', lat: 8.9760, lng: 7.4520, type: 'estate' },

        // ==================== OGUN STATE ====================
        { name: 'Abeokuta Central', city: 'Abeokuta', state: 'Ogun', lat: 7.1475, lng: 3.3619, type: 'city' },
        { name: 'Oke-Mosan, Abeokuta', city: 'Abeokuta', state: 'Ogun', lat: 7.1260, lng: 3.3980, type: 'area' },
        { name: 'Ibara, Abeokuta', city: 'Abeokuta', state: 'Ogun', lat: 7.1510, lng: 3.3420, type: 'area' },
        { name: 'Panseke, Abeokuta', city: 'Abeokuta', state: 'Ogun', lat: 7.1420, lng: 3.3480, type: 'area' },
        { name: 'Ota / Sango Ota, Ogun', city: 'Ota', state: 'Ogun', lat: 6.6910, lng: 3.2340, type: 'city' },
        { name: 'Mowe, Ogun', city: 'Mowe', state: 'Ogun', lat: 6.8120, lng: 3.4410, type: 'area' },
        { name: 'Ibafo, Ogun', city: 'Ibafo', state: 'Ogun', lat: 6.7450, lng: 3.4210, type: 'area' },
        { name: 'Sagamu, Ogun', city: 'Sagamu', state: 'Ogun', lat: 6.8430, lng: 3.6480, type: 'city' },

        // ==================== RIVERS / PORT HARCOURT ====================
        { name: 'Port Harcourt Central', city: 'Port Harcourt', state: 'Rivers', lat: 4.8156, lng: 7.0498, type: 'city' },
        { name: 'GRA Phase 2, Port Harcourt', city: 'Port Harcourt', state: 'Rivers', lat: 4.8210, lng: 7.0020, type: 'estate' },
        { name: 'Trans Amadi, Port Harcourt', city: 'Port Harcourt', state: 'Rivers', lat: 4.8080, lng: 7.0380, type: 'area' },
        { name: 'Peter Odili Road, Port Harcourt', city: 'Port Harcourt', state: 'Rivers', lat: 4.8010, lng: 7.0560, type: 'street' },
        { name: 'Rumuokoro, Port Harcourt', city: 'Port Harcourt', state: 'Rivers', lat: 4.8720, lng: 6.9850, type: 'area' },
        { name: 'D-Line, Port Harcourt', city: 'Port Harcourt', state: 'Rivers', lat: 4.8140, lng: 7.0120, type: 'area' },
        { name: 'Choba (Uniport), Port Harcourt', city: 'Port Harcourt', state: 'Rivers', lat: 4.8980, lng: 6.9180, type: 'landmark' },

        // ==================== OTHER MAJOR NIGERIAN HUBS ====================
        { name: 'Kano Central', city: 'Kano', state: 'Kano', lat: 12.0022, lng: 8.5920, type: 'city' },
        { name: 'Nassarawa, Kano', city: 'Kano', state: 'Kano', lat: 11.9880, lng: 8.5420, type: 'area' },
        { name: 'Sabon Gari, Kano', city: 'Kano', state: 'Kano', lat: 12.0120, lng: 8.5350, type: 'area' },
        { name: 'Enugu Central', city: 'Enugu', state: 'Enugu', lat: 6.4584, lng: 7.5464, type: 'city' },
        { name: 'Independence Layout, Enugu', city: 'Enugu', state: 'Enugu', lat: 6.4420, lng: 7.5280, type: 'estate' },
        { name: 'GRA, Enugu', city: 'Enugu', state: 'Enugu', lat: 6.4560, lng: 7.5080, type: 'estate' },
        { name: 'Benin City Central', city: 'Benin City', state: 'Edo', lat: 6.3350, lng: 5.6037, type: 'city' },
        { name: 'GRA, Benin City', city: 'Benin City', state: 'Edo', lat: 6.3180, lng: 5.6140, type: 'estate' },
        { name: 'Akure Central', city: 'Akure', state: 'Ondo', lat: 7.2571, lng: 5.2058, type: 'city' },
        { name: 'Alagbaka, Akure', city: 'Akure', state: 'Ondo', lat: 7.2480, lng: 5.2210, type: 'area' },
        { name: 'Ilorin Central', city: 'Ilorin', state: 'Kwara', lat: 8.4799, lng: 4.5418, type: 'city' },
        { name: 'GRA, Ilorin', city: 'Ilorin', state: 'Kwara', lat: 8.4720, lng: 4.5680, type: 'estate' },
        { name: 'Asaba Central', city: 'Asaba', state: 'Delta', lat: 6.1983, lng: 6.7297, type: 'city' },
        { name: 'Warri Central', city: 'Warri', state: 'Delta', lat: 5.5160, lng: 5.7500, type: 'city' },
        { name: 'Calabar Central', city: 'Calabar', state: 'Cross River', lat: 4.9757, lng: 8.3417, type: 'city' },
        { name: 'Uyo Central', city: 'Uyo', state: 'Akwa Ibom', lat: 5.0377, lng: 7.9128, type: 'city' }
    ];

    // CSS Styling for the Autocomplete Dropdown
    const CSS_STYLES = `
        .nga-geo-wrapper {
            position: relative !important;
            width: 100% !important;
        }
        .nga-geo-dropdown {
            position: absolute !important;
            top: 100% !important;
            left: 0 !important;
            right: 0 !important;
            z-index: 99999 !important;
            background: #ffffff !important;
            border: 1px solid #e2e8f0 !important;
            border-radius: 10px !important;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.15), 0 8px 10px -6px rgba(0, 0, 0, 0.1) !important;
            max-height: 280px !important;
            overflow-y: auto !important;
            margin-top: 4px !important;
            padding: 6px 0 !important;
            display: none;
            font-family: inherit !important;
        }
        .nga-geo-item {
            padding: 10px 14px !important;
            cursor: pointer !important;
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            transition: all 0.15s ease !important;
            border-bottom: 1px solid #f1f5f9 !important;
            font-size: 14px !important;
            color: #1e293b !important;
            text-align: left !important;
        }
        .nga-geo-item:last-child {
            border-bottom: none !important;
        }
        .nga-geo-item:hover, .nga-geo-item.active {
            background-color: #f8fafc !important;
            border-left: 3px solid #f9c200 !important;
            padding-left: 15px !important;
        }
        .nga-geo-item-left {
            display: flex !important;
            align-items: center !important;
            gap: 10px !important;
            flex: 1 !important;
            overflow: hidden !important;
        }
        .nga-geo-icon {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: 28px !important;
            height: 28px !important;
            border-radius: 6px !important;
            background: #fef3c7 !important;
            color: #d97706 !important;
            font-size: 14px !important;
            flex-shrink: 0 !important;
        }
        .nga-geo-title {
            font-weight: 600 !important;
            color: #0f172a !important;
            white-space: nowrap !important;
            overflow: hidden !important;
            text-overflow: ellipsis !important;
            display: block !important;
        }
        .nga-geo-subtitle {
            font-size: 12px !important;
            color: #64748b !important;
            white-space: nowrap !important;
            overflow: hidden !important;
            text-overflow: ellipsis !important;
            display: block !important;
        }
        .nga-geo-badge {
            font-size: 11px !important;
            font-weight: 600 !important;
            padding: 3px 8px !important;
            border-radius: 9999px !important;
            background: #f1f5f9 !important;
            color: #475569 !important;
            margin-left: 8px !important;
            flex-shrink: 0 !important;
            text-transform: uppercase !important;
        }
        .nga-geo-badge-lagos {
            background: #ecfdf5 !important;
            color: #059669 !important;
        }
        .nga-geo-badge-oyo {
            background: #eff6ff !important;
            color: #2563eb !important;
        }
        .nga-geo-badge-fct {
            background: #fdf2f8 !important;
            color: #db2777 !important;
        }
        .nga-geo-loading {
            padding: 10px 14px !important;
            font-size: 13px !important;
            color: #94a3b8 !important;
            text-align: center !important;
        }
        .nga-geo-empty {
            padding: 12px 14px !important;
            font-size: 13px !important;
            color: #64748b !important;
            text-align: center !important;
        }
        /* Custom Clean Restaurant Pickup Card */
        .pickup-clean-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }
        .pickup-clean-card-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 15px;
        }
        .pickup-clean-card-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: #fef3c7;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #b45309;
        }
        .pickup-clean-badge {
            display: inline-block;
            background: #e0f2fe;
            color: #0369a1;
            font-size: 12px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 20px;
            margin-bottom: 4px;
        }
    `;

    // Inject styles once
    function injectStyles() {
        if (document.getElementById('nga-geo-autocomplete-styles')) return;
        const style = document.createElement('style');
        style.id = 'nga-geo-autocomplete-styles';
        style.textContent = CSS_STYLES;
        document.head.appendChild(style);
    }

    // Local Search matching query against curated Nigerian database
    function searchLocalDictionary(query) {
        if (!query || query.trim().length < 1) return [];
        const cleanQuery = query.toLowerCase().trim();
        const parts = cleanQuery.split(/[\s,]+/).filter(Boolean);

        return NIGERIAN_LOCATIONS.filter(item => {
            const fullTarget = `${item.name} ${item.city} ${item.state} ${item.type}`.toLowerCase();
            return parts.every(part => fullTarget.includes(part));
        }).slice(0, 8);
    }

    // Online Photon / OSM API search for dynamic Nigerian addresses
    async function searchOnlineOsm(query) {
        if (!query || query.trim().length < 2) return [];
        try {
            const encoded = encodeURIComponent(query.trim());
            const url = `https://photon.komoot.de/api/?q=${encoded}&countrycodes=NG&limit=6`;
            
            const controller = new AbortController();
            const timeoutId = setTimeout(() => controller.abort(), 2500);

            const res = await fetch(url, { signal: controller.signal });
            clearTimeout(timeoutId);

            if (!res.ok) return [];
            const data = await res.json();
            
            if (!data.features || !data.features.length) return [];

            return data.features.map(f => {
                const p = f.properties || {};
                const nameParts = [p.name, p.street, p.district, p.city, p.state].filter(Boolean);
                const uniqueParts = [...new Set(nameParts)];
                return {
                    name: uniqueParts.join(', '),
                    city: p.city || p.district || p.county || 'Nigeria',
                    state: p.state || 'Nigeria',
                    lat: f.geometry.coordinates[1],
                    lng: f.geometry.coordinates[0],
                    type: 'osm'
                };
            });
        } catch (e) {
            return [];
        }
    }

    // Resolve address text into best matching lat/lng immediately
    function resolveLocationSync(addressText) {
        if (!addressText || typeof addressText !== 'string') {
            return { lat: 6.4281, lng: 3.4219, name: 'Lagos, Nigeria' };
        }
        const matches = searchLocalDictionary(addressText);
        if (matches.length > 0) {
            return matches[0];
        }
        // Fallback default coordinates (Lagos / Ibadan / Abuja)
        const lower = addressText.toLowerCase();
        if (lower.includes('ibadan') || lower.includes('bodija') || lower.includes('ring road') || lower.includes('dugbe') || lower.includes('samonda') || lower.includes('akobo') || lower.includes('jericho') || lower.includes('uch') || lower.includes('challenge')) {
            return { lat: 7.3775, lng: 3.9470, name: addressText, city: 'Ibadan', state: 'Oyo' };
        }
        if (lower.includes('abuja') || lower.includes('wuse') || lower.includes('maitama') || lower.includes('garki') || lower.includes('gwarinpa') || lower.includes('fct')) {
            return { lat: 9.0579, lng: 7.4951, name: addressText, city: 'Abuja', state: 'FCT' };
        }
        if (lower.includes('abeokuta') || lower.includes('ogun') || lower.includes('ota') || lower.includes('mowe')) {
            return { lat: 7.1475, lng: 3.3619, name: addressText, city: 'Abeokuta', state: 'Ogun' };
        }
        if (lower.includes('port harcourt') || lower.includes('rivers') || lower.includes('ph')) {
            return { lat: 4.8156, lng: 7.0498, name: addressText, city: 'Port Harcourt', state: 'Rivers' };
        }
        // Default to Lagos Center
        return { lat: 6.4281, lng: 3.4219, name: addressText, city: 'Lagos', state: 'Lagos' };
    }

    // Main Autocomplete Class attached to input fields
    class NigeriaGeoAutocomplete {
        constructor(inputElement, options = {}) {
            this.input = typeof inputElement === 'string' ? document.querySelector(inputElement) : inputElement;
            if (!this.input) return;

            this.options = Object.assign({
                latField: '#new_latitude, #latitude, .latitude',
                lngField: '#new_longitude, #longitude, .longitude',
                plainAddressField: '#new_plain_address, #plain_address, .plain_address',
                onSelect: null,
                placeholder: 'Enter Nigerian area, estate, or street name...',
            }, options);

            this.debounceTimer = null;
            this.dropdown = null;
            this.activeIdx = -1;
            this.currentResults = [];

            this.init();
        }

        init() {
            injectStyles();

            // Wrap input in positioning container if not already
            const parent = this.input.parentElement;
            let wrapper = parent;
            if (!parent.classList.contains('nga-geo-wrapper')) {
                wrapper = document.createElement('div');
                wrapper.className = 'nga-geo-wrapper';
                parent.insertBefore(wrapper, this.input);
                wrapper.appendChild(this.input);
            }

            // Create dropdown element
            this.dropdown = document.createElement('div');
            this.dropdown.className = 'nga-geo-dropdown';
            wrapper.appendChild(this.dropdown);

            // Bind Input Events
            this.input.setAttribute('autocomplete', 'off');
            this.input.setAttribute('spellcheck', 'false');

            this.input.addEventListener('input', (e) => this.handleInput(e.target.value));
            this.input.addEventListener('focus', () => {
                if (this.input.value.trim().length >= 1) {
                    this.handleInput(this.input.value);
                }
            });

            this.input.addEventListener('keydown', (e) => this.handleKeydown(e));
            this.input.addEventListener('blur', () => this.handleBlur());

            // Close dropdown on click outside
            document.addEventListener('click', (e) => {
                if (!wrapper.contains(e.target)) {
                    this.closeDropdown();
                }
            });
        }

        handleInput(value) {
            clearTimeout(this.debounceTimer);
            const query = value ? value.trim() : '';

            if (query.length < 1) {
                this.closeDropdown();
                return;
            }

            // Step 1: Render Local Matches instantly
            const localResults = searchLocalDictionary(query);
            this.renderResults(localResults, true);

            // Step 2: Fetch Live Online OSM matches after short debounce
            this.debounceTimer = setTimeout(async () => {
                const onlineResults = await searchOnlineOsm(query);
                
                // Merge without duplicates
                const combined = [...localResults];
                const seenCoords = new Set(localResults.map(r => `${r.lat.toFixed(3)},${r.lng.toFixed(3)}`));

                for (const item of onlineResults) {
                    const key = `${item.lat.toFixed(3)},${item.lng.toFixed(3)}`;
                    if (!seenCoords.has(key)) {
                        seenCoords.add(key);
                        combined.push(item);
                    }
                }

                this.renderResults(combined, false);
            }, 250);
        }

        renderResults(results, isSearching = false) {
            this.currentResults = results;
            this.activeIdx = -1;
            this.dropdown.innerHTML = '';

            if (results.length === 0) {
                if (isSearching) {
                    this.dropdown.innerHTML = `<div class="nga-geo-loading">Searching Nigerian locations...</div>`;
                } else {
                    this.dropdown.innerHTML = `<div class="nga-geo-empty">No exact location found. Enter your street/estate directly.</div>`;
                }
                this.dropdown.style.display = 'block';
                return;
            }

            results.forEach((item, idx) => {
                const div = document.createElement('div');
                div.className = 'nga-geo-item';
                div.dataset.index = idx;

                let iconChar = '📍';
                if (item.type === 'landmark') iconChar = '🏛️';
                if (item.type === 'estate') iconChar = '🏡';
                if (item.type === 'street') iconChar = '🛣️';
                if (item.type === 'city') iconChar = '🏙️';

                let badgeClass = '';
                const st = (item.state || '').toLowerCase();
                if (st.includes('lagos')) badgeClass = 'nga-geo-badge-lagos';
                else if (st.includes('oyo')) badgeClass = 'nga-geo-badge-oyo';
                else if (st.includes('fct') || st.includes('abuja')) badgeClass = 'nga-geo-badge-fct';

                div.innerHTML = `
                    <div class="nga-geo-item-left">
                        <span class="nga-geo-icon">${iconChar}</span>
                        <div>
                            <span class="nga-geo-title">${item.name}</span>
                            <span class="nga-geo-subtitle">${item.city ? item.city + ', ' : ''}${item.state || 'Nigeria'}</span>
                        </div>
                    </div>
                    <span class="nga-geo-badge ${badgeClass}">${item.state || 'NG'}</span>
                `;

                div.addEventListener('mousedown', (e) => {
                    e.preventDefault();
                    this.selectItem(item);
                });

                this.dropdown.appendChild(div);
            });

            this.dropdown.style.display = 'block';
        }

        handleKeydown(e) {
            const items = this.dropdown.querySelectorAll('.nga-geo-item');
            if (e.key === 'ArrowDown') {
                e.preventDefault();
                this.activeIdx = (this.activeIdx + 1) % items.length;
                this.updateActiveItem(items);
            } else if (e.key === 'ArrowUp') {
                e.preventDefault();
                this.activeIdx = (this.activeIdx - 1 + items.length) % items.length;
                this.updateActiveItem(items);
            } else if (e.key === 'Enter') {
                if (this.activeIdx >= 0 && this.currentResults[this.activeIdx]) {
                    e.preventDefault();
                    this.selectItem(this.currentResults[this.activeIdx]);
                } else if (this.currentResults.length > 0) {
                    e.preventDefault();
                    this.selectItem(this.currentResults[0]);
                } else {
                    this.autoResolveCurrentValue();
                }
            } else if (e.key === 'Escape') {
                this.closeDropdown();
            }
        }

        updateActiveItem(items) {
            items.forEach((it, i) => {
                if (i === this.activeIdx) {
                    it.classList.add('active');
                    it.scrollIntoView({ block: 'nearest' });
                } else {
                    it.classList.remove('active');
                }
            });
        }

        handleBlur() {
            setTimeout(() => {
                this.closeDropdown();
                this.autoResolveCurrentValue();
            }, 200);
        }

        autoResolveCurrentValue() {
            const val = this.input.value.trim();
            if (!val) return;

            // Check if coordinates are already filled
            const latEls = document.querySelectorAll(this.options.latField);
            const lngEls = document.querySelectorAll(this.options.lngField);
            const hasCoords = Array.from(latEls).some(el => el.value && parseFloat(el.value) !== 0);

            if (!hasCoords) {
                const resolved = resolveLocationSync(val);
                this.populateFields(resolved, false);
            }
        }

        selectItem(item) {
            this.input.value = item.name;
            this.populateFields(item, true);
            this.closeDropdown();
        }

        populateFields(item, userExplicit = true) {
            // Latitude fields
            document.querySelectorAll(this.options.latField).forEach(el => {
                el.value = item.lat;
            });

            // Longitude fields
            document.querySelectorAll(this.options.lngField).forEach(el => {
                el.value = item.lng;
            });

            // Plain address fields
            document.querySelectorAll(this.options.plainAddressField).forEach(el => {
                if (el !== this.input) {
                    el.value = item.name;
                }
            });

            // Trigger global distance/delivery calculation if available
            if (typeof window.calculateDeliveryCharge === 'function') {
                window.calculateDeliveryCharge(item.lat, item.lng);
            }

            if (typeof this.options.onSelect === 'function') {
                this.options.onSelect(item, userExplicit);
            }
        }

        closeDropdown() {
            if (this.dropdown) {
                this.dropdown.style.display = 'none';
            }
        }
    }

    // Expose Global Helper API
    window.NigeriaGeo = {
        attach: function (selector, options) {
            const elements = document.querySelectorAll(selector);
            const instances = [];
            elements.forEach(el => {
                instances.push(new NigeriaGeoAutocomplete(el, options));
            });
            return instances;
        },
        resolve: resolveLocationSync,
        searchLocal: searchLocalDictionary,
        searchOnline: searchOnlineOsm,
        locations: NIGERIAN_LOCATIONS
    };

    // Auto-initialize on common location input IDs when DOM is ready
    document.addEventListener('DOMContentLoaded', function () {
        if (document.querySelector('#searchMapInput')) {
            window.NigeriaGeo.attach('#searchMapInput');
        }
        if (document.querySelector('#new_plain_address')) {
            window.NigeriaGeo.attach('#new_plain_address');
        }
        if (document.querySelector('#plain_address')) {
            window.NigeriaGeo.attach('#plain_address');
        }
    });

})(window, document);
