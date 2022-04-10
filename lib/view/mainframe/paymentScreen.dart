import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/dimentions.dart';
import '../../constants/textStyle.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBar(),
            Stepper(
              physics: NeverScrollableScrollPhysics(),
              elevation: 5,
              steps: [
                Step(
                  isActive: (_currentStep == 0) ? true : false,
                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Please select a ',
                          style: defaultTS,
                        ),
                        TextSpan(
                          text: 'Year ',
                        ),
                        TextSpan(
                          text: 'to continue.',
                          style: defaultTS,
                        ),
                      ],
                    ),
                  ),
                  content: Container(
                    padding: const EdgeInsets.only(right: 15),
                    alignment: Alignment.centerLeft,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          style: defaultTS,
                          isExpanded: false,
                          elevation: 4,
                          value: "Select a class",
                          items: [
                            "Select a class",
                            "Class 1",
                            "Class 2",
                            "Class 3",
                          ].map(buildMonthMenuItem).toList(),
                          onChanged: (value) {}),
                    ),
                  ),
                ),
                Step(
                  isActive: (_currentStep == 1) ? true : false,
                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Please select a ',
                          style: defaultTS,
                        ),
                        TextSpan(
                          text: 'Month ',
                        ),
                        TextSpan(
                          text: 'to continue.',
                          style: defaultTS,
                        ),
                      ],
                    ),
                  ),
                  content: Container(
                    padding: const EdgeInsets.only(right: 15),
                    alignment: Alignment.centerLeft,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          style: defaultTS,
                          isExpanded: false,
                          elevation: 4,
                          value: "Select a class",
                          items: [
                            "Select a class",
                            "Class 1",
                            "Class 2",
                            "Class 3",
                          ].map(buildMonthMenuItem).toList(),
                          onChanged: (value) {}),
                    ),
                  ),
                ),
                Step(
                  isActive: (_currentStep == 2) ? true : false,
                  title: Text('Bill Summary.', style: defaultTS),
                  content: Container(
                    padding: const EdgeInsets.only(right: 15),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Showing ', style: defaultTS),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Text(
                            'Payment Summary',
                          ),
                        ),
                        Text('for the month: and year: .', style: defaultTS),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: 'Name: ', style: defaultTS),
                              TextSpan(
                                text: '.',
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Receipt number: ', style: defaultTS),
                              TextSpan(
                                text: '.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: 'Due: ', style: defaultTS),
                              TextSpan(
                                text: '',
                              ),
                              TextSpan(text: 'TK.', style: defaultTS),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Container(
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xffEF7C8E),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: secondaryColor.withOpacity(.2),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'view details',
                                style: headerTS.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: scaffoldBackgroundColor,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  isActive: (_currentStep == 3) ? true : false,
                  title: Text('Make Payment.', style: defaultTS),
                  content: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Checkout.',
                        ),
                        Text('Please make your payment by pressing continue.',
                            style: defaultTS)
                      ],
                    ),
                  ),
                ),
              ],
              onStepContinue: () {
                if (_currentStep == 0) {
                  setState(() {
                    _currentStep += 1;
                  });
                  return;
                }
                if (_currentStep == 1) {
                  setState(() {
                    _currentStep += 1;
                  });
                  return;
                }
                if (_currentStep == 2) {
                  setState(() {
                    _currentStep += 1;
                  });
                  return;
                }
                if (_currentStep == 3) {
                  Sslcommerz sslcommerz = Sslcommerz(
                    initializer: SSLCommerzInitialization(
                      //For Test
                      ipn_url: "www.ipnurl.com",
                      multi_card_name: "visa,master,bkash",
                      currency: SSLCurrencyType.BDT,
                      product_category: "Food",
                      sdkType: SSLCSdkType.TESTBOX,
                      store_id: "testbox",
                      store_passwd: "qwerty",
                      total_amount: 10,
                      tran_id: "1231321321321312",

                      //For Live
                      // currency: SSLCurrencyType.BDT,
                      // // multi_card_name: "visa,master,bkash",
                      // product_category: "Bill",
                      // sdkType: SSLCSdkType.LIVE,
                      // store_id: _id,
                      // store_passwd: _pw,
                      // total_amount: total,
                      // tran_id: "${DateTime.now()}${receipt_no}",
                    ),
                  );

                  var result = sslcommerz.payNow();
                }
              },
              onStepCancel: () {
                if (_currentStep == 0) {
                  // Navigator.of(context).pop();
                }
                if (_currentStep == 1) {
                  setState(() {
                    _currentStep -= 1;
                  });
                  return;
                }
                if (_currentStep == 2) {
                  setState(() {
                    _currentStep -= 1;
                  });
                  return;
                }
                if (_currentStep != 0) {
                  setState(
                    () {
                      _currentStep -= 1;
                    },
                  );
                }
              },
              currentStep: _currentStep,
            ),
          ],
        ),
      ),
    );
  }

  Container getAppBar() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(top: 15),
      margin: getGlobalPadding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Payment",
            style: headerTS,
          ),
          // InkWell(
          //   onTap: () {
          //     Get.toNamed(Routes.getAnnouncementScreenRoute);
          //   },
          //   child: Icon(
          //     FontAwesomeIcons.book,
          //   ),
          // ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMonthMenuItem(String month) => DropdownMenuItem(
        value: month,
        child: Text(month),
      );
}
