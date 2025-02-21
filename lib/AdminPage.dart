import 'package:flutter/material.dart';
import 'package:servis_app/MapScreen.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Paneli'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hoş Geldiniz, Admin!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Harita sayfasına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
              child: const Text('Haritayı Aç'),
            ),
          ],
        ),
      ),
    );
  }
}