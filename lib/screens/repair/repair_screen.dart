import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/appbar.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/new_repair/new_report_screen.dart';
import 'package:route_runner/screens/repair/repair_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';

class RepairScreen extends StatelessWidget {
  RepairScreen({super.key});
  LocationController locationController = Get.put(LocationController());
  RepairController repairController = Get.put(RepairController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorRes.bgColor,
        appBar: customAppbar(
          title: StringRes.repair,
          leadingOnpress: () {
            Get.back();
          },
          action: true,
          actionOnpress: () {
            Get.to(NewRepairScreen());
          },
        ),
        body: GetBuilder<RepairController>(
          id: 'location',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  CommonTextField(
                    containerHeight: Get.height * 0.07,
                    isSuffixIcon: true,
                    suffixIcon: AssetRes.search,
                    suffixIconSize: 3,
                    hintText: StringRes.search,
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.searchTerm = 'Moonlight'; // Change this to your desired search term
                      controller.searchResults = controller.searchAllData(value);
                      print(controller.searchResults);
                      controller.update(['location']);
                    },
                  ),
                  controller.searchController.text.isEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: repairAllData.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      // height: 85,
                                      width: Get.width,
                                      decoration:
                                          BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10),
                                                    Text(
                                                      repairAllData[index].title,
                                                      style: title(),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.4,
                                                          child: Text(
                                                            repairAllData[index].subtitle,
                                                            overflow: TextOverflow.ellipsis,
                                                            // style: subTitle(),
                                                            style: GoogleFonts.nunito(
                                                                fontSize: width * 0.031,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.color030229),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5),
                                                    SizedBox(
                                                      width: width * 0.37,
                                                      child: Text(
                                                        'Issue: Joy stick not working',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: GoogleFonts.nunito(
                                                            fontSize: width * 0.031,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorRes.color030229),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 10),
                                                    child: Container(
                                                      height: Get.height * 0.04,
                                                      width: Get.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: repairAllData[index].color,
                                                        borderRadius: BorderRadius.circular(30),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        repairAllData[index].active,
                                                        style: TextStyle(
                                                            color: repairAllData[index].iconColor, fontSize: 12),
                                                      )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(right: Get.width * 0.23),
                                                    child: Text(
                                                      'SN: #1-654125',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: width * 0.031,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorRes.color030229),
                                                    ),
                                                  ),
                                                  SizedBox(height: Get.height * 0.01),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Date: 12 Dec,2023',
                                                        style: subTitle().copyWith(fontSize: 9),
                                                      ),
                                                      SizedBox(width: Get.width * 0.02),
                                                      Text(
                                                        'Time: 11:45 PM',
                                                        style: subTitle().copyWith(fontSize: 9),
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
                      : controller.searchResults.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: controller.searchResults.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          // height: 85,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // SizedBox(height: 10),
                                                        Text(
                                                          controller.searchResults[index].title,
                                                          style: title(),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width * 0.4,
                                                              child: Text(
                                                                controller.searchResults[index].subtitle,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: subTitle(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          'Machine: 7',
                                                          style: subTitle(),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 10),
                                                        child: Container(
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
                                                                color: controller.searchResults[index].iconColor,
                                                                fontSize: 12),
                                                          )),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(right: Get.width * 0.276),
                                                        child: Text('SN: #1-654125',
                                                            style: subTitle().copyWith(fontSize: 10)),
                                                      ),
                                                      SizedBox(height: Get.height * 0.018),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Date: 12 Dec,2023',
                                                            style: subTitle().copyWith(fontSize: 10),
                                                          ),
                                                          SizedBox(width: Get.width * 0.02),
                                                          Text(
                                                            'Time: 11:45 PM',
                                                            style: subTitle().copyWith(fontSize: 10),
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
                                StringRes.notFound,
                                style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                ],
              ),
            );
          },
        ));
  }
}
