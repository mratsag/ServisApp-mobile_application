import 'package:flutter/material.dart';
import 'package:servis_app/Parent/ServiceLocationScreen.dart';
import 'package:servis_app/Parent/ChildBoardingStatusScreen.dart';
import 'package:servis_app/Parent/NotificationsScreen.dart';
import 'package:servis_app/Parent/PermissionScreen.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veli Ana Sayfa'),
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
            title: const Text('Çocuğumun Biniş Durumu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChildBoardingStatusScreen()),
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
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('İzin İşlemleri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PermissionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}