import 'package:flutter/material.dart';
import 'package:manco_tracer/screens/readcontact/decryptor/decrypt.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRReader extends StatefulWidget {
  @override
  _QRReaderState createState() => _QRReaderState();
}

class _QRReaderState extends State<QRReader> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  String scanqr;
  bool scanned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => controller.flipCamera(),
                    child: const Text("Flip Camera"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    // this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      this.scanqr = scanData;
      controller.pauseCamera();
      if (this.scanqr != null && this.scanned == false) {
        this.scanned = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DecryptScreen(value: this.scanqr)),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
