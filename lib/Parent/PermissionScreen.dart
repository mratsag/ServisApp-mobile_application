import 'package:flutter/material.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool _isPermissionActive = false;

  void _togglePermission(bool value) {
    setState(() {
      _isPermissionActive = value;
    });
    // Mock bildirim gönderimi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'İzin aktif edildi.' : 'İzin pasif edildi.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İzin İşlemleri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Çocuğum servise binmeyecek.'),
              value: _isPermissionActive,
              onChanged: _togglePermission,
            ),
          ],
        ),
      ),
    );
  }
}