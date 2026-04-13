import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/entities/search_location.dart';

class LocationState {
  final LatLng? currentLocation;
  final LatLng? searchedLocation;
  final List<SearchLocation> searchResults;
  final bool isLocationReady;
  final bool isSearching;
  final String? error;

  LocationState({
    this.currentLocation,
    this.searchedLocation,
    this.searchResults = const [],
    this.isLocationReady = false,
    this.isSearching = false,
    this.error,
  });

  LocationState copyWith({
    LatLng? currentLocation,
    LatLng? searchedLocation,
    List<SearchLocation>? searchResults,
    bool? isLocationReady,
    bool? isSearching,
    String? error,
  }) {
    return LocationState(
      currentLocation: currentLocation ?? this.currentLocation,
      searchedLocation: searchedLocation ?? this.searchedLocation,
      searchResults: searchResults ?? this.searchResults,
      isLocationReady: isLocationReady ?? this.isLocationReady,
      isSearching: isSearching ?? this.isSearching,
      error: error, 
    );
  }

  LocationState clearSearch() { 
    return LocationState(
      currentLocation: currentLocation,
      searchedLocation: null,
      searchResults: const [],
      isLocationReady: isLocationReady,
      isSearching: false,
      error: null,
    );
  }
}
