import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:school360/controller/qrController.dart';

class QrScannerWidget extends StatefulWidget {
  const QrScannerWidget({Key? key}) : super(key: key);

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  @override
  void initState() {
    qrController = Get.find();
    super.initState();
  }

  late QrController qrController;

  // In order to get hot reload to work we need to pause the camera if the platform
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController.controller!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController.controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrController.qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    qrController.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrController.result = scanData;
      });
    });
  }

  @override
  void dispose() {
    qrController.controller!.dispose();
    super.dispose();
  }
}
