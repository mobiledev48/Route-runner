import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
import '../../common/custom_checkbox.dart';
import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';
import '../location_view/location_controller.dart';
import 'collection_report_controller.dart';

class CollectionReportScreen extends StatelessWidget {
  CollectionReportScreen({super.key});
  LocationController locationController = Get.put(LocationController());
  CollectionReportController controller = Get.put(CollectionReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<CollectionReportController>(
          id: 'collection',
          builder: (controller) {
            return Column(
              children: [
                AppBars(
                  width: Get.width * 0.17,
                  title: StringRes.collectionReport,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Container(width: Get.width * 0.9, height: Get.height * 0.06, child: CommomTextFormFeild()),
                      SizedBox(
                        height: Get.height * 4,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _allData.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 220,
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
                                              child: CustomCheckbox(),
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
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                // SizedBox(height: 25),
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
                                                ),
                                                SizedBox(height: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (controller.nextPage == 0) {
                                                      ListView.builder(
                                                        itemBuilder: (context, index) {
                                                          return Container(
                                                            height: Get.height * 0.8,
                                                            width: Get.width * 0.8,
                                                            decoration: BoxDecoration(color: ColorRes.grey),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_forward_ios_rounded,
                                                    color: ColorRes.grey,
                                                    size: 15,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.18,
                                          child: ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: Get.width * 0.9,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(10),
                                                              topRight: Radius.circular(10),
                                                            ),
                                                            color: ColorRes.grey2),
                                                        child: Row(
                                                          children: [
                                                            Text('Machine- #1-876364'),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text('Current'),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text('Previous'),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text('Total'),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: Get.height * 0.12,
                                                        width: Get.width * 0.9,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                              bottomLeft: Radius.circular(10),
                                                              bottomRight: Radius.circular(10),
                                                            ),
                                                            color: ColorRes.grey),
                                                        child: Column(
                                                          children: [Text('data')],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                  // Stack(
                                                  //   children: [
                                                  //     Container(
                                                  //       height: Get.height * 0.8,
                                                  //       width: Get.width * 0.85,
                                                  //       decoration: BoxDecoration(
                                                  //           borderRadius: BorderRadius.circular(10),
                                                  //           color: ColorRes.grey),
                                                  //       child: Column(
                                                  //         children: [
                                                  //
                                                  //           Text('data')],
                                                  //       ),
                                                  //     ),
                                                  //     Container(
                                                  //       height: Get.height * 0.05,
                                                  //       width: Get.width * 0.85,
                                                  //       decoration: const BoxDecoration(
                                                  //           borderRadius: BorderRadius.only(
                                                  //             topLeft: Radius.circular(10),
                                                  //             topRight: Radius.circular(10),
                                                  //           ),
                                                  //           color: ColorRes.grey2),
                                                  //       child: const Row(
                                                  //         children: [
                                                  //           Text('Machine- #1-876364'),
                                                  //           SizedBox(
                                                  //             width: 15,
                                                  //           ),
                                                  //           Text('Current'),
                                                  //           SizedBox(
                                                  //             width: 5,
                                                  //           ),
                                                  //           Text('Previous'),
                                                  //           SizedBox(
                                                  //             width: 5,
                                                  //           ),
                                                  //           Text('Total'),
                                                  //           SizedBox(
                                                  //             width: 5,
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //     )
                                                  //   ],
                                                  // ),
                                                  );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
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
