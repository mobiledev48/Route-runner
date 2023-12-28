import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/home_view/home_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';

class RepairScreen extends StatelessWidget {
  RepairScreen({super.key});
  LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<LocationController>(
        id: 'location',
        builder: (controller) {
          return Column(
            children: [
              Container(
                height: Get.height * 0.13,
                width: Get.width,
                color: ColorRes.mainColor,
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: ColorRes.white,
                        )),
                    SizedBox(width: 20),
                    Text(
                      StringRes.repair,
                      style: appbarStyle().copyWith(fontSize: 24),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: Get.height * 0.039,
                          width: Get.width * 0.078,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: ColorRes.trans),
                          child: Icon(
                            Icons.add,
                            color: ColorRes.white,
                            size: 20,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Container(width: Get.width * 0.9, height: Get.height * 0.06, child: CommomTextFormFeild()),
                    SizedBox(
                      height: Get.height * 0.8,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _allData.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 75,
                                  width: Get.width,
                                  decoration:
                                      BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
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
                                                // 'Moonlight Bar',
                                                style: commonTitle().copyWith(
                                                    color: ColorRes.black, fontWeight: FontWeight.w600, fontSize: 13),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                _allData[index].subtitle,
                                                // 'Admin: Arrora gaur',
                                                style: commonSubtitle().copyWith(color: ColorRes.grey, fontSize: 10),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Machine: 7',
                                                style: commonSubtitle().copyWith(color: ColorRes.grey),
                                              )
                                            ],
                                          ),
                                          Text(
                                            'SN: #1-654125',
                                            style: commonSubtitle().copyWith(fontSize: 9),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Container(
                                                  height: Get.height * 0.04,
                                                  width: Get.width * 0.2,
                                                  decoration: BoxDecoration(
                                                    color: _allData[index].color,
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Active',
                                                    style: TextStyle(color: _allData[index].iconColor, fontSize: 12),
                                                  )),
                                                ),
                                              ),
                                              SizedBox(height: Get.height * 0.017),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Date: 12 Dec,2023',
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w400,
                                                      color: ColorRes.black,
                                                    ),
                                                  ),
                                                  SizedBox(width: Get.width * 0.02),
                                                  Text(
                                                    'Time: 11:45 PM',
                                                    style: TextStyle(
                                                      fontSize: 8,
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
                    ),

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
  allData(this.title, this.subtitle, this.color, this.iconColor);
}

List<allData> _allData = [
  allData(
    'Moonlight Bar',
    'Admin: Arrora gaur',
    ColorRes.lightGreen,
    ColorRes.green,
  ),
  allData('Black Sleep Bar', 'Reporter: Steven', ColorRes.lightBlue, ColorRes.green),
  allData('Haven Martini', 'Reporter: Trevor Yowell', ColorRes.lightYellow, ColorRes.yellow),
  allData('Refined Mixers', 'Reporter: Grace Hughey', ColorRes.lightPink, ColorRes.pink),
  allData('Haven Martini', 'Reporter: Steven', ColorRes.lightGreen, ColorRes.green),
  allData('Black Sleep Bar', 'Reporter: Alice Vincent', ColorRes.lightPink, ColorRes.pink),
];
