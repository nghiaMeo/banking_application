import 'package:bank_app/features/branches/data/data_sources/location_remote_data_source.dart';
import 'package:bank_app/features/branches/domain/repositories/location_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/search_location.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SearchLocation>> searchLocations(String query) async {
    return await remoteDataSource.searchLocations(query);
  }

  @override
  Future<LatLng> getCurrentLocation() async {
    return await remoteDataSource.getCurrentLocation();
  }
}
