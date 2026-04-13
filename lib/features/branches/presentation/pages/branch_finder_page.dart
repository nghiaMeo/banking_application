import 'dart:async';
import 'package:bank_app/core/theme/colors_theme.dart';
import 'package:bank_app/features/branches/domain/entities/search_location.dart';
import 'package:bank_app/features/branches/application/branches_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Map Page cleanly refactored using Riverpod and Google Maps
class BranchFinderPage extends ConsumerStatefulWidget {
  const BranchFinderPage({super.key});

  @override
  ConsumerState<BranchFinderPage> createState() => _BranchFinderPageState();
}

class _BranchFinderPageState extends ConsumerState<BranchFinderPage> {
  static const Color _titleGrey = Color(0xFF333333);
  
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  
  final CameraPosition _initialCamera = const CameraPosition(
    target: LatLng(16.047079, 108.206230), // Giữa VN mặc định
    zoom: 6,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationNotifierProvider.notifier).initLocation().then((_) {
        // Lấy vị trí ngay khi render xong, và nhảy tới đó nếu không có search
        final state = ref.read(locationNotifierProvider);
        if (state.currentLocation != null && state.searchedLocation == null) {
          _mapController?.animateCamera(
            CameraUpdate.newLatLngZoom(state.currentLocation!, 16),
          );
        }
      });
    });
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    
    if (query.isEmpty) {
      ref.read(locationNotifierProvider.notifier).clearSearch();
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 600), () {
      ref.read(locationNotifierProvider.notifier).searchLocations(query);
    });
    setState(() {}); // to show the "clear" icon immediately
  }

  void _onResultTap(SearchLocation result) {
    FocusScope.of(context).unfocus();
    ref.read(locationNotifierProvider.notifier).selectLocation(result);
    _searchController.text = result.displayName;
    
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(result.lat, result.lon), 16),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Đăng ký watch layer state
    final locationState = ref.watch(locationNotifierProvider);

    Set<Marker> markers = {};
    if (locationState.searchedLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('searched_loc'),
          position: locationState.searchedLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }

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
          'Bản đồ & Tìm kiếm',
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
          // 1. Bản đồ Google Maps
          GoogleMap(
            initialCameraPosition: _initialCamera,
            markers: markers,
            mapType: MapType.normal,
            myLocationEnabled: locationState.isLocationReady, // Tự động hiện chấm xanh dương
            myLocationButtonEnabled: false, // Ẩn nút mặc định của Google Map vì đã dùng FloatingActionButton
            zoomControlsEnabled: false,
            compassEnabled: false,
            onMapCreated: (controller) => _mapController = controller,
          ),

          // 2. Loading lớp phủ ban đầu cho vị trí hiện tại 
          if (!locationState.isLocationReady && locationState.searchedLocation == null)
            const Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 20, 
                          height: 20, 
                          child: CircularProgressIndicator(strokeWidth: 2)
                        ),
                        SizedBox(width: 16),
                        Text('Đang lấy vị trí...', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // Hiển thị Error message nếu có
          if (locationState.error != null)
            Positioned(
              bottom: locationState.isLocationReady ? 32 : 100, 
              left: 16,
              right: 16,
              child: Card(
                color: Colors.red[50],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lỗi: ${locationState.error}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

          // 3. Thanh tìm kiếm nằm nổi trên cùng
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text Field Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm địa điểm, địa chỉ...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: ColorsTheme.fifthSemantic),
                      suffixIcon: _searchController.text.isNotEmpty 
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                _searchController.clear();
                                _onSearchChanged('');
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                
                // Kết quả List View (Nằm dưới Text Field)
                if (locationState.isSearching || locationState.searchResults.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    constraints: const BoxConstraints(maxHeight: 280),
                    child: locationState.isSearching
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                                child: CircularProgressIndicator(
                                    color: ColorsTheme.fifthSemantic)),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: locationState.searchResults.length,
                            separatorBuilder: (context, index) => const Divider(height: 1, color: ColorsTheme.neutralVani),
                            itemBuilder: (context, index) {
                              final res = locationState.searchResults[index];
                              return ListTile(
                                leading: const Icon(Icons.place, color: Colors.grey),
                                title: Text(
                                  res.displayName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14, color: _titleGrey),
                                ),
                                onTap: () => _onResultTap(res),
                              );
                            },
                          ),
                  ),
              ],
            ),
          ),
        ],
      ),
      
      // Nút Focus về vị trí hiện tại
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (locationState.currentLocation != null) {
            _mapController?.animateCamera(
              CameraUpdate.newLatLngZoom(locationState.currentLocation!, 16),
            );
            ref.read(locationNotifierProvider.notifier).clearSearch();
            _searchController.clear();
          } else {
            ref.read(locationNotifierProvider.notifier).initLocation();
          }
        },
        backgroundColor: const Color(0xFF3F51B5),
        child: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}
