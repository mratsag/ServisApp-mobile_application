import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardingStatusScreen extends StatefulWidget {
  const BoardingStatusScreen({super.key});

  @override
  _BoardingStatusScreenState createState() => _BoardingStatusScreenState();
}

class _BoardingStatusScreenState extends State<BoardingStatusScreen> {
  bool _isBoarding = false;

  void _updateBoardingStatus(bool status) {
    setState(() {
      _isBoarding = status;
    });
    // Mock bildirim gönderimi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(status ? 'Servise biniş onaylandı.' : 'Servise binmeyeceksiniz.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servise Biniş Durumu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Servise Binecek misiniz?'),
              value: _isBoarding,
              onChanged: _updateBoardingStatus,
            ),
          ],
        ),
      ),
    );
  }
}