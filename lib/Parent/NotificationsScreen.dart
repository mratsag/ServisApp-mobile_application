import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirimler'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            title: Text('Servis 5 dakika içinde durağa varacak.'),
            subtitle: Text('10:00 AM'),
          ),
          ListTile(
            title: Text('Servis durağa ulaştı.'),
            subtitle: Text('10:05 AM'),
          ),
        ],
      ),
    );
  }
}