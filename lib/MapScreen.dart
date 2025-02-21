// map_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // Karabük'ün koordinatları
  final LatLng _karabukLocation = const LatLng(41.2061, 32.6204);

  // Ankara'nın koordinatları (örnek olarak ekledik)
  final LatLng _ankaraLocation = const LatLng(39.9334, 32.8597);

  // Harita türü (varsayılan: normal)
  MapType _currentMapType = MapType.normal;

  // Marker'lar
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Marker'ları ekleyelim
    _markers.add(
      const Marker(
        markerId: MarkerId('karabuk'),
        position: LatLng(41.2061, 32.6204), // Karabük'ün konumu
        infoWindow: InfoWindow(
          title: 'Karabük',
          snippet: 'Karabük, Türkiye',
        ),
      ),
    );
    _markers.add(
      const Marker(
        markerId: MarkerId('ankara'),
        position: LatLng(39.9334, 32.8597), // Ankara'nın konumu
        infoWindow: InfoWindow(
          title: 'Ankara',
          snippet: 'Ankara, Türkiye',
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Harita türünü değiştirme
  void _changeMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  // Haritayı Karabük'e odaklama
  void _focusOnKarabuk() {
    mapController.animateCamera(
      CameraUpdate.newLatLng(_karabukLocation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karabük Haritası'),
        backgroundColor: Colors.blueAccent,
        actions: [
          // Harita türünü değiştirme butonu
          IconButton(
            icon: const Icon(Icons.layers),
            onPressed: _changeMapType,
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _karabukLocation, // Başlangıçta Karabük'e odaklan
          zoom: 12.0, // Yakınlaştırma seviyesi
        ),
        markers: _markers, // Marker'ları ekle
        mapType: _currentMapType, // Harita türü
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _focusOnKarabuk, // Karabük'e odaklan
        child: const Icon(Icons.location_on),
      ),
    );
  }
}