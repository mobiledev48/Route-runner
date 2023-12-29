import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/edit_location_view/edit_location_screen.dart';
import 'package:route_runner/screens/google_location_view/google_location_screen.dart';
import 'package:route_runner/screens/home_view/home_controller.dart';
import 'package:route_runner/screens/home_view/home_screen.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/new_service_repair/new_service_report_screen.dart';
import 'package:route_runner/screens/service_report_view/service_report_controller.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/font_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../utils/asset_res.dart';
import '../../utils/strings.dart';
import '../admin_view/admin_controller.dart';

class ServiceReportScreen extends StatelessWidget {
  const ServiceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceReportController serviceReportController =
        Get.put(ServiceReportController());
    AdminController adminController = Get.put(AdminController());

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp)),
              centerTitle: true,
              backgroundColor: ColorRes.mainColor,
              title: Text(
                'Service Report',
                style:  GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color:  ColorRes.white),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.to(NewServiceRepairScreen());
                  },
                  child: Container(
                    height: 16,
                    width: 28,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right:  Get.width * 0.06,top: Get.height * 0.02,bottom:  Get.height * 0.02),
                    decoration:  BoxDecoration(
                        color: ColorRes.white.withOpacity(0.30),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(Icons.add),
                  ),
                ),

              ],
              // automaticallyImplyLeading: false,
            ),
            body: GetBuilder<ServiceReportController>(
              id: 'service',
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height:  40,
                        child: TextField(
                          onChanged: (value) {
                            controller.searchTerm = 'Moonlight'; // Change this to your desired search term
                            controller.searchResults =   controller.searchServiceReportData(serviceReportData,value);
                            print( controller.searchResults);
                            controller.update(['service']);
                          },
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            suffixIcon: Image.asset(
                              AssetRes.search,
                              scale: 3,
                            ),
                            hintText: StringRes.search,
                            hintStyle: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:  ColorRes.color030229),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            focusColor: Colors.black12,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xfff6f6f6)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xfff6f6f6)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),

                      controller.searchResults.isEmpty?Expanded(
                        child: ListView.builder(
                            itemCount: serviceReportData.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 75,
                                    width: Get.width,
                                    padding: EdgeInsets.symmetric(horizontal: 13
                                    ),
                                    decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          serviceReportData[index].title,

                                          style:  GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color:  ColorRes.color030229),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          serviceReportData[index].subtitle,

                                          style:  GoogleFonts.nunito(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400,
                                              color:  ColorRes.color030229),
                                        ),
                                        SizedBox(height: 5),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              serviceReportData[index].subtitle1,
                                              style: GoogleFonts.nunito(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                                color:  ColorRes.color030229),
                                            ),
                                             Text(
                                              'Date: 12 Dec, 2020',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                  color:  ColorRes.color030229)
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
                      ):Expanded(
                        child: ListView.builder(
                            itemCount: controller.searchResults.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 75,
                                width: Get.width,
                                padding: EdgeInsets.symmetric(horizontal: 13
                                ),
                                decoration: BoxDecoration(
                                    color: ColorRes.white,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      controller.searchResults[index].title,

                                      style:  GoogleFonts.nunito(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color:  ColorRes.color030229),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      controller.searchResults[index].subtitle,

                                      style:  GoogleFonts.nunito(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color:  ColorRes.color030229),
                                    ),
                                    SizedBox(height: 5),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.searchResults[index].subtitle1,
                                          style: GoogleFonts.nunito(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400,
                                              color:  ColorRes.color030229),
                                        ),
                                        Text(
                                            'Date: 12 Dec, 2020',
                                            style: GoogleFonts.nunito(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color:  ColorRes.color030229)
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
            )));
  }
}

