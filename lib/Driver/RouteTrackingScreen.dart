import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'directions.dart'; // Directions sınıfını içe aktarın

class RouteTrackingScreen extends StatefulWidget {
  const RouteTrackingScreen({super.key});

  @override
  _RouteTrackingScreenState createState() => _RouteTrackingScreenState();
}

class _RouteTrackingScreenState extends State<RouteTrackingScreen> {
  late GoogleMapController mapController;
  final Directions _directions = Directions();
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  // Durakların koordinatları
  final LatLng _stop1 = const LatLng(41.2061, 32.6204); // Karabük Merkez
  final LatLng _stop2 = const LatLng(41.2508, 32.6942); // Safranbolu
  final LatLng _stop3 = const LatLng(41.1925, 32.6237); // Karabük Üniversitesi

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() async {
    // Marker'ları ekle
    _markers.add(
      Marker(
        markerId: const MarkerId('stop1'),
        position: _stop1,
        infoWindow: const InfoWindow(title: 'Karabük Merkez'),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('stop2'),
        position: _stop2,
        infoWindow: const InfoWindow(title: 'Safranbolu'),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('stop3'),
        position: _stop3,
        infoWindow: const InfoWindow(title: 'Karabük Üniversitesi'),
      ),
    );

    // Rotayı çiz
    await _drawRoute(_stop1, _stop2);
    await _drawRoute(_stop2, _stop3);
  }

  Future<void> _drawRoute(LatLng origin, LatLng destination) async {
    try {
      final directions = await _directions.getDirections(origin, destination);
      print(directions); // API yanıtını konsola yazdır

      if (directions['routes'] != null && directions['routes'].isNotEmpty) {
        final points = directions['routes'][0]['overview_polyline']['points'];
        final List<LatLng> routeCoords = _decodePolyline(points);

        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId('route_${origin.latitude}'),
              points: routeCoords,
              color: Colors.blue,
              width: 5,
            ),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rota bulunamadı. Lütfen başlangıç ve bitiş noktalarını kontrol edin.')),
        );
      }
    } catch (e) {
      print('Hata: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rota çizilirken bir hata oluştu.')),
      );
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    final List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rota Takibi'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _stop1, // Başlangıçta Karabük Merkez'e odaklan
          zoom: 12.0,
        ),
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}