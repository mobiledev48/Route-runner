import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: ()async{
        DashBoardController dashBoardController = Get.put(DashBoardController());
        dashBoardController.currentIndex = 0;
        dashBoardController.update(['dash']);
        dashBoardController.update(['location']);
        return false;
      },

      child: Scaffold(
          backgroundColor: ColorRes.bgColor,
          appBar: customAppbar(
              title: StringRes.location,
              leadingOnpress: () {
                DashBoardController dashBoardController = Get.put(DashBoardController());
                dashBoardController.currentIndex = 0;
                dashBoardController.update(['dash']);
                locationController.update(['location']);
              },
              action: false),
          body: Stack(
            children: [
              GetBuilder<LocationController>(
                id: 'location',
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        CommonTextField(
                          borderRadius: 12,
                          containerHeight: Get.height * 0.07,
                          isSuffixIcon: true,
                          suffixIcon: AssetRes.search,
                          suffixIconSize: 3,
                          hintText: StringRes.search,
                          controller: locationController.searchController,
                          onChanged: (value) {
                            locationController.searchTerm = 'Moonlight';
                            // locationController.searchResults = locationController.searchAllData(value);
                            if(locationController.currentIndex==0)
                              {
                                locationController.getLocation(page: locationController.currentPage,search: value);
                              }
                            else
                              {
                                locationController.getLocation(page: locationController.currentPage,search: value);
                              }

                            print(locationController.searchResults);
                            locationController.update(['location']);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        locationController.clickableContainer(),
                        controller.currentIndex == 0
                            // ? controller.searchController.text.isEmpty
                                ? Expanded(
                                    child: ListView.builder(
                                        itemCount: controller.locationsData.length,
                                        itemBuilder: (context, index) {
                                          final bool showData = controller.locationsData[index].statusOfPayment == true;
                                          return  showData?Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Container(
                                              //height: 75,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                              child: Stack(
                                                alignment: Alignment.topCenter,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: 10),
                                                                Text(controller.locationsData[index].locationname ?? "",
                                                                    // 'Moonlight Bar',
                                                                    style: title()),
                                                                // SizedBox(height: 5),
                                                                SizedBox(
                                                                  //  width: width * 0.24,
                                                                  child: Text(
                                                                      overflow: TextOverflow.ellipsis,
                                                                      "Admin: ${controller.locationsData[index].admin?.firstname ?? ""} ${controller.locationsData[index].admin?.lastname ?? ""}",
                                                                      // 'Admin: Arrora gaur',
                                                                      style: subTitle()
                                                                    // GoogleFonts.nunito(
                                                                    //     fontSize:  width * 0.034, fontWeight: FontWeight.w400, color: ColorRes.color030229),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Machine:  ${controller.locationsData[index].numofmachines ?? ""}',
                                                                  style: subTitle(),
                                                                ),
                                                                SizedBox(height: 8),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: Get.height * 0.04,
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                SizedBox(
                                                                  height: Get.height * 0.02,
                                                                ),
                                                                SizedBox(height: Get.height * 0.035, child: DropDownMenu()),
                                                                SizedBox(height: Get.height * 0.02),
                                                                Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      AssetRes.calendar,
                                                                      scale: 2.5,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 2,
                                                                    ),
                                                                    Text(
                                                                      DateFormat('dd MMM, yyyy').format(DateTime.parse(controller.locationsData[index].createdAt ?? "")),
                                                                      style: subTitle().copyWith(fontSize: 12),
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
                                                  Container(
                                                    height: Get.height * 0.04,
                                                    width: Get.width * 0.2,
                                                    margin: EdgeInsets.only(top: 10, left: Get.width * 0.05),
                                                    decoration: BoxDecoration(
                                                      color:controller.locationsData[index].activeStatus == "Active"?
                                                      Colors.green.withOpacity(0.10):controller.locationsData[index].activeStatus == "Pending"? ColorRes.yellow: Colors.pink.withOpacity(0.10),
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                          "${controller.locationsData[index].activeStatus ?? ""}",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              color:controller.locationsData[index].activeStatus == "Active"?
                                                              ColorRes.green:controller.locationsData[index].activeStatus == "Pending"?ColorRes.orange: ColorRes.pink,
                                                              fontSize: width * 0.035),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) : Container();
                                        }),
                                  )
                                // : locationController.searchResults.isNotEmpty
                                //     ? Expanded(
                                //         child: ListView.builder(
                                //             itemCount: controller.searchResults.length,
                                //             itemBuilder: (context, index) => Padding(
                                //                   padding: const EdgeInsets.only(top: 10),
                                //                   child: Container(
                                //                     //height: 75,
                                //                     width: Get.width,
                                //                     decoration: BoxDecoration(
                                //                         color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                //                     child: Stack(
                                //                       alignment: Alignment.topCenter,
                                //                       children: [
                                //                         Padding(
                                //                           padding: const EdgeInsets.symmetric(horizontal: 10),
                                //                           child: Column(
                                //                             children: [
                                //                               Row(
                                //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //                                 crossAxisAlignment: CrossAxisAlignment.start,
                                //                                 children: [
                                //                                   Column(
                                //                                     crossAxisAlignment: CrossAxisAlignment.start,
                                //                                     children: [
                                //                                       SizedBox(height: 10),
                                //                                       Text(controller.searchResults[index].title,
                                //                                           // 'Moonlight Bar',
                                //                                           style: title()),
                                //                                       // SizedBox(height: 5),
                                //                                       SizedBox(
                                //                                         //  width: width * 0.24,
                                //                                         child: Text(
                                //                                             overflow: TextOverflow.ellipsis,
                                //                                             controller.searchResults[index].subtitle,
                                //                                             // 'Admin: Arrora gaur',
                                //                                             style: subTitle()),
                                //                                       ),
                                //                                       Text('Machine: ${index * 6 + 12}', style: subTitle()),
                                //                                       SizedBox(height: 8),
                                //                                     ],
                                //                                   ),
                                //                                   Column(
                                //                                     children: [
                                //                                       SizedBox(
                                //                                         height: Get.height * 0.04,
                                //                                       ),
                                //                                     ],
                                //                                   ),
                                //                                   Column(
                                //                                     crossAxisAlignment: CrossAxisAlignment.end,
                                //                                     children: [
                                //                                       SizedBox(
                                //                                         height: Get.height * 0.02,
                                //                                       ),
                                //                                       SizedBox(
                                //                                           height: Get.height * 0.035, child: DropDownMenu()),
                                //                                       SizedBox(height: Get.height * 0.02),
                                //                                       Row(
                                //                                         children: [
                                //                                           Image.asset(
                                //                                             AssetRes.calendar,
                                //                                             scale: 2.5,
                                //                                           ),
                                //                                           SizedBox(
                                //                                             width: 2,
                                //                                           ),
                                //                                           Text('12 Dec, 2020',
                                //                                               style: subTitle().copyWith(fontSize: 12))
                                //                                         ],
                                //                                       )
                                //                                     ],
                                //                                   )
                                //                                 ],
                                //                               )
                                //                             ],
                                //                           ),
                                //                         ),
                                //                         Container(
                                //                           height: Get.height * 0.04,
                                //                           width: Get.width * 0.2,
                                //                           margin: EdgeInsets.only(top: 10, left: Get.width * 0.05),
                                //                           decoration: BoxDecoration(
                                //                             color: controller.searchResults[index].color,
                                //                             borderRadius: BorderRadius.circular(30),
                                //                           ),
                                //                           child: Center(
                                //                               child: Text(
                                //                             controller.searchResults[index].active,
                                //                             style: TextStyle(
                                //                                 fontWeight: FontWeight.w600,
                                //                                 color: controller.searchResults[index].iconColor,
                                //                                 fontSize: width * 0.035),
                                //                           )),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 )),
                                //       )
                                //     : Padding(
                                //         padding: const EdgeInsets.symmetric(vertical: 30),
                                //         child: Text(
                                //           StringRes.notFound,
                                //           style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                                //         ),
                                //       )
                            :  Expanded(
                          child: ListView.builder(
                              itemCount: controller.locationsData.length,
                              itemBuilder: (context, index) {
                                final bool showData = controller.locationsData[index].statusOfPayment == false;
                                return  showData?Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    //height: 75,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height: 10),
                                                      Text(controller.locationsData[index].locationname ?? "",
                                                          // 'Moonlight Bar',
                                                          style: title()),
                                                      // SizedBox(height: 5),
                                                      SizedBox(
                                                        //  width: width * 0.24,
                                                        child: Text(
                                                            overflow: TextOverflow.ellipsis,
                                                            "Admin: ${controller.locationsData[index].admin?.firstname ?? ""} ${controller.locationsData[index].admin?.lastname ?? ""}",
                                                            // 'Admin: Arrora gaur',
                                                            style: subTitle()
                                                          // GoogleFonts.nunito(
                                                          //     fontSize:  width * 0.034, fontWeight: FontWeight.w400, color: ColorRes.color030229),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Machine:  ${controller.locationsData[index].numofmachines ?? ""}',
                                                        style: subTitle(),
                                                      ),
                                                      SizedBox(height: 8),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height * 0.04,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height * 0.02,
                                                      ),
                                                      SizedBox(height: Get.height * 0.035, child: DropDownMenu()),
                                                      SizedBox(height: Get.height * 0.02),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            AssetRes.calendar,
                                                            scale: 2.5,
                                                          ),
                                                          const SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                            DateFormat('dd MMM, yyyy').format(DateTime.parse(controller.locationsData[index].createdAt ?? "")),
                                                            style: subTitle().copyWith(fontSize: 12),
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
                                        Container(
                                          height: Get.height * 0.04,
                                          width: Get.width * 0.2,
                                          margin: EdgeInsets.only(top: 10, left: Get.width * 0.05),
                                          decoration: BoxDecoration(
                                            color:controller.locationsData[index].activeStatus == "Active"?
                                            Colors.green.withOpacity(0.10):controller.locationsData[index].activeStatus == "Pending"? ColorRes.yellow: Colors.pink.withOpacity(0.10),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                              child: Text(
                                                "${controller.locationsData[index].activeStatus ?? ""}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color:controller.locationsData[index].activeStatus == "Active"?
                                                    ColorRes.green:controller.locationsData[index].activeStatus == "Pending"?ColorRes.orange: ColorRes.pink,
                                                    fontSize: width * 0.035),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ) : Container();
                              }),
                        )

                      ],
                    ),
                  );
                },
              ),
              Obx(()=> locationController.loader.value ? Center(child: CircularProgressIndicator(),):SizedBox())
            ],
          )),
    );
  }
}
//967
