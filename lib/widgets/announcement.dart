import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:school360/controller/noticeController.dart';
import 'package:school360/controller/userController.dart';
import 'package:school360/widgets/buttonLoadingAnimation.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';
import '../functions/download_file.dart';
import '../functions/randomColor.dart';

class GetAnnouncement extends StatefulWidget {
  final int index;
  GetAnnouncement({Key? key, required this.index}) : super(key: key);

  @override
  State<GetAnnouncement> createState() => _GetAnnouncementState();
}

class _GetAnnouncementState extends State<GetAnnouncement> {
  NoticeController noticeController = Get.find();
  UserController userController = Get.find();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          await Future.delayed(Duration(seconds: 1));
          String url =
              "https://school360.app/${userController.user.value.schoolId}/homes/download/notice~${noticeController.noticeModelFromApiResponse.value.data![widget.index].url}";
          Download download = Download();
          download.downloadAndOpenFile(
            url,
            userController.user.value.schoolId,
          );
          await Future.delayed(Duration(seconds: 1));

          setState(() {
            isLoading = false;
          });
        },
        child: Container(
          height: 200,
          width: Get.width * .6,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.7),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: secondaryColor.withOpacity(.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/announcement_images/announcement${widget.index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              noticeController.noticeModelFromApiResponse.value
                                  .data![widget.index].title
                                  .toString(),
                              style: defaultTS.copyWith(
                                // fontWeight: FontWeight.bold,
                                color: secondaryColor.withOpacity(.9),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.clock,
                                  size: 15,
                                  color: secondaryColor.withOpacity(.6),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  noticeController.noticeModelFromApiResponse
                                      .value.data![widget.index].date
                                      .toString(),
                                  style: defaultTS.copyWith(
                                    color: secondaryColor.withOpacity(.6),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      isLoading
                          ? Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CustomLoadingAnimation(
                                loadingColor: getRandomColor()),
                          )
                          : SizedBox(
                              width: 40,
                              child: Icon(
                                FontAwesomeIcons.cloudArrowDown,
                                color: getRandomColor(),
                                size: 16,
                              ),
                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
