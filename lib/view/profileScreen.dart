import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school360/controller/authenticationController.dart';
import 'package:school360/controller/userController.dart';
import 'package:school360/widgets/buttonLoadingAnimation.dart';

import '../constants/colors.dart';
import '../constants/dimentions.dart';
import '../constants/textStyle.dart';
import '../routes/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserController userController;
  late AuthenticationController authenticationController;
  bool isLoading = false;
  @override
  void initState() {
    userController = Get.find();
    authenticationController = Get.find();
    super.initState();
  }

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
                      userController.user.value.name.toString(),
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
                              'Student ID',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor.withOpacity(.5),
                              ),
                            ),
                            Text(
                              userController.user.value.studentId.toString(),
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
                              'School ID',
                              style: defaultTS.copyWith(
                                color: scaffoldBackgroundColor.withOpacity(.5),
                              ),
                            ),
                            Text(
                              userController.user.value.schoolId.toString(),
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
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(Duration(seconds: 2));
                          await authenticationController.logoutUser();

                          setState(() {
                            isLoading = false;
                          });
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
                          child: isLoading
                              ? CustomLoadingAnimation(
                                  loadingColor: secondaryColor)
                              : Text(
                                  'Logout',
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
