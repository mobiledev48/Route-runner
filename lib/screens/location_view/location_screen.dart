import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';
import '../dash_board/dash_board_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                DashBoardController dashBoardController = Get.put(DashBoardController());
                dashBoardController.currentIndex = 0;
                dashBoardController.update(['dash']);
                locationController.update(['location']);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
              )),
          centerTitle: true,
          backgroundColor: ColorRes.mainColor,
          title: Text(
            StringRes.location,
            style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
          ),

          // automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<LocationController>(
            id: 'location',
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: Get.width * 0.9,
                            height: Get.height * 0.06,
                            child: CommomTextFormFeild(
                              controller: locationController.searchController,
                              onChanged: (value) {
                                locationController.searchTerm = 'Moonlight'; // Change this to your desired search term
                                locationController.searchResults = locationController.searchAllData(value);
                                print(locationController.searchResults);
                                locationController.update(['location']);
                              },
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.nextPage(0);
                                controller.update(['machine']);
                              },
                              child: Container(
                                height: Get.height * 0.06,
                                width: Get.width * 0.455,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                                    color: controller.currentIndex == 0 ? ColorRes.mainColor : ColorRes.white),
                                child: Center(
                                    child: Text(
                                  StringRes.paid,
                                  style:
                                      TextStyle(color: controller.currentIndex == 0 ? ColorRes.white : ColorRes.black),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.nextPage(1);
                                controller.update(['machine']);
                              },
                              child: Container(
                                height: Get.height * 0.06,
                                width: Get.width * 0.455,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                                    color: controller.currentIndex == 1 ? ColorRes.mainColor : ColorRes.white),
                                child: Center(
                                    child: Text(StringRes.unPaid,
                                        style: TextStyle(
                                            color: controller.currentIndex == 1 ? ColorRes.white : ColorRes.black))),
                              ),
                            ),
                          ],
                        ),
                        controller.searchResults.isEmpty
                            ? SizedBox(
                                height: Get.height,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _allData.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: 75,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Text(
                                                          _allData[index].title,
                                                          style: commonTitle().copyWith(
                                                              color: ColorRes.black,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 13),
                                                        ),
                                                        SizedBox(height: 5),
                                                        SizedBox(
                                                          width: Get.width * 0.26,
                                                          child: Text(
                                                            overflow: TextOverflow.ellipsis,
                                                            _allData[index].subtitle,
                                                            style: commonSubtitle()
                                                                .copyWith(color: ColorRes.grey, fontSize: 10),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          'Machine: 7',
                                                          style: commonSubtitle().copyWith(color: ColorRes.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      height: Get.height * 0.04,
                                                      width: Get.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: _allData[index].color,
                                                        borderRadius: BorderRadius.circular(30),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        _allData[index].text,
                                                        style:
                                                            TextStyle(color: _allData[index].iconColor, fontSize: 12),
                                                      )),
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: Get.height * 0.02,
                                                        ),
                                                        PopupMenuButton(
                                                          offset: const Offset(0, 10),
                                                          // padding: EdgeInsets.zero,
                                                          constraints: BoxConstraints.expand(width: 120, height: 115),
                                                          padding: EdgeInsets.all(12),

                                                          // position: PopupMenuPosition.under,
                                                          child: const Text(
                                                            "View more",
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w700,
                                                              decoration: TextDecoration.underline,
                                                            ),
                                                          ),
                                                          itemBuilder: (context) {
                                                            return [
                                                              PopupMenuItem(
                                                                child: Container(
                                                                  height: Get.height * 0.06,
                                                                  width: Get.width * 0.9,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(6),
                                                                      color: ColorRes.lightYellow),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      Image.asset(
                                                                        AssetRes.pin,
                                                                        scale: 3,
                                                                      ),
                                                                      Text(
                                                                        'Change Status',
                                                                        style: commonSubtitle(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                  child: Container(
                                                                height: Get.height * 0.06,
                                                                width: Get.width * 0.4,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(6),
                                                                    color: ColorRes.grey),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Image.asset(
                                                                      AssetRes.list,
                                                                      scale: 3,
                                                                    ),
                                                                    Text(
                                                                      'List of machine',
                                                                      style: commonSubtitle(),
                                                                    )
                                                                  ],
                                                                ),
                                                              ))
                                                            ];
                                                          },
                                                        ),
                                                        SizedBox(height: Get.height * 0.02),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              AssetRes.calendar,
                                                              scale: 2.5,
                                                            ),
                                                            const Text(
                                                              '12 Dec, 2020',
                                                              style: TextStyle(
                                                                fontSize: 9,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.black,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                              )
                            : SizedBox(
                                height: Get.height,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: locationController.searchResults.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: 75,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Text(
                                                          locationController.searchResults[index].title,
                                                          style: commonTitle().copyWith(
                                                              color: ColorRes.black,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 13),
                                                        ),
                                                        SizedBox(height: 5),
                                                        SizedBox(
                                                          width: Get.width * 0.26,
                                                          child: Text(
                                                            overflow: TextOverflow.ellipsis,
                                                            locationController.searchResults[index].subtitle,
                                                            style: commonSubtitle()
                                                                .copyWith(color: ColorRes.grey, fontSize: 10),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          'Machine: 7',
                                                          style: commonSubtitle().copyWith(color: ColorRes.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      height: Get.height * 0.04,
                                                      width: Get.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: locationController.searchResults[index].color,
                                                        borderRadius: BorderRadius.circular(30),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        locationController.searchResults[index].active,
                                                        // locationController.searchResults[index].text,
                                                        // style:
                                                        // TextStyle(color: locationController.searchResults[index].iconColor, fontSize: 12),
                                                      )),
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: Get.height * 0.02,
                                                        ),
                                                        PopupMenuButton(
                                                          offset: const Offset(0, 10),
                                                          // padding: EdgeInsets.zero,
                                                          constraints: BoxConstraints.expand(width: 120, height: 115),
                                                          padding: EdgeInsets.all(12),

                                                          // position: PopupMenuPosition.under,
                                                          child: const Text(
                                                            "View more",
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w700,
                                                              decoration: TextDecoration.underline,
                                                            ),
                                                          ),
                                                          itemBuilder: (context) {
                                                            return [
                                                              PopupMenuItem(
                                                                child: Container(
                                                                  height: Get.height * 0.06,
                                                                  width: Get.width * 0.9,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(6),
                                                                      color: ColorRes.lightYellow),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      Image.asset(
                                                                        AssetRes.pin,
                                                                        scale: 3,
                                                                      ),
                                                                      Text(
                                                                        'Change Status',
                                                                        style: commonSubtitle(),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                  child: Container(
                                                                height: Get.height * 0.06,
                                                                width: Get.width * 0.4,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(6),
                                                                    color: ColorRes.grey),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Image.asset(
                                                                      AssetRes.list,
                                                                      scale: 3,
                                                                    ),
                                                                    Text(
                                                                      'List of machine',
                                                                      style: commonSubtitle(),
                                                                    )
                                                                  ],
                                                                ),
                                                              ))
                                                            ];
                                                          },
                                                        ),
                                                        SizedBox(height: Get.height * 0.02),
                                                        Row(
                                                          children: [
                                                            Image.asset(
                                                              AssetRes.calendar,
                                                              scale: 2.5,
                                                            ),
                                                            const Text(
                                                              '12 Dec, 2020',
                                                              style: TextStyle(
                                                                fontSize: 9,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.black,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                              )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

class allData {
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final String text;
  allData(this.title, this.subtitle, this.color, this.iconColor, this.text);
}

List<allData> _allData = [
  allData('Moonlight Bar', 'Admin: Arrora gaur', ColorRes.lightGreen, ColorRes.green, 'Active'),
  allData('Black Sleep Bar', 'Admin: Edward Evan', ColorRes.lightGreen, ColorRes.green, 'Active'),
  allData('Haven Martini', 'Admin: Bethany Jackson', ColorRes.lightYellow, ColorRes.yellow, 'Pending'),
  allData('Refined Mixers', 'Admin: Arrora gaur', ColorRes.lightPink, ColorRes.pink, 'Closed'),
  allData('Haven Martini', 'Admin: Edward Evan', ColorRes.lightGreen, ColorRes.green, 'Active'),
  allData('Black Sleep Bar', 'Admin: Arrora gaur', ColorRes.lightPink, ColorRes.pink, 'Closed'),
];
