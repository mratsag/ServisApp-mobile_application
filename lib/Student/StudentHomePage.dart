import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servis_app/Student/ServiceLocationScreen.dart';
import 'package:servis_app/Student/NotificationsScreen.dart';
import 'package:servis_app/Student/BoardingStatusScreen.dart';

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
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Servis Konumunu Görüntüle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServiceLocationScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bus),
            title: const Text('Servise Biniş Durumu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BoardingStatusScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Bildirimler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}