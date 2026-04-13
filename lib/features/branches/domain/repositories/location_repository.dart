import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../entities/search_location.dart';

abstract class LocationRepository {
  Future<List<SearchLocation>> searchLocations(String query);
  Future<LatLng> getCurrentLocation();
}
