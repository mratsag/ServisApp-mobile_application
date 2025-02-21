import 'package:flutter/material.dart';

class DailyReportsScreen extends StatelessWidget {
  final Map<String, bool> boardingStatus;
  final List<String> routeHistory;

  const DailyReportsScreen({
    super.key,
    required this.boardingStatus,
    required this.routeHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Günlük Raporlar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Öğrenci Biniş Bilgileri',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          ...boardingStatus.entries.map((entry) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(entry.key),
                subtitle: Text(
                  entry.value ? 'Servise bindi.' : 'Servise binmedi.',
                ),
                trailing: Icon(
                  entry.value ? Icons.check_circle : Icons.cancel,
                  color: entry.value ? Colors.green : Colors.red,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 16.0),
          const Text(
            'Rota Geçmişi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          ...routeHistory.map((history) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(history),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}