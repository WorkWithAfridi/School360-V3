import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:school360/controller/authenticationController.dart';
import 'package:school360/controller/qrController.dart';

import '../constants/textStyle.dart';

class QrScannerWidget extends StatefulWidget {
  const QrScannerWidget({Key? key}) : super(key: key);

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();
}

class _QrScannerWidgetState extends State<QrScannerWidget> {
  @override
  void initState() {
    qrController = Get.find();
    qrController.willScan = true;
    authenticationController = Get.find();
    super.initState();
  }

  late AuthenticationController authenticationController;
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
    controller.scannedDataStream.listen((scanData) async {
      if (qrController.willScan) {
        setState(() {
          qrController.willScan = false;
        });
        setState(() {
          qrController.result = scanData;
        });
        print("Triggering decryption");
        bool isSuccess = await authenticationController
            .decryptUserCredentials(scanData.code.toString());
        print(" decryption completed");
        if (!isSuccess) {
          Get.dialog(
            AlertDialog(
              title: Text(
                "Error",
                style: headerTS,
              ),
              content: Text(
                "An error occurred, please try again!",
                style: defaultTS,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      qrController.willScan = true;
                    });
                    Get.back();
                  },
                  child: Text("Try again"),
                ),
              ],
            ),
            barrierDismissible: false,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    qrController.controller!.dispose();
    super.dispose();
  }
}
