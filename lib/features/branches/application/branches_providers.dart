import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../data/data_sources/location_remote_data_source.dart';
import '../data/repositories/location_repository_impl.dart';
import '../domain/repositories/location_repository.dart';
import '../presentation/providers/location_notifier.dart';

export '../presentation/providers/location_notifier.dart';
export '../presentation/providers/location_state.dart';

final nominatimDioProvider = Provider<Dio>((ref) {
  return Dio();
});

final locationRemoteDataSourceProvider = Provider<LocationRemoteDataSource>((ref) {
  return LocationRemoteDataSourceImpl(client: ref.watch(nominatimDioProvider));
});

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepositoryImpl(remoteDataSource: ref.watch(locationRemoteDataSourceProvider));
});

final locationNotifierProvider = NotifierProvider<LocationNotifier, LocationState>(() {
  return LocationNotifier();
});
