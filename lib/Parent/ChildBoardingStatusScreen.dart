import 'package:flutter/material.dart';

class ChildBoardingStatusScreen extends StatelessWidget {
  const ChildBoardingStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çocuğumun Biniş Durumu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('Çocuğunuz servise bindi.'),
              subtitle: Text('10:05 AM'),
            ),
          ],
        ),
      ),
    );
  }
}