
import '../../domain/entities/search_location.dart';

class SearchLocationModel extends SearchLocation {
  const SearchLocationModel({
    required super.displayName,
    required super.lat,
    required super.lon,
  });

  factory SearchLocationModel.fromJson(Map<String, dynamic> json) {
    return SearchLocationModel(
      displayName: json['formatted_address'] ?? 'Unknown Location',
      lat: (json['geometry']?['location']?['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['geometry']?['location']?['lng'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
