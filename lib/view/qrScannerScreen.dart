import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:school360/controller/authenticationController.dart';
import 'package:school360/controller/qrController.dart';
import 'package:school360/widgets/qrScanner.dart';

import '../constants/colors.dart';
import '../constants/dimentions.dart';
import '../constants/textStyle.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    qrController = Get.find();
    authenticationController = Get.find();
    super.initState();
  }

  late QrController qrController;
  late AuthenticationController authenticationController;

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
                  child: QrScannerWidget()),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          await qrController.controller!.toggleFlash();
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
                          await qrController.controller!.flipCamera();
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .03,
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
                    height: Get.height * .04,
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
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Checkbox(
                            value: authenticationController.keepUserLoggedIn,
                            activeColor: Color(0xffB6E2D3),
                            onChanged: (value) {
                              setState(() {
                                authenticationController.keepUserLoggedIn =
                                    value!;
                              });
                            },
                            checkColor: secondaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              authenticationController.keepUserLoggedIn =
                                  !authenticationController.keepUserLoggedIn;
                            });
                          },
                          child: Text(
                            "Keep me logged in",
                            style: defaultTS,
                          ),
                        ),
                      ],
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
}
