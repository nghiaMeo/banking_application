import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/features/branches/data/silver_map_style.dart';
import 'package:bank_app/features/branches/domain/branch_place.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Branch finder with Google Maps, silver map style, and a draggable sheet.
class BranchFinderPage extends StatefulWidget {
  const BranchFinderPage({super.key});

  static const LatLng _initialTarget = LatLng(40.7725, -74.035);

  @override
  State<BranchFinderPage> createState() => _BranchFinderPageState();
}

class _BranchFinderPageState extends State<BranchFinderPage> {
  static const Color _pinBlue = Color(0xFF3F51B5);
  static const Color _distanceGrey = Color(0xFF8E8E93);
  static const Color _titleGrey = Color(0xFF333333);

  final TextEditingController _searchController = TextEditingController();
  final CameraPosition _initialCamera = const CameraPosition(
    target: BranchFinderPage._initialTarget,
    zoom: 12.2,
  );

  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  List<BranchPlace> _visibleBranches = List<BranchPlace>.from(kSampleBranches);
  LatLng? _sortOrigin;
  bool _locationReady = false;

  @override
  void initState() {
    super.initState();
    _markers = {
      for (final b in kSampleBranches)
        Marker(
          markerId: MarkerId(b.id),
          position: b.position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
    };
    _sortOrigin = BranchFinderPage._initialTarget;
    _applySort();
    _searchController.addListener(_onSearchChanged);
    _initLocation();
  }

  Future<void> _initLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled || !mounted) return;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (!mounted) return;
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      final pos = await Geolocator.getCurrentPosition();
      if (!mounted) return;
      setState(() {
        _sortOrigin = LatLng(pos.latitude, pos.longitude);
        _locationReady = true;
        _applySort();
      });
      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_sortOrigin!, 13),
      );
    } catch (_) {
      // Keep default camera / sort origin.
    }
  }

  void _onSearchChanged() {
    final q = _searchController.text.trim().toLowerCase();
    setState(() {
      _visibleBranches = kSampleBranches.where((b) {
        if (q.isEmpty) return true;
        return b.name.toLowerCase().contains(q) ||
            b.address.toLowerCase().contains(q);
      }).toList();
      _applySort();
    });
  }

  void _applySort() {
    final origin = _sortOrigin ?? BranchFinderPage._initialTarget;
    _visibleBranches.sort((a, b) {
      final da = Geolocator.distanceBetween(
        origin.latitude,
        origin.longitude,
        a.position.latitude,
        a.position.longitude,
      );
      final db = Geolocator.distanceBetween(
        origin.latitude,
        origin.longitude,
        b.position.latitude,
        b.position.longitude,
      );
      return da.compareTo(db);
    });
  }

  String _formatDistance(BranchPlace b) {
    final origin = _sortOrigin;
    if (origin == null) return '';
    final meters = Geolocator.distanceBetween(
      origin.latitude,
      origin.longitude,
      b.position.latitude,
      b.position.longitude,
    );
    if (meters < 1000) {
      return '${meters.round()} m';
    }
    final km = (meters / 1000).toStringAsFixed(1).replaceAll('.', ',');
    return '$km km';
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.neutralWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsTheme.neutralWhite,
        foregroundColor: _titleGrey,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 28),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Branch',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: _titleGrey,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          GoogleMap(
            initialCameraPosition: _initialCamera,
            markers: _markers,
            mapType: MapType.normal,
            style: kSilverMapStyleJson,
            myLocationEnabled: _locationReady,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,
            onMapCreated: (c) => _mapController = c,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.42,
            minChildSize: 0.22,
            maxChildSize: 0.92,
            builder: (context, scrollController) {
              return Material(
                color: ColorsTheme.neutralWhite,
                elevation: 10,
                shadowColor: Colors.black26,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: ColorsTheme.neutralWhiteGrey,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: 'Bank',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorsTheme.neutralGreyMid,
                            size: 22,
                          ),
                          suffixIcon: _searchController.text.isEmpty
                              ? null
                              : IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: ColorsTheme.neutralGreyMid,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                  },
                                ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: ColorsTheme.neutralVani,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: ColorsTheme.neutralVani,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: ColorsTheme.neutralWhiteGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: _visibleBranches.length,
                        separatorBuilder: (_, __) => const Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorsTheme.neutralVani,
                        ),
                        itemBuilder: (context, index) {
                          final b = _visibleBranches[index];
                          return InkWell(
                            onTap: () {
                              _mapController?.animateCamera(
                                CameraUpdate.newLatLngZoom(b.position, 15),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.location_on,
                                      color: _pinBlue,
                                      size: 22,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      b.titleLine,
                                      style: const TextStyle(
                                        color: _titleGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _formatDistance(b),
                                    style: const TextStyle(
                                      color: _distanceGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
