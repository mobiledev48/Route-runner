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
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<LocationController>(
          id: 'location',
          builder: (controller) {
            return Padding(
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
                          locationController.searchTerm = 'Moonlight';
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
                            style: TextStyle(color: controller.currentIndex == 0 ? ColorRes.white : ColorRes.black),
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
                              borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                              color: controller.currentIndex == 1 ? ColorRes.mainColor : ColorRes.white),
                          child: Center(
                              child: Text(StringRes.unPaid,
                                  style: TextStyle(
                                      color: controller.currentIndex == 1 ? ColorRes.white : ColorRes.black))),
                        ),
                      ),
                    ],
                  ),
                  controller.currentIndex == 0
                      ? controller.searchController.text.isEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: locationAllData.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          //height: 75,
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
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.grey),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Machine: ${index * 6 + 12}',
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 9,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorRes.grey),
                                                      )
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
                                                      Container(
                                                        padding: EdgeInsets.zero,
                                                        decoration:
                                                            BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                        child: PopupMenuButton(
                                                          offset: const Offset(0, 10),
                                                          padding: EdgeInsets.zero,
                                                          constraints: BoxConstraints.expand(
                                                              width: 120, height: Get.height * 0.205),
                                                          position: PopupMenuPosition.under,
                                                          child: Text(
                                                            "View more",
                                                            style: GoogleFonts.nunito(
                                                                decoration: TextDecoration.underline,
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.w600,
                                                                color: ColorRes.color030229),
                                                          ),
                                                          itemBuilder: (context) {
                                                            return [
                                                              PopupMenuItem(
                                                                height: Get.height * 0,
                                                                padding:
                                                                    EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                child: Container(
                                                                  height: Get.height * 0.05,
                                                                  width: Get.width * 0.6,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(6),
                                                                      color: ColorRes.lightOrange),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      Image.asset(
                                                                        AssetRes.pin,
                                                                        scale: 3,
                                                                      ),
                                                                      Text(
                                                                        StringRes.changeStatus,
                                                                        style: commonSubtitle()
                                                                            .copyWith(color: ColorRes.orange),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                padding:
                                                                    EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                child: Container(
                                                                  height: Get.height * 0.05,
                                                                  width: Get.width * 0.6,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(6),
                                                                      color: ColorRes.lightYellow),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: Get.width * 0.02,
                                                                      ),
                                                                      Image.asset(
                                                                        AssetRes.pay,
                                                                        scale: 3,
                                                                      ),
                                                                      SizedBox(
                                                                        width: Get.width * 0.02,
                                                                      ),
                                                                      Text(
                                                                        StringRes.pay,
                                                                        style: commonSubtitle()
                                                                            .copyWith(color: ColorRes.yellow),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                  height: Get.height * 0,
                                                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                                                  child: Container(
                                                                    height: Get.height * 0.05,
                                                                    width: Get.width * 0.5,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(6),
                                                                        color: ColorRes.grey3),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        Image.asset(
                                                                          AssetRes.list,
                                                                          scale: 3,
                                                                        ),
                                                                        Text(
                                                                          StringRes.listOfMachine,
                                                                          style: commonSubtitle()
                                                                              .copyWith(color: ColorRes.grey2),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ))
                                                            ];
                                                          },
                                                        ),
                                                      ),
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
                                                          const Text(
                                                            '12 Dec, 2020',
                                                            style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.grey,
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
                                                              style: GoogleFonts.nunito(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.grey),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'Machine: ${index * 6 + 12}',
                                                            // 'SN: #${index + 1}-654184',
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 9,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.grey),
                                                          )
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
                                                          PopupMenuButton(
                                                            offset: const Offset(0, 10),
                                                            // padding: EdgeInsets.zero,
                                                            constraints: BoxConstraints.expand(
                                                                width: 120, height: Get.height * 0.205),
                                                            position: PopupMenuPosition.under,

                                                            child: Text(
                                                              "View more",
                                                              style: GoogleFonts.nunito(
                                                                  decoration: TextDecoration.underline,
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: ColorRes.color030229),
                                                            ),
                                                            itemBuilder: (context) {
                                                              return [
                                                                PopupMenuItem(
                                                                  height: Get.height * 0,
                                                                  padding:
                                                                      EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                  child: Container(
                                                                    height: Get.height * 0.05,
                                                                    width: Get.width * 0.6,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(6),
                                                                        color: ColorRes.lightOrange),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        Image.asset(
                                                                          AssetRes.pin,
                                                                          scale: 3,
                                                                        ),
                                                                        Text(
                                                                          StringRes.changeStatus,
                                                                          style: commonSubtitle()
                                                                              .copyWith(color: ColorRes.orange),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                PopupMenuItem(
                                                                  padding:
                                                                      EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                  child: Container(
                                                                    height: Get.height * 0.05,
                                                                    width: Get.width * 0.6,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(6),
                                                                        color: ColorRes.lightYellow),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        SizedBox(
                                                                          width: Get.width * 0.02,
                                                                        ),
                                                                        Image.asset(
                                                                          AssetRes.pay,
                                                                          scale: 3,
                                                                        ),
                                                                        SizedBox(
                                                                          width: Get.width * 0.02,
                                                                        ),
                                                                        Text(
                                                                          StringRes.pay,
                                                                          style: commonSubtitle()
                                                                              .copyWith(color: ColorRes.yellow),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                PopupMenuItem(
                                                                    height: Get.height * 0,
                                                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Container(
                                                                      height: Get.height * 0.05,
                                                                      width: Get.width * 0.5,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(6),
                                                                          color: ColorRes.grey3),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Image.asset(
                                                                            AssetRes.list,
                                                                            scale: 3,
                                                                          ),
                                                                          Text(
                                                                            StringRes.listOfMachine,
                                                                            style: commonSubtitle()
                                                                                .copyWith(color: ColorRes.grey2),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ))
                                                              ];
                                                            },
                                                          ),
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
                                                              const Text(
                                                                '12 Dec, 2020',
                                                                style: TextStyle(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.grey,
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
                              : Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    'Not Found',
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
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.grey),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Machine: ${index * 6 + 12}',
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 9,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorRes.grey),
                                                      )
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
                                                      PopupMenuButton(
                                                        offset: const Offset(0, 10),
                                                        // padding: EdgeInsets.zero,
                                                        constraints: BoxConstraints.expand(
                                                            width: 120, height: Get.height * 0.205),
                                                        position: PopupMenuPosition.under,

                                                        child: Text(
                                                          "View more",
                                                          style: GoogleFonts.nunito(
                                                              decoration: TextDecoration.underline,
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w600,
                                                              color: ColorRes.color030229),
                                                        ),
                                                        itemBuilder: (context) {
                                                          return [
                                                            PopupMenuItem(
                                                              height: Get.height * 0,
                                                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                              child: Container(
                                                                height: Get.height * 0.05,
                                                                width: Get.width * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(6),
                                                                    color: ColorRes.lightOrange),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Image.asset(
                                                                      AssetRes.pin,
                                                                      scale: 3,
                                                                    ),
                                                                    Text(
                                                                      StringRes.changeStatus,
                                                                      style: commonSubtitle()
                                                                          .copyWith(color: ColorRes.orange),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                              child: Container(
                                                                height: Get.height * 0.05,
                                                                width: Get.width * 0.6,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(6),
                                                                    color: ColorRes.lightYellow),
                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: Get.width * 0.02,
                                                                    ),
                                                                    Image.asset(
                                                                      AssetRes.pay,
                                                                      scale: 3,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get.width * 0.02,
                                                                    ),
                                                                    Text(
                                                                      StringRes.pay,
                                                                      style: commonSubtitle()
                                                                          .copyWith(color: ColorRes.yellow),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                                height: Get.height * 0,
                                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                                child: Container(
                                                                  height: Get.height * 0.05,
                                                                  width: Get.width * 0.5,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(6),
                                                                      color: ColorRes.grey3),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    children: [
                                                                      Image.asset(
                                                                        AssetRes.list,
                                                                        scale: 3,
                                                                      ),
                                                                      Text(
                                                                        StringRes.listOfMachine,
                                                                        style: commonSubtitle()
                                                                            .copyWith(color: ColorRes.grey2),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ))
                                                          ];
                                                        },
                                                      ),
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
                                                          const Text(
                                                            '12 Dec, 2020',
                                                            style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight: FontWeight.w400,
                                                              color: ColorRes.grey,
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
                                                              style: GoogleFonts.nunito(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.grey),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'Machine: ${index * 6 + 12}',
                                                            // 'SN: #${index + 1}-654184',
                                                            style: GoogleFonts.nunito(
                                                                fontSize: 9,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.grey),
                                                          )
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
                                                          PopupMenuButton(
                                                            offset: const Offset(0, 10),
                                                            // padding: EdgeInsets.zero,
                                                            constraints: BoxConstraints.expand(
                                                                width: 120, height: Get.height * 0.205),
                                                            position: PopupMenuPosition.under,

                                                            child: Text(
                                                              "View more",
                                                              style: GoogleFonts.nunito(
                                                                  decoration: TextDecoration.underline,
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: ColorRes.color030229),
                                                            ),
                                                            itemBuilder: (context) {
                                                              return [
                                                                PopupMenuItem(
                                                                  height: Get.height * 0,
                                                                  padding:
                                                                      EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                  child: Container(
                                                                    height: Get.height * 0.05,
                                                                    width: Get.width * 0.6,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(6),
                                                                        color: ColorRes.lightOrange),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        Image.asset(
                                                                          AssetRes.pin,
                                                                          scale: 3,
                                                                        ),
                                                                        Text(
                                                                          StringRes.changeStatus,
                                                                          style: commonSubtitle()
                                                                              .copyWith(color: ColorRes.orange),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                PopupMenuItem(
                                                                  padding:
                                                                      EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                                                  child: Container(
                                                                    height: Get.height * 0.05,
                                                                    width: Get.width * 0.6,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(6),
                                                                        color: ColorRes.lightYellow),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        SizedBox(
                                                                          width: Get.width * 0.02,
                                                                        ),
                                                                        Image.asset(
                                                                          AssetRes.pay,
                                                                          scale: 3,
                                                                        ),
                                                                        SizedBox(
                                                                          width: Get.width * 0.02,
                                                                        ),
                                                                        Text(
                                                                          StringRes.pay,
                                                                          style: commonSubtitle()
                                                                              .copyWith(color: ColorRes.yellow),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                PopupMenuItem(
                                                                    height: Get.height * 0,
                                                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Container(
                                                                      height: Get.height * 0.05,
                                                                      width: Get.width * 0.5,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(6),
                                                                          color: ColorRes.grey3),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Image.asset(
                                                                            AssetRes.list,
                                                                            scale: 3,
                                                                          ),
                                                                          Text(
                                                                            StringRes.listOfMachine,
                                                                            style: commonSubtitle()
                                                                                .copyWith(color: ColorRes.grey2),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ))
                                                              ];
                                                            },
                                                          ),
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
                                                              const Text(
                                                                '12 Dec, 2020',
                                                                style: TextStyle(
                                                                  fontSize: 9,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.grey,
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
                              : Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Text(
                                    'Not Found',
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
