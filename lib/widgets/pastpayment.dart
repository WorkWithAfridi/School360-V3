import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';
import '../functions/randomColor.dart';

class GetPastPayment extends StatelessWidget {
  final int index;
  GetPastPayment({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 220,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.7),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: secondaryColor.withOpacity(.2),
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(3),
      child: Container(
        child: Row(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: getRandomColor(),
              ),
              width: 70,
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "TK:",
                    style: headerTS.copyWith(fontSize: 13),
                  ),
                  Text(
                    Random().nextInt(10000).toString(),
                    style: headerTS.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 5, bottom: 5, right: 5, left: 3),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID:',
                          style: defaultTS.copyWith(
                            color:
                            secondaryColor.withOpacity(.6),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'Some title - abc xyz 123',
                          style: defaultTS.copyWith(
                            color:
                            secondaryColor.withOpacity(.9),
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Paid on:',
                          style: defaultTS.copyWith(
                            color:
                            secondaryColor.withOpacity(.6),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '12/12/12',
                          style: defaultTS.copyWith(
                            color:
                            secondaryColor.withOpacity(.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
