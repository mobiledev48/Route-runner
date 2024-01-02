import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../common/drop_down_menu.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';
import '../dash_board/dash_board_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());

    return Scaffold(
        appBar: customAppbar(
            title: StringRes.location,
            leadingOnpress: () {
              DashBoardController dashBoardController = Get.put(DashBoardController());
              dashBoardController.currentIndex = 0;
              dashBoardController.update(['dash']);
              locationController.update(['location']);
            },
            action: false),
        body: GetBuilder<LocationController>(
          id: 'location',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  CommonTextField(
                    containerHeight: Get.height * 0.07,
                    isSuffixIcon: true,
                    suffixIcon: AssetRes.search,
                    suffixIconSize: 3,
                    hintText: StringRes.search,
                    controller: locationController.searchController,
                    onChanged: (value) {
                      locationController.searchTerm = 'Moonlight';
                      locationController.searchResults = locationController.searchAllData(value);
                      print(locationController.searchResults);
                      locationController.update(['location']);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  locationController.clickableContainer(),
                  controller.currentIndex == 0
                      ? controller.searchController.text.isEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: locationAllData.length,
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
                                                        locationAllData[index].title,
                                                        // 'Moonlight Bar',
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: ColorRes.black),
                                                      ),
                                                      SizedBox(height: 5),
                                                      SizedBox(
                                                        width: Get.width * 0.24,
                                                        child: Text(
                                                            overflow: TextOverflow.ellipsis,
                                                            locationAllData[index].subtitle,
                                                            // 'Admin: Arrora gaur',
                                                            style: subTitle()),
                                                      ),
                                                      Text('Machine: ${index * 6 + 12}', style: subTitle())
                                                    ],
                                                  ),
                                                  Container(
                                                    height: Get.height * 0.04,
                                                    width: Get.width * 0.2,
                                                    decoration: BoxDecoration(
                                                      color: locationAllData[index].color,
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      locationAllData[index].active,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: locationAllData[index].iconColor,
                                                          fontSize: 12),
                                                    )),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height * 0.02,
                                                      ),
                                                      DropDownMenu(),
                                                      SizedBox(height: Get.height * 0.04),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            AssetRes.calendar,
                                                            scale: 2.5,
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text('12 Dec, 2020', style: subTitle())
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
                          : locationController.searchResults.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                      itemCount: controller.searchResults.length,
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
                                                            controller.searchResults[index].title,
                                                            // 'Moonlight Bar',
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600,
                                                                color: ColorRes.black),
                                                          ),
                                                          SizedBox(height: 5),
                                                          SizedBox(
                                                            width: Get.width * 0.24,
                                                            child: Text(
                                                                overflow: TextOverflow.ellipsis,
                                                                controller.searchResults[index].subtitle,
                                                                // 'Admin: Arrora gaur',
                                                                style: subTitle()),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Machine: ${index * 6 + 12}',
                                                              // 'SN: #${index + 1}-654184',
                                                              style: subTitle())
                                                        ],
                                                      ),
                                                      Container(
                                                        height: Get.height * 0.04,
                                                        width: Get.width * 0.2,
                                                        decoration: BoxDecoration(
                                                          color: controller.searchResults[index].color,
                                                          borderRadius: BorderRadius.circular(30),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          controller.searchResults[index].active,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              color: controller.searchResults[index].iconColor,
                                                              fontSize: 12),
                                                        )),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          SizedBox(
                                                            height: Get.height * 0.02,
                                                          ),
                                                          DropDownMenu(),
                                                          SizedBox(height: Get.height * 0.04),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                AssetRes.calendar,
                                                                scale: 2.5,
                                                              ),
                                                              SizedBox(
                                                                width: 2,
                                                              ),
                                                              Text('12 Dec, 2020', style: subTitle())
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
                              : Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    StringRes.notFound,
                                    style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                                )
                      : controller.searchController.text.isEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: locationAllData.length,
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
                                                      const SizedBox(height: 10),
                                                      Text(
                                                        locationAllData[index].title,
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: ColorRes.black),
                                                      ),
                                                      SizedBox(height: 5),
                                                      SizedBox(
                                                        width: Get.width * 0.24,
                                                        child: Text(
                                                            overflow: TextOverflow.ellipsis,
                                                            locationAllData[index].subtitle,
                                                            style: subTitle()),
                                                      ),
                                                      Text('Machine: ${index * 6 + 12}', style: subTitle())
                                                    ],
                                                  ),
                                                  Container(
                                                    height: Get.height * 0.04,
                                                    width: Get.width * 0.2,
                                                    decoration: BoxDecoration(
                                                      color: locationAllData[index].color,
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      locationAllData[index].active,
                                                      style: TextStyle(
                                                          color: locationAllData[index].iconColor,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12),
                                                    )),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height * 0.02,
                                                      ),
                                                      DropDownMenu(),
                                                      SizedBox(height: Get.height * 0.04),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            AssetRes.calendar,
                                                            scale: 2.5,
                                                          ),
                                                          const SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text('12 Dec, 2020', style: subTitle())
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
                          : locationController.searchResults.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                      itemCount: controller.searchResults.length,
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
                                                            controller.searchResults[index].title,
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600,
                                                                color: ColorRes.black),
                                                          ),
                                                          SizedBox(height: 5),
                                                          SizedBox(
                                                            width: Get.width * 0.24,
                                                            child: Text(
                                                                overflow: TextOverflow.ellipsis,
                                                                controller.searchResults[index].subtitle,
                                                                style: subTitle()),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Machine: ${index * 6 + 12}',
                                                              // 'SN: #${index + 1}-654184',
                                                              style: subTitle())
                                                        ],
                                                      ),
                                                      Container(
                                                        height: Get.height * 0.04,
                                                        width: Get.width * 0.2,
                                                        decoration: BoxDecoration(
                                                          color: controller.searchResults[index].color,
                                                          borderRadius: BorderRadius.circular(30),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          controller.searchResults[index].active,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              color: controller.searchResults[index].iconColor,
                                                              fontSize: 12),
                                                        )),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          SizedBox(
                                                            height: Get.height * 0.02,
                                                          ),
                                                          DropDownMenu(),
                                                          SizedBox(height: Get.height * 0.04),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                AssetRes.calendar,
                                                                scale: 2.5,
                                                              ),
                                                              SizedBox(
                                                                width: 2,
                                                              ),
                                                              Text('12 Dec, 2020', style: subTitle())
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
                              : Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    StringRes.notFound,
                                    style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                                )
                ],
              ),
            );
          },
        ));
  }
}
//967
