import 'package:flutter/material.dart';
import 'package:servis_app/Driver/driver.dart'; // Doğru içe aktarma
import 'package:servis_app/Driver/RouteTrackingScreen.dart'; // Rota takibi ekranı
import 'package:servis_app/Driver/BoardingStatusScreen.dart'; // Öğrenci biniş durumu ekranı
import 'package:servis_app/Driver/DailyReportsScreen.dart'; // Günlük raporlar ekranı

class DriverHomeScreen extends StatelessWidget {
  final Driver driver;

  const DriverHomeScreen({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şoför Ana Sayfa'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Rota Takibi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RouteTrackingScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bus),
            title: const Text('Öğrenci Biniş İşaretleme'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardingStatusScreen(driver: driver),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Günlük Raporlar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyReportsScreen(
                    boardingStatus: driver.boardingStatus,
                    routeHistory: driver.routeHistory,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}