import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchPlace {
  const BranchPlace({
    required this.id,
    required this.name,
    required this.address,
    required this.position,
  });

  final String id;
  final String name;
  final String address;
  final LatLng position;

  String get titleLine => '$name $address';
}

/// Sample locations around Hudson County, NJ (similar to reference UI).
const List<BranchPlace> kSampleBranches = [
  BranchPlace(
    id: '1',
    name: 'Bank',
    address: '1656 Union Street',
    position: LatLng(40.7689, -74.0274),
  ),
  BranchPlace(
    id: '2',
    name: 'Bank',
    address: '3200 Park Avenue',
    position: LatLng(40.7892, -74.0431),
  ),
  BranchPlace(
    id: '3',
    name: 'Bank',
    address: '88 Meadowlands Pkwy',
    position: LatLng(40.7925, -74.0678),
  ),
  BranchPlace(
    id: '4',
    name: 'Bank',
    address: '401 Rutherford Ave',
    position: LatLng(40.7489, -74.0320),
  ),
  BranchPlace(
    id: '5',
    name: 'Bank',
    address: '12 River Road',
    position: LatLng(40.8071, -74.0186),
  ),
  BranchPlace(
    id: '6',
    name: 'Bank',
    address: '550 Summit Ave',
    position: LatLng(40.7183, -74.0457),
  ),
];
