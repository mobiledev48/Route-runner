import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/appbar.dart';
import '../../common/common_text_fild.dart';
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
      appBar:AppBar(
        leading: IconButton(
            onPressed: () {
              //  Get.to(HomeScreen());
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
        centerTitle: true,
        backgroundColor: ColorRes.mainColor,
        title: Text(
          StringRes.collectionReport,
          style:  GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:  ColorRes.white),
        ),

        // automaticallyImplyLeading: false,
      ),
      body: GetBuilder<CollectionReportController>(
        id: 'collection',
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Container(width: Get.width * 0.9, height: Get.height * 0.06, child: CommomTextFormFeild()),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.allCollectionData.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: Get.width,
                              decoration:
                                  BoxDecoration(color: ColorRes.white, borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 20, left: 5,right: 10),
                                          child: locationController.customCheckbox(),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 20),
                                              Text(
                                                "${controller.allCollectionData[index].title}",
                                                // 'Moonlight Bar',
                                                style: GoogleFonts.nunito(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color:  ColorRes.black),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                "Employee: ${controller.allCollectionData[index].employeeName}",
                                                // 'Admin: Arrora gaur',
                                                style: GoogleFonts.nunito(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
                                                    color:  ColorRes.color030229),
                                              ),
                                              SizedBox(height: 2),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Machine: ${controller.allCollectionData[index].machine}',
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.w400,
                                                        color:  ColorRes.color030229),
                                                  ),
                                                  SizedBox(width: 3,),
                                                  Text(
                                                    'Beginning: ${controller.allCollectionData[index].machine}',
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.w400,
                                                        color:  ColorRes.color030229),
                                                  ),
                                                  SizedBox(width: 3,),
                                                  Text(
                                                    'Closed: ${controller.allCollectionData[index].machine}',
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.w400,
                                                        color:  ColorRes.color030229),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                "Address: ${ controller.allCollectionData[index].address}",
                                                // 'Admin: Arrora gaur',
                                                style: GoogleFonts.nunito(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
                                                    color:  ColorRes.color030229),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
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
                                            ),
                                            SizedBox(height: Get.height * 0.04),
                                            GestureDetector(
                                              onTap: () {
                                                // if (controller.nextPage == 0) {
                                                //   ListView.builder(
                                                //     itemBuilder: (context, index) {
                                                //       return Container(
                                                //         height: Get.height * 0.8,
                                                //         width: Get.width * 0.8,
                                                //         decoration: BoxDecoration(color: ColorRes.grey),
                                                //       );
                                                //     },
                                                //   );
                                                // }
                                                if(controller.isViewData[index] == false)
                                                  {
                                                    controller.isViewData[index] = true;
                                                  }
                                                else
                                                  {
                                                    controller.isViewData[index] = false;
                                                  }
                                                controller.update(['collection']);
                                              },
                                              child: controller.isViewData[index]? const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: ColorRes.grey,
                                                size: 22,
                                              ) :const Icon(
                                                Icons.keyboard_arrow_right,
                                                color: ColorRes.grey,
                                                size: 22,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  controller.isViewData[index]? SizedBox(height: 230,
                                    child: ListView.separated(
                                      itemCount:  controller.allCollectionData[index].machineDetails?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: Get.width * 0.9,
                                                  decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight: Radius.circular(10),
                                                      ),
                                                      color: ColorRes.grey2),
                                                  child: const Row(
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
                                                  decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(10),
                                                        bottomRight: Radius.circular(10),
                                                      ),
                                                      color: ColorRes.grey),
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
                                      }, separatorBuilder: (BuildContext context, int index) {
                                        return SizedBox(height: 10,);
                                    },
                                    ),
                                  ):SizedBox()
                                ],
                              ),
                            ),
                          )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




