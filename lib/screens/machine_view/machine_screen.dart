import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/common/drop_down_menu.dart';
import 'package:route_runner/screens/dash_board/dash_board_controller.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/machine_view/machine_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';
import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';

class MachineScreen extends StatelessWidget {
  MachineScreen({super.key});
  LocationController locationController = Get.put(LocationController());
  MachineController machineController = Get.put(MachineController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorRes.bgColor,
        appBar: customAppbar(
          title: StringRes.machine,
          leadingOnpress: () {
            DashBoardController dashBoardController = Get.put(DashBoardController());
            dashBoardController.currentIndex = 0;
            dashBoardController.update(['dash']);
            machineController.update(['location']);
          },
          action: false,
        ),
        body: GetBuilder<MachineController>(
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
                    controller: machineController.searchController,
                    onChanged: (value) {
                      machineController.searchTerm = 'Moonlight';
                      machineController.getMachines(page: 1, search: value);
                      // machineController.searchResults = machineController.searchAllData(value);
                      print(machineController.searchResults);
                      machineController.update(['location']);
                    },
                  ),
                  controller.machinesLocationsData.isNotEmpty
                      ? Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              controller.machinesLocationsData.clear();
                              await controller.getMachines(page: 1);
                              controller.update(['location']);
                            },
                            child: ListView.builder(
                              controller: controller.scrollController,
                                // itemCount: machineAllData.length,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: controller.machinesLocationsData.length,
                                itemBuilder: (context, index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        width: Get.width,
                                        decoration:
                                            BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 10),
                                                          Text(
                                                            controller.machinesLocationsData[index].locationname ?? "",
                                                            // machineAllData[index].title,
                                                            style: title(),
                                                          ),
                                                          const SizedBox(height: 5),
                                                          SizedBox(
                                                            width: Get.width * 0.24,
                                                            child: Text(
                                                               controller.machinesLocationsData[index].machines?[0].employees?[0].firstname ?? '' ,
                                                               // machineAllData[index].subtitle,
                                                                overflow: TextOverflow.ellipsis, style: subTitle()
                                                                // GoogleFonts.nunito(
                                                                //     fontSize: width * 0.034, fontWeight: FontWeight.w400, color:  ColorRes.color030229),
                                                                ),
                                                          ),
                                                          const SizedBox(height: 5),

                                                          Text('SN: #${controller.machinesLocationsData[index].machines?[0].machineNumber?.substring(0,2) ?? ""}-${controller.machinesLocationsData[index].machines?[0].serialNumber ?? ""}')
                                                          // Text('SN: #${index + 1}-654184', style: subTitle()
                                                          //     // GoogleFonts.nunito(
                                                          //     //     fontSize: width * 0.034, fontWeight: FontWeight.w400, color:  ColorRes.color030229),
                                                          //     )
                                                        ,
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          SizedBox(
                                                            height: Get.height * 0.02,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 6),
                                                            child: SizedBox(
                                                                height: Get.height * 0.05, child: DropDownMenu()),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height * 0.015,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Initial: \$ 2000',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: width * 0.03,
                                                                    fontWeight: FontWeight.w400,
                                                                    color: ColorRes.color030229),
                                                              ),
                                                              const SizedBox(
                                                                width: 6,
                                                              ),
                                                              Text(
                                                                'Current: \$ 2648',
                                                                style: GoogleFonts.nunito(
                                                                    fontSize: width * 0.03,
                                                                    fontWeight: FontWeight.w400,
                                                                    color: ColorRes.color030229),
                                                              ),
                                                              const SizedBox(
                                                                width: 6,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: Get.height * 0.04,
                                              width: Get.width * 0.2,
                                              margin: EdgeInsets.only(top: 10),
                                              decoration: BoxDecoration(
                                                color: machineController.machinesLocationsData[index].activeStatus == "Active"? ColorRes.green.withOpacity(0.10) : machineController.machinesLocationsData[index].activeStatus == "In Service" ? ColorRes.yellow : ColorRes.red.withOpacity(0.10)
,
                                            //    color: machineAllData[index].color,
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                    machineController.machinesLocationsData[index].activeStatus ?? "",
                                               // machineAllData[index].active,
                                                style: TextStyle(
                                                 // color: machineAllData[index].iconColor, fontSize: width * 0.034
                                                  color: machineController.machinesLocationsData[index].activeStatus == "Active"? ColorRes.green : machineController.machinesLocationsData[index].activeStatus == "In Service" ? ColorRes.yellow : ColorRes.red.withOpacity(0.10)
                                                ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        )
                      : controller.loader.value == false? Padding(padding: EdgeInsets.symmetric(vertical: 30), child: Text(
                    StringRes.notFound,
                    style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  ):SizedBox(),
                      // : controller.searchResults.isNotEmpty
                      //     // controller.searchResults
                      //     ? Expanded(
                      //         child: ListView.builder(
                      //             itemCount: controller.searchResults.length,
                      //             itemBuilder: (context, index) => Padding(
                      //                   padding: const EdgeInsets.only(top: 10),
                      //                   child: Container(
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
                      //                                 children: [
                      //                                   Column(
                      //                                     crossAxisAlignment: CrossAxisAlignment.start,
                      //                                     children: [
                      //                                       SizedBox(height: 10),
                      //                                       Text(
                      //                                         controller.searchResults[index].title,
                      //                                         style: title(),
                      //                                       ),
                      //                                       SizedBox(height: 5),
                      //                                       SizedBox(
                      //                                         width: Get.width * 0.24,
                      //                                         child: Text(
                      //                                           controller.searchResults[index].subtitle,
                      //                                           overflow: TextOverflow.ellipsis,
                      //                                           style: GoogleFonts.nunito(
                      //                                               fontSize: width * 0.034,
                      //                                               fontWeight: FontWeight.w400,
                      //                                               color: ColorRes.color030229),
                      //                                         ),
                      //                                       ),
                      //                                       SizedBox(height: 5),
                      //                                       Text(
                      //                                         'SN: #${index + 1}-654184',
                      //                                         style: GoogleFonts.nunito(
                      //                                             fontSize: width * 0.034,
                      //                                             fontWeight: FontWeight.w400,
                      //                                             color: ColorRes.color030229),
                      //                                       )
                      //                                     ],
                      //                                   ),
                      //                                   Column(
                      //                                     crossAxisAlignment: CrossAxisAlignment.end,
                      //                                     children: [
                      //                                       SizedBox(
                      //                                         height: Get.height * 0.02,
                      //                                       ),
                      //                                       Padding(
                      //                                         padding: const EdgeInsets.only(right: 6),
                      //                                         child: SizedBox(
                      //                                             height: Get.height * 0.05, child: DropDownMenu()),
                      //                                       ),
                      //                                       SizedBox(
                      //                                         height: Get.height * 0.015,
                      //                                       ),
                      //                                       Row(
                      //                                         children: [
                      //                                           Text(
                      //                                             'Initial: \$ 2000',
                      //                                             style: GoogleFonts.nunito(
                      //                                                 fontSize: width * 0.03,
                      //                                                 fontWeight: FontWeight.w400,
                      //                                                 color: ColorRes.color030229),
                      //                                           ),
                      //                                           const SizedBox(
                      //                                             width: 6,
                      //                                           ),
                      //                                           Text(
                      //                                             'Current: \$ 2648',
                      //                                             style: GoogleFonts.nunito(
                      //                                                 fontSize: width * 0.03,
                      //                                                 fontWeight: FontWeight.w400,
                      //                                                 color: ColorRes.color030229),
                      //                                           ),
                      //                                           const SizedBox(
                      //                                             width: 6,
                      //                                           ),
                      //                                         ],
                      //                                       )
                      //                                     ],
                      //                                   )
                      //                                 ],
                      //                               ),
                      //                               const SizedBox(
                      //                                 height: 10,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           height: Get.height * 0.04,
                      //                           width: Get.width * 0.2,
                      //                           margin: EdgeInsets.only(top: 10),
                      //                           decoration: BoxDecoration(
                      //                             color: controller.searchResults[index].color,
                      //                             borderRadius: BorderRadius.circular(30),
                      //                           ),
                      //                           child: Center(
                      //                               child: Text(
                      //                             controller.searchResults[index].active,
                      //                             style: TextStyle(
                      //                                 color: controller.searchResults[index].iconColor,
                      //                                 fontSize: width * 0.034),
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
                ],
              ),
            );
          },
        ));
  }
}
