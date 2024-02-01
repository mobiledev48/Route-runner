import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:route_runner/api_call/get_repairs_api/get_repairs_model.dart';
import 'package:route_runner/common/appbar.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/new_repair/new_report_controller.dart';
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
        appBar: AppBar(
            leading: IconButton(
                onPressed:  () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 20,
                  color: ColorRes.white,
                )),
            centerTitle: true,
            backgroundColor: ColorRes.mainColor,
            title: Text(
              StringRes.repair,
              style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  NewReportController newReportController = Get.put(NewReportController());
                  newReportController.getLocation();
                  Get.to(NewRepairScreen());

                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset(AssetRes.addMenu,scale: 3,),
                ),
              )

            ]),
        backgroundColor: ColorRes.bgColor,

        body: Stack(
          children: [
            GetBuilder<RepairController>(
              id: 'location',
              builder: (controller) {
                return Column(
                  children: [
                   /* Container(
                      height: 60,
                      color: ColorRes.mainColor,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 20,
                                color: ColorRes.white,
                              )),
                        ),
                        Text(
                          StringRes.repair,
                          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                              onTap: () {
                                NewReportController newReportController = Get.put(NewReportController());
                                newReportController.getLocation();
                                Get.to(NewRepairScreen());

                              },
                              child: Image.asset(
                                AssetRes.addMenu,
                                scale: 3,
                              )),
                        ),
                      ]),
                    ),*/
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            CommonTextField(
                              borderRadius: 12,
                              containerHeight: Get.height * 0.07,
                              isSuffixIcon: true,
                              suffixIcon: AssetRes.search,
                              suffixIconSize: 3,
                              hintText: StringRes.search,
                              controller: controller.searchController,
                              onChanged: (value) {
                                controller.repairReportData.clear();
                                controller.currentPage = 1;
                                controller.getRepair(page: controller.currentPage,search: value);
                                print(controller.searchResults);
                                controller.update(['location']);
                              },
                            ),
                            controller.repairReportData.isNotEmpty?
                            Expanded(
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        controller.repairReportData.clear();
                                        controller.currentPage = 1;
                                        await controller.getRepair(page:  controller.currentPage);
                                        controller.update(['location']);
                                      },
                                      child: ListView.builder(
                                        controller: controller.scrollController,
                                          itemCount: controller.repairReportData.length,
                                          itemBuilder: (context, index) => Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  // height: 85,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                      color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height: 10),
                                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            controller.repairReportData[index].location ?? "",
                                                            style: title(),
                                                          ),
                                                          Container(
                                                            height: Get.height * 0.04,
                                                            width: Get.width * 0.2,
                                                            decoration: BoxDecoration(
                                                              color: controller.repairReportData[index].statusOfRepair == "Done"?
                                                              ColorRes.color3A974C.withOpacity(0.10):controller.repairReportData[index].statusOfRepair == "Pending"?
                                                              ColorRes.colorF29339.withOpacity(0.10): ColorRes.color5B93FF.withOpacity(0.10),
                                                              borderRadius: BorderRadius.circular(30),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                  controller.repairReportData[index].statusOfRepair ?? "",
                                                                  style: TextStyle(
                                                                      color: controller.repairReportData[index].statusOfRepair == "Done"?
                                                                      ColorRes.color3A974C:controller.repairReportData[index].statusOfRepair == "Pending"?
                                                                      ColorRes.colorF29339: ColorRes.color5B93FF,
                                                                      fontSize: 12),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10),
                                                      Row(
                                                        crossAxisAlignment:CrossAxisAlignment.start,

                                                        children: [
                                                          SizedBox(
                                                            //width: Get.width * 0.4,
                                                            child: Text(
                                                              "Reporter: ${controller.repairReportData[index].reporterName ?? ""}",
                                                              overflow: TextOverflow.ellipsis,
                                                              // style: subTitle(),
                                                              style: GoogleFonts.nunito(
                                                                  fontSize: width * 0.031,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorRes.color030229),
                                                            ),
                                                          ),
                                                                  SizedBox(width: width * 0.04,),
                                                                  Expanded(flex: 2,
                                                                    child: Text(
                                                                     'SN: #${controller.repairReportData[index].machineNumber?? ""}-${controller.repairReportData[index].serialNumber ?? ""}',

                                                                      style: GoogleFonts.nunito(
                                                                          fontSize: width * 0.031,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: ColorRes.color030229),
                                                                    ),
                                                                  ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10),
                                                      Row(children: [
                                                        SizedBox(height: 5),
                                                        Expanded(
                                                          // width: width * 0.37,
                                                          child: Text(
                                                            'Issue: ${ controller.repairReportData[index].issue ?? ""}',
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 2,
                                                            style: GoogleFonts.nunito(
                                                                fontSize: width * 0.031,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.color030229),
                                                          ),
                                                        ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                   "Date: ${ DateFormat('dd MMM, yyyy').format(DateTime.parse( controller.repairReportData[index].date ?? ""))}",
                                                                      style: subTitle().copyWith(fontSize: 9),
                                                                    ),
                                                                    SizedBox(width: Get.width * 0.02),
                                                                    Text(
                                                                      'Time: ${controller.repairReportData[index].time ?? ""}',
                                                                      style: subTitle().copyWith(fontSize: 9),
                                                                    )
                                                                  ],
                                                                ),
                                                        SizedBox(height: 10),

                                                      ],),
                                                      SizedBox(height: 10),
                                                      // Row(
                                                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      //   children: [
                                                      //     Expanded(
                                                      //       child: Column(
                                                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      //         crossAxisAlignment: CrossAxisAlignment.start,
                                                      //         children: [
                                                      //           SizedBox(height: 10),
                                                      //           Text(
                                                      //             controller.repairReportData[index].location ?? "",
                                                      //             style: title(),
                                                      //           ),
                                                      //           SizedBox(height: 5),
                                                      //           Row(
                                                      //             children: [
                                                      //               SizedBox(
                                                      //                 width: Get.width * 0.4,
                                                      //                 child: Text(
                                                      //                   "Reporter: ${controller.repairReportData[index].reporterName ?? ""}",
                                                      //                   overflow: TextOverflow.ellipsis,
                                                      //                   // style: subTitle(),
                                                      //                   style: GoogleFonts.nunito(
                                                      //                       fontSize: width * 0.031,
                                                      //                       fontWeight: FontWeight.w400,
                                                      //                       color: ColorRes.color030229),
                                                      //                 ),
                                                      //               ),
                                                      //             ],
                                                      //           ),
                                                      //           SizedBox(height: 5),
                                                      //           SizedBox(
                                                      //             width: width * 0.37,
                                                      //             child: Text(
                                                      //               'Issue: ${ controller.repairReportData[index].issue ?? ""}',
                                                      //               overflow: TextOverflow.ellipsis,
                                                      //               maxLines: 2,
                                                      //               style: GoogleFonts.nunito(
                                                      //                   fontSize: width * 0.031,
                                                      //                   fontWeight: FontWeight.w400,
                                                      //                   color: ColorRes.color030229),
                                                      //             ),
                                                      //           ),
                                                      //           SizedBox(
                                                      //             height: 10,
                                                      //           )
                                                      //         ],
                                                      //       ),
                                                      //     ),
                                                      //     Column(
                                                      //       crossAxisAlignment: CrossAxisAlignment.end,
                                                      //       children: [
                                                      //         Padding(
                                                      //           padding: const EdgeInsets.only(top: 0),
                                                      //           child: Container(
                                                      //             height: Get.height * 0.04,
                                                      //             width: Get.width * 0.2,
                                                      //             decoration: BoxDecoration(
                                                      //               color: controller.repairReportData[index].statusOfRepair == "Done"?
                                                      //               ColorRes.color3A974C.withOpacity(0.10):controller.repairReportData[index].statusOfRepair == "Pending"?
                                                      //               ColorRes.colorF29339.withOpacity(0.10): ColorRes.color5B93FF.withOpacity(0.10),
                                                      //               borderRadius: BorderRadius.circular(30),
                                                      //             ),
                                                      //             child: Center(
                                                      //                 child: Text(
                                                      //                   controller.repairReportData[index].statusOfRepair ?? "",
                                                      //               style: TextStyle(
                                                      //                   color: controller.repairReportData[index].statusOfRepair == "Done"?
                                                      //                   ColorRes.color3A974C:controller.repairReportData[index].statusOfRepair == "Pending"?
                                                      //                   ColorRes.colorF29339: ColorRes.color5B93FF,
                                                      //                   fontSize: 12),
                                                      //             )),
                                                      //           ),
                                                      //         ),
                                                      //         SizedBox(height: Get.height * 0.01),
                                                      //         Padding(
                                                      //           padding: EdgeInsets.only(right: Get.width * 0.13),
                                                      //           child: Text(
                                                      //            'SN: #${controller.repairReportData[index].machineNumber?.substring(0,2) ?? ""}-${controller.repairReportData[index].serialNumber ?? ""}',
                                                      //
                                                      //             style: GoogleFonts.nunito(
                                                      //                 fontSize: width * 0.031,
                                                      //                 fontWeight: FontWeight.w400,
                                                      //                 color: ColorRes.color030229),
                                                      //           ),
                                                      //         ),
                                                      //         SizedBox(height: Get.height * 0.01),
                                                      //         Row(
                                                      //           children: [
                                                      //             Text(
                                                      //            "Date: ${ DateFormat('dd MMM, yyyy').format(DateTime.parse( controller.repairReportData[index].date ?? ""))}",
                                                      //               style: subTitle().copyWith(fontSize: 9),
                                                      //             ),
                                                      //             SizedBox(width: Get.width * 0.02),
                                                      //             Text(
                                                      //               'Time: ${controller.repairReportData[index].time ?? ""}',
                                                      //               style: subTitle().copyWith(fontSize: 9),
                                                      //             )
                                                      //           ],
                                                      //         )
                                                      //       ],
                                                      //     )
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ):
                            repairController.loader.value == false? Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 30),
                                        child: Text(
                                          StringRes.notFound,
                                          style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                                        ),
                                      ):SizedBox(),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            Obx(()=> repairController.loader.value ? Center(child: CircularProgressIndicator(),):SizedBox())
          ],
        ));
  }
}
