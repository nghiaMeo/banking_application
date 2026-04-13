import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../application/branches_providers.dart';
import '../../domain/entities/search_location.dart';
import '../../domain/repositories/location_repository.dart';

export 'location_state.dart';

class LocationNotifier extends Notifier<LocationState> {
  @override
  LocationState build() {
    return LocationState();
  }

  LocationRepository get _repository => ref.read(locationRepositoryProvider);

  Future<void> initLocation() async {
    try {
      final pos = await _repository.getCurrentLocation();
      state = state.copyWith(
        currentLocation: pos,
        isLocationReady: true,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> searchLocations(String query) async {
    if (query.isEmpty) {
      state = state.clearSearch();
      return;
    }

    state = state.copyWith(isSearching: true, error: null);
    try {
      final results = await _repository.searchLocations(query);
      state = state.copyWith(
        searchResults: results,
        isSearching: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isSearching: false,
      );
    }
  }

  void selectLocation(SearchLocation location) {
    state = state.copyWith(
      searchedLocation: LatLng(location.lat, location.lon),
      searchResults: [],
    );
  }

  void clearSearch() {
    state = state.clearSearch();
  }
}
