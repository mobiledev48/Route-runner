import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/dash_board/dash_board_controller.dart';
import 'package:route_runner/screens/home_view/home_screen.dart';
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
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       onPressed: () {
        //         // Get.to(HomeScreen());
        //       },
        //       icon: Icon(
        //         Icons.arrow_back_ios_sharp,
        //         size: 20,
        //       )),
        //   centerTitle: true,
        //   backgroundColor: ColorRes.mainColor,
        //   title: Text(
        //     StringRes.machine,
        //     style: appbarStyle(),
        //   ),
        //   // automaticallyImplyLeading: false,
        // ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                DashBoardController dashBoardController = Get.put(DashBoardController());
                dashBoardController.currentIndex = 0;
                dashBoardController.update(['dash']);
                machineController.update(['location']);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
              )),
          centerTitle: true,
          backgroundColor: ColorRes.mainColor,
          title: Text(
            StringRes.machine,
            style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600, color: ColorRes.white),
          ),

          // automaticallyImplyLeading: false,
        ),
        body: GetBuilder<MachineController>(
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
                        controller: machineController.searchController,
                        onChanged: (value) {
                          machineController.searchTerm = 'Moonlight';
                          machineController.searchResults = machineController.searchAllData(value);
                          print(machineController.searchResults);
                          machineController.update(['location']);
                        },
                      )),
                  controller.searchController.text.isEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: machineAllData.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      //  height: 75,
                                      width: Get.width,
                                      decoration:
                                          BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              // Padding(
                                              //   padding: const EdgeInsets.only(bottom: 20, left: 5),
                                              //   child: locationController.customCheckbox(),
                                              // ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                    machineAllData[index].title,
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
                                                      machineAllData[index].subtitle,
                                                      overflow: TextOverflow.ellipsis,
                                                      // 'Admin: Arrora gaur',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 9,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorRes.grey),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'SN: #${index + 1}-654184',
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 9, fontWeight: FontWeight.w400, color: ColorRes.grey),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height: Get.height * 0.04,
                                                width: Get.width * 0.2,
                                                decoration: BoxDecoration(
                                                  color: machineAllData[index].color,
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  machineAllData[index].active,
                                                  style:
                                                      TextStyle(color: machineAllData[index].iconColor, fontSize: 12),
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
                                                    padding: EdgeInsets.zero,
                                                    // padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints.expand(width: 120, height: Get.height * 0.205),
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
                                                                  style:
                                                                      commonSubtitle().copyWith(color: ColorRes.orange),
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
                                                                  style:
                                                                      commonSubtitle().copyWith(color: ColorRes.yellow),
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
                                                      Text(
                                                        'Initial: \$ 2000',
                                                        style: GoogleFonts.nunito(
                                                            decoration: TextDecoration.underline,
                                                            fontSize: 8,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorRes.color030229),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        'Current: \$ 2648',
                                                        style: GoogleFonts.nunito(
                                                            decoration: TextDecoration.underline,
                                                            fontSize: 8,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorRes.color030229),
                                                      )
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
                                  )

                              //     Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Container(
                              //     height: 70,
                              //     width: Get.width,
                              //     decoration:
                              //         BoxDecoration(color: ColorRes.lightYellow, borderRadius: BorderRadius.circular(10)),
                              //     child: ListTile(
                              //       trailing: Column(
                              //         children: [TextButton(onPressed: () {}, child: Text('View more'))],
                              //       ),
                              //       title: Text('Moonlight Bar'),
                              //       leading: locationController.customCheckbox(),
                              //       subtitle: Column(
                              //         children: [
                              //           Padding(
                              //             padding: const EdgeInsets.only(right: 0),
                              //             child: Text(
                              //               'Admin: Arrora gaur',
                              //               style: commonSubtitle(),
                              //             ),
                              //           ),
                              //           Padding(
                              //             padding: const EdgeInsets.only(right: 0),
                              //             child: Text(
                              //               'Machine: 7',
                              //               style: commonSubtitle(),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              ),
                        )
                      : controller.searchResults.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: controller.searchResults.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          //  height: 75,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(bottom: 20, left: 5),
                                                  //   child: locationController.customCheckbox(),
                                                  // ),
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
                                                        'SN: #${index + 1}-654184',
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
                                                          Text(
                                                            'Initial: \$ 2000',
                                                            style: GoogleFonts.nunito(
                                                                decoration: TextDecoration.underline,
                                                                fontSize: 8,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.color030229),
                                                          ),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            'Current: \$ 2648',
                                                            style: GoogleFonts.nunito(
                                                                decoration: TextDecoration.underline,
                                                                fontSize: 8,
                                                                fontWeight: FontWeight.w400,
                                                                color: ColorRes.color030229),
                                                          )
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
                                      )

                                  //     Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(
                                  //     height: 70,
                                  //     width: Get.width,
                                  //     decoration:
                                  //         BoxDecoration(color: ColorRes.lightYellow, borderRadius: BorderRadius.circular(10)),
                                  //     child: ListTile(
                                  //       trailing: Column(
                                  //         children: [TextButton(onPressed: () {}, child: Text('View more'))],
                                  //       ),
                                  //       title: Text('Moonlight Bar'),
                                  //       leading: locationController.customCheckbox(),
                                  //       subtitle: Column(
                                  //         children: [
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(right: 0),
                                  //             child: Text(
                                  //               'Admin: Arrora gaur',
                                  //               style: commonSubtitle(),
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(right: 0),
                                  //             child: Text(
                                  //               'Machine: 7',
                                  //               style: commonSubtitle(),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text(
                                'Not Found',
                                style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            )

                  // TextField(
                  //   controller: controller.searchController,
                  //   style: GoogleFonts.glory(),
                  //   onChanged: (value) {
                  //     controller.filterLocations(value);
                  //   },
                  //   decoration: InputDecoration(
                  //     labelText: 'Search',
                  //     labelStyle: GoogleFonts.glory(),
                  //     prefixIcon: const Icon(Icons.search),
                  //   ),
                  // ),
                  // sizeH(h: 15),
                  // controller.filteredLocations!.isNotEmpty
                  //     ? Expanded(
                  //         child: ListView.builder(
                  //           physics: const BouncingScrollPhysics(),
                  //           itemCount: controller.filteredLocations!.length,
                  //           itemBuilder: (context, index) {
                  //             var data = controller.filteredLocations![index].locationname;
                  //             return Column(
                  //               children: [
                  //                 GestureDetector(
                  //                   onTap: () {
                  //                     FocusScope.of(context).unfocus();
                  //                     Get.to(GoogleLocationScreen(
                  //                       locationText: data,
                  //                     ));
                  //                   },
                  //                   child: ListTile(
                  //                     title: Text(
                  //                       data!,
                  //                       style: GoogleFonts.glory(),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const Divider(
                  //                   color: Colors.black26,
                  //                   height: 1,
                  //                   thickness: 1,
                  //                 )
                  //               ],
                  //             );
                  //           },
                  //         ),
                  //       )
                  //     : const SizedBox(),
                ],
              ),
            );
          },
        ));
  }
}
