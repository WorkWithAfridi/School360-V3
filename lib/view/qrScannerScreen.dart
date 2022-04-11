import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../constants/colors.dart';
import '../constants/dimentions.dart';
import '../constants/textStyle.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QR Scanner",
          style: headerTS.copyWith(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffB6E2D3),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FontAwesomeIcons.xmark,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GridPaper(
                  color: secondaryColor.withOpacity(0.08),
                  divisions: 4,
                  interval: 800,
                  subdivisions: 8,
                ),
              ),
            ),
            Center(
              child: Container(
                height: Get.height * .6,
                width: Get.width * .8,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(.4),
                    width: 1,
                  ),
                  borderRadius: getBorderRadius(),
                ),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
            Center(
              child: Container(
                height: Get.width * .5,
                width: Get.width * .5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: getBorderRadius(),
                ),
              ),
            ),
            // Center(
            //   child: (result != null)
            //       ? Text(
            //           'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
            //       : Text('Scan a code'),
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.flash_on,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.cameraswitch_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          await controller?.flipCamera();
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .07,
                  ),
                  Padding(
                    padding: getGlobalPadding(),
                    child: Text(
                      '*Please scan your ID card to continue.',
                      style: defaultTS.copyWith(
                        color: secondaryColor.withOpacity(.6),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
