import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart'; // LatLng için

class Directions {
  final String apiKey = 'AIzaSyAEnrOdgFF7B2Nz-SzkYTYHilbjLrjDrm8'; // API anahtarınızı buraya ekleyin

  Future<Map<String, dynamic>> getDirections(LatLng origin, LatLng destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load directions');
    }
  }
}