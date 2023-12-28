import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_runner/screens/dash_board/dash_board_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../utils/asset_res.dart';
import '../../utils/strings.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());

    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<LocationController>(
        id: 'location',
        builder: (controller) {
          return Column(
            children: [
              AppBars(
                width: Get.width * 0.28,
                title: StringRes.location,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Container(width: Get.width * 0.9, height: Get.height * 0.06, child: CommomTextFormFeild()),
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
                    SizedBox(
                      height: Get.height * 0.715,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
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
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 20, left: 5),
                                            child: locationController.customCheckbox(),
                                          ),
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
                                          Container(
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
                                                          borderRadius: BorderRadius.circular(6), color: ColorRes.grey),
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
                                              // TextButton(
                                              //     onPressed: () {},
                                              //     child: const Text(
                                              //       'View more',
                                              //       style: TextStyle(
                                              //         fontWeight: FontWeight.w500,
                                              //         fontSize: 13,
                                              //         color: ColorRes.grey3,
                                              //         decoration: TextDecoration.underline,
                                              //       ),
                                              //     )),
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
  allData('Black Sleep Bar', 'Admin: Edward Evan', ColorRes.lightBlue, ColorRes.green),
  allData('Haven Martini', 'Admin: Bethany Jackson', ColorRes.lightYellow, ColorRes.yellow),
  allData('Refined Mixers', 'Admin: Arrora gaur', ColorRes.lightPink, ColorRes.pink),
  allData('Haven Martini', 'Admin: Edward Evan', ColorRes.lightGreen, ColorRes.green),
  allData('Black Sleep Bar', 'Admin: Arrora gaur', ColorRes.lightPink, ColorRes.pink),
];
