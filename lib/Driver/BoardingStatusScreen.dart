import 'package:flutter/material.dart';
import 'package:servis_app/Driver/driver.dart'; // Driver sınıfını içe aktarın

class BoardingStatusScreen extends StatefulWidget {
  final Driver driver;

  const BoardingStatusScreen({super.key, required this.driver});

  @override
  _BoardingStatusScreenState createState() => _BoardingStatusScreenState();
}

class _BoardingStatusScreenState extends State<BoardingStatusScreen> {
  late Map<String, bool> boardingStatus;

  @override
  void initState() {
    super.initState();
    boardingStatus = widget.driver.boardingStatus;
  }

  void _toggleBoardingStatus(String student) {
    setState(() {
      boardingStatus[student] = !boardingStatus[student]!;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          boardingStatus[student]!
              ? '$student servise bindi.'
              : '$student servise binmedi.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Biniş Durumu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: widget.driver.students.map((student) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: ListTile(
              title: Text(student),
              trailing: ElevatedButton(
                onPressed: () => _toggleBoardingStatus(student),
                style: ElevatedButton.styleFrom(
                  backgroundColor: boardingStatus[student]! ? Colors.green : Colors.red,
                ),
                child: Text(
                  boardingStatus[student]! ? 'Bindi' : 'Binmedi',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}