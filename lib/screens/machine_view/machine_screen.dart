import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/edit_location_view/edit_location_screen.dart';
import 'package:route_runner/screens/google_location_view/google_location_screen.dart';
import 'package:route_runner/screens/home_view/home_controller.dart';
import 'package:route_runner/screens/home_view/home_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/font_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../utils/asset_res.dart';
import '../../utils/strings.dart';
import '../admin_view/admin_controller.dart';

class MachineScreen extends StatelessWidget {
  MachineScreen({super.key});
  LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.to(HomeScreen());
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp)),
              centerTitle: true,
              backgroundColor: ColorRes.mainColor,
              title: Text(
                StringRes.machine,
                style: GoogleFonts.glory(fontSize: 25),
              ),
              // automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: GetBuilder<LocationController>(
                id: 'location',
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width * 0.9,
                          height: Get.height * 0.06,
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                AssetRes.search,
                                scale: 2,
                              ),
                              hintText: StringRes.search,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              focusColor: Colors.black12,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xfff6f6f6)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xfff6f6f6)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Get.height,
                          child: ListView.builder(
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
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                    _allData[index].title,
                                                    // 'Moonlight Bar',
                                                    style: commonTitle()
                                                        .copyWith(color: ColorRes.black, fontWeight: FontWeight.w400),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    _allData[index].subtitle,
                                                    // 'Admin: Arrora gaur',
                                                    style: commonSubtitle().copyWith(color: ColorRes.grey),
                                                  ),
                                                  Text(
                                                    'Machine: 7',
                                                    style: commonSubtitle().copyWith(color: ColorRes.grey),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height: 30,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: _allData[index].color,
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  'Active',
                                                  style: TextStyle(color: _allData[index].iconColor),
                                                )),
                                              ),
                                              Column(
                                                children: [
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'View more',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 13,
                                                          color: ColorRes.grey3,
                                                          decoration: TextDecoration.underline,
                                                        ),
                                                      )),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        AssetRes.calendar,
                                                        scale: 2,
                                                      ),
                                                      const Text(
                                                        '12 Dec, 2020',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: ColorRes.grey3,
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
                  );
                },
              ),
            )));
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
