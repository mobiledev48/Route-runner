import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_runner/screens/location_view/location_controller.dart';
import 'package:route_runner/screens/new_repair/new_report_screen.dart';
import 'package:route_runner/utils/color_res.dart';
import 'package:route_runner/utils/text_style.dart';

import '../../common/common_text_fild.dart';
import '../../utils/strings.dart';

class RepairScreen extends StatelessWidget {
  RepairScreen({super.key});
  LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
               Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
          centerTitle: true,
          backgroundColor: ColorRes.mainColor,
          title: Text(
            StringRes.repair,
            style:  GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color:  ColorRes.white),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(NewRepairScreen());
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
        body: GetBuilder<LocationController>(
          id: 'location',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Container(width: Get.width * 0.9, height: Get.height * 0.06, child: CommomTextFormFeild()),
                  Expanded(
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                _allData[index].title,
                                                // 'Moonlight Bar',
                                                style:  GoogleFonts.nunito(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color:  ColorRes.black),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    _allData[index].subtitle,
                                                    // 'Admin: Arrora gaur',
                                                    style:  GoogleFonts.nunito(
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.w400,
                                                        color:  ColorRes.color030229),
                                                  ),
                                                  SizedBox(width: 30,),
                                                  Text(
                                                    'SN: #1-654125',
                                                    style: commonSubtitle().copyWith(fontSize: 9),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Machine: 7',
                                                style:  GoogleFonts.nunito(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
                                                    color:  ColorRes.color030229),
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
                                            SizedBox(height: Get.height * 0.018),
                                            Row(
                                              children: [
                                                Text(
                                                  'Date: 12 Dec,2023',
                                                  style:  GoogleFonts.nunito(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w400,
                                                      color:  ColorRes.color030229),
                                                ),
                                                SizedBox(width: Get.width * 0.02),
                                                Text(
                                                  'Time: 11:45 PM',
                                                  style:  GoogleFonts.nunito(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w400,
                                                      color:  ColorRes.color030229),
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
