// lib/pages/map_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final LatLng _initialPosition = const LatLng(37.42796133580664, -122.085749655962);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId('HQ'),
            position: _initialPosition,
            infoWindow: const InfoWindow(title: 'Googleplex'),
          ),
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gps_fixed),
        onPressed: () async {
          final position = await Geolocator.getCurrentPosition();
          mapController.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(position.latitude, position.longitude),
            ),
          );
        },
      ),
    );
  }
}