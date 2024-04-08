import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

final locationProvider = StateProvider<LatLng>((ref) => const LatLng(43.2380, 76.8829));

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late MapController mapController;
  late LatLng currentLocation;

  bool currentLocationGot = false;
  late LatLng selectedLocation;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  void didChangeDependencies() {
    if(ref.watch(locationProvider) == const LatLng(43.2380, 76.8829)){
      currentLocation = const LatLng(43.2380, 76.8829);
      selectedLocation = currentLocation = const LatLng(43.2380, 76.8829);
      getCurrentLocation();
    } else {
      setState(() {
        currentLocationGot = true;
      });
    }
    super.didChangeDependencies();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    ref.watch(locationProvider.notifier).state = LatLng(_locationData.latitude!, _locationData.longitude!);
    setState(() {
      currentLocationGot = true;
      selectedLocation = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: currentLocationGot
            ? Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: ref.watch(locationProvider),
                initialZoom: 13,
                onTap: (TapPosition tapPosition, LatLng latLng) {
                  setState(() {
                    selectedLocation = latLng;
                  });
                  ref.watch(locationProvider.notifier).state = selectedLocation;
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: ref.watch(locationProvider),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red.shade500,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
