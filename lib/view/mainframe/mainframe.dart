import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school360/constants/colors.dart';
import 'package:school360/view/mainframe/mainframePages.dart';

import '../../constants/textStyle.dart';

class Mainframe extends StatefulWidget {
  const Mainframe({Key? key}) : super(key: key);

  @override
  State<Mainframe> createState() => _MainframeState();
}

class _MainframeState extends State<Mainframe> {
  int selectedPageIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                  interval: 500,
                  subdivisions: 8,
                ),
              ),
            ),
            PageView.builder(
              itemCount: 5,
              controller: pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  selectedPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return mainframePages[index];
              },
            ),
          ],
        ),
        bottomNavigationBar: getCustomBottomNavigationBar(),
      ),
    );
  }

  Container getCustomBottomNavigationBar() {
    return Container(
      height: 70,
      child: FlipBoxBarPlus(
        navBarHeight: 70,
        items: [
          FlipBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
                color: secondaryColor,
              ),
              text: Text(
                "Home",
                style: defaultTS.copyWith(fontSize: 10),
              ),
              frontColor: primaryColor,
              backColor: Color(0xffEF7C8E)),
          FlipBarItem(
              icon: Icon(
                FontAwesomeIcons.chalkboard,
                size: 20,
                color: secondaryColor,
              ),
              text: Text(
                "Classwork",
                style: defaultTS.copyWith(fontSize: 10),
              ),
              frontColor: Color(0xffB6E2D3),
              backColor: Color(0xffD8A7B1).withAlpha(6)),
          FlipBarItem(
            icon: Icon(
              FontAwesomeIcons.graduationCap,
              size: 20,
              color: secondaryColor,
            ),
            text: Text(
              "Result",
              style: defaultTS.copyWith(fontSize: 10),
            ),
            frontColor: Color(0xffE5DDC8),
            backColor: Color(0xffDB1F48),
          ),
          FlipBarItem(
            icon: Icon(
              FontAwesomeIcons.clipboardUser,
              size: 20,
              color: secondaryColor,
            ),
            text: Text(
              "Attendance",
              style: defaultTS.copyWith(fontSize: 10),
            ),
            frontColor: Color(0xffF2C5E0),
            backColor: Color(0xffD43790),
          ),
          FlipBarItem(
            icon: Icon(
              FontAwesomeIcons.creditCard,
              size: 20,
              color: secondaryColor,
            ),
            text: Text(
              "Payment",
              style: defaultTS.copyWith(fontSize: 10),
            ),
            frontColor: Colors.pink,
            backColor: Colors.amber,
          ),
        ],
        onIndexChanged: (pageIndex) {
          setState(() {
            selectedPageIndex = pageIndex;
            pageController.jumpToPage(pageIndex);
          });
        },
        animationDuration: Duration(milliseconds: 1000),
        selectedIndex: selectedPageIndex,
      ),
    );
  }
}
