import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanScreen extends StatefulWidget {
  const QRCodeScanScreen({super.key});

  @override
  _QRCodeScanScreenState createState() => _QRCodeScanScreenState();
}

class _QRCodeScanScreenState extends State<QRCodeScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // QR kod okunduğunda yapılacak işlemler
      _handleScannedData(scanData.code);
    });
  }

  void _handleScannedData(String? data) {
    if (data != null) {
      // Burada şoförün sistemine "bindi" bilgisini gönderecek API çağrısı yapılacak
      _sendBoardingStatusToDriver(data);

      // Kullanıcıya geri bildirim ver
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Servise biniş onaylandı.')),
      );

      // Ekranı kapat ve önceki ekrana dön
      Navigator.pop(context);
    }
  }

  void _sendBoardingStatusToDriver(String studentId) {
    // Burada şoförün sistemine "bindi" bilgisini gönderecek API çağrısı yapılacak
    // Örnek olarak:
    // ApiService.sendBoardingStatus(studentId, true);
    print('Öğrenci ID: $studentId servise bindi.');
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Kod Tarayıcı'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}