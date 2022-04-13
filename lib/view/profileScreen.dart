import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/colors.dart';
import '../constants/dimentions.dart';
import '../constants/textStyle.dart';
import '../routes/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style:
              headerTS.copyWith(fontSize: 16, color: scaffoldBackgroundColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: secondaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.pen,
              size: 15,
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FontAwesomeIcons.xmark,
            color: Colors.white,
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
            Container(
              height: Get.height,
              width: Get.width,
              child: Container(
                height: Get.height,
                width: Get.width,
                color: secondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/backdrop_images/backdropTwo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Khondakar Afridi',
                      style: headerTS.copyWith(
                        color: scaffoldBackgroundColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Student of',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor.withOpacity(.5),
                              ),
                            ),
                            Text(
                              'Class X',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Roll no.',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor.withOpacity(.5),
                              ),
                            ),
                            Text(
                              '123',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Student id',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor.withOpacity(.5),
                              ),
                            ),
                            Text(
                              '1820461',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: InkWell(
                        onTap: () {
                          Get.offAllNamed(Routes.getLoginScreenRoute);
                        },
                        child: Container(
                          height: 45,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: secondaryColor.withOpacity(.5),
                              width: 1,
                            ),
                            borderRadius: getBorderRadius(),
                            color: Colors.amber,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Sign out',
                            style: headerTS.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
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
