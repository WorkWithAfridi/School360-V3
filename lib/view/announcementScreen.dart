import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school360/controller/noticeController.dart';
import 'package:school360/controller/userController.dart';
import 'package:school360/functions/randomColor.dart';

import '../constants/colors.dart';
import '../constants/textStyle.dart';
import '../functions/download_file.dart';
import '../widgets/buttonLoadingAnimation.dart';

class AnnouncementScreen extends StatefulWidget {
  AnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  NoticeController noticeController = Get.find();
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Announcements",
          style:
              headerTS.copyWith(fontSize: 16, color: scaffoldBackgroundColor),
        ),
        centerTitle: true,
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
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    noticeController.noticeModelFromApiResponse.value.data!
                                .length ==
                            0
                        ? Text(
                            "Stand by for updates...",
                            style: defaultTS.copyWith(
                              color: secondaryColor.withOpacity(.6),
                              fontSize: 11,
                            ),
                          )
                        : ListView.builder(
                            itemCount: noticeController
                                .noticeModelFromApiResponse.value.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return getNoticeListTile(index: index);
                            },
                          ),
                    SizedBox(
                      height: 5,
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

class getNoticeListTile extends StatefulWidget {
  getNoticeListTile({Key? key, required this.index}) : super(key: key);
  late int index;

  @override
  State<getNoticeListTile> createState() => _getNoticeListTileState();
}

class _getNoticeListTileState extends State<getNoticeListTile> {
  NoticeController noticeController = Get.find();
  UserController userController = Get.find();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 5),
      child: InkWell(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
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
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.7),
            border: Border.all(
              color: secondaryColor.withOpacity(.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 84,
                width: 5,
                decoration: BoxDecoration(
                  color: getRandomColor(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: secondaryColor.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        (widget.index + 1).toString(),
                        style: headerTS.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 90,
                      width: .2,
                      color: secondaryColor.withOpacity(.5),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noticeController.noticeModelFromApiResponse.value
                                  .data![widget.index].title
                                  .toString(),
                              style: defaultTS.copyWith(
                                color: secondaryColor.withOpacity(.8),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              noticeController.noticeModelFromApiResponse.value
                                  .data![widget.index].date
                                  .toString(),
                              style: defaultTS.copyWith(
                                color: secondaryColor.withOpacity(.6),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isLoading
                        ? Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: CustomLoadingAnimation(
                                loadingColor: getRandomColor()),
                          )
                        : IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.cloudArrowDown,
                              size: 16,
                              color: getRandomColor(),
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
