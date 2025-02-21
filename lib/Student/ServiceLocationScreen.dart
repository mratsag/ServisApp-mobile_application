import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceLocationScreen extends StatefulWidget {
  const ServiceLocationScreen({super.key});

  @override
  _ServiceLocationScreenState createState() => _ServiceLocationScreenState();
}

class _ServiceLocationScreenState extends State<ServiceLocationScreen> {
  late GoogleMapController mapController;
  final LatLng _serviceLocation = const LatLng(41.2061, 32.6204); // Servis konumu (mock)

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servis Konumu'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _serviceLocation,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('service'),
            position: _serviceLocation,
            infoWindow: const InfoWindow(title: 'Servis Konumu'),
          ),
        },
      ),
    );
  }
}