import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servis_app/Student/ServiceLocationScreen.dart';
import 'package:servis_app/Student/NotificationsScreen.dart';
import 'package:servis_app/Student/BoardingStatusScreen.dart';
import 'package:servis_app/Student/QRCodeScanScreen.dart'; // QR kod tarayıcı ekranı

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Ana Sayfa'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Servis Konumunu Görüntüle
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Servis Konumunu Görüntüle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServiceLocationScreen(),
                ),
              );
            },
          ),
          // Servise Biniş Durumu
          ListTile(
            leading: const Icon(Icons.directions_bus),
            title: const Text('Servise Biniş Durumu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BoardingStatusScreen(),
                ),
              );
            },
          ),
          // QR Kod ile Biniş Yap
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('QR Kod ile Biniş Yap'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRCodeScanScreen(),
                ),
              );
            },
          ),
          // Bildirimler
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Bildirimler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}