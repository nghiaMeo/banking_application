import 'package:bank_app/features/branches/data/models/search_location_model.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationRemoteDataSource {
  Future<List<SearchLocationModel>> searchLocations(String query);
  Future<LatLng> getCurrentLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final Dio client;
  static String get _apiKey {
    if (kIsWeb) return 'AIzaSyBX7ZEZ-rZzyStxklRk9PWP7Mn9zd9-oS8';
    if (Platform.isIOS) return 'AIzaSyBmQk4qTrwdqCJ0_lYt7Upi5ZOGHRaDZuk';
    return 'AIzaSyA1yS9MTFanl6CVRf2kAW5vdCn_kTj9KXs';
  }

  LocationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SearchLocationModel>> searchLocations(String query) async {
    final response = await client.get(
      'https://maps.googleapis.com/maps/api/geocode/json',
      queryParameters: {
        'address': query,
        'key': _apiKey,
      },
    );

    if (response.statusCode == 200 && response.data['status'] == 'OK') {
      final List data = response.data['results'];
      return data.take(5).map((e) => SearchLocationModel.fromJson(e)).toList();
    } else if (response.statusCode == 200 && response.data['status'] == 'ZERO_RESULTS') {
      return [];
    } else {
      final errorMsg = response.data['error_message'] ?? response.data['status'];
      throw Exception('Failed to search locations: $errorMsg');
    }
  }

  @override
  Future<LatLng> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    } 

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LatLng(pos.latitude, pos.longitude);
  }
}
